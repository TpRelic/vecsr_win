import logging
import random
import re

from src.analogy_learning import virtualhome_data_ingest, nlp, llm
from src.counterfactual_analysis import cfc_helper, counterfactual_checker

def train_test_split_dict(data: dict, train_ratio=0.8, seed=None):
    keys = list(data.keys())

    if seed is not None:
        random.seed(seed)

    random.shuffle(keys)

    split_idx = int(len(keys) * train_ratio)

    train_keys = keys[:split_idx]
    test_keys = keys[split_idx:]

    train_data = {k: data[k] for k in train_keys}
    test_data = {k: data[k] for k in test_keys}

    return train_data, test_data

def counterfactual_verification(task, object_db):
    object_names = set()
    objects = []
    actions = []
    for action in task.plan:
        actions.append(cfc_helper.Action(action.time, action.action.lower(), action.objects[0].lower()))
        object_names.add(action.objects[0])
    # character1
    objects.append(cfc_helper.VHObject("character", 1, characters=True, inside=["kitchen1"]))
    for object in object_names:
        name_only = re.sub(r'\d+', '', object)
        name_only = name_only.replace("_", "")
        number_only = re.sub(r"\D", "", object)
        if not name_only in object_db:
            logging.warning("Not object in db: " + name_only)
            objects.append(cfc_helper.VHObject(name_only, number_only))
            continue
        temp_obj = object_db[name_only]
        temp_obj.set_number(number_only)
        objects.append(temp_obj)
    counterfactual_checker.counterfactual_checker(objects, actions, rule_file="scasp_knowledge_base/weak_counterfactual_analysis.pl")

def get_attributes_from_llm(object, llm, number=1):
    properties = [
        "grabbable", "eatable", "can_open", "sittable", "lieable",
        "movable", "surfaces", "has_switch", "rooms", "floor",
        "walls", "ceiling", "decor", "cover_object", "lamps",
        "furniture", "containers", "doors", "props", "pourable",
        "cream", "recipient", "windows", "has_plug", "electronics",
        "appliances", "hangable", "clothes", "lookable", "has_paper",
        "cuttable", "readable", "food", "drinkable"
        ]

    results = {}

    for prop in properties:
        if prop in [
        "grabbable", "eatable", "sittable", "lieable",
        "movable", "pourable", "hangable", "clothes",
        "readable", "food", "drinkable"
        ]:
            question = f"Answer yes or no: Is a {object} {prop}?"
        elif prop in ["surfaces", "rooms", "floor",
                      "walls", "ceiling", "decor", "lamps",
                      "furniture", "containers", "doors", "props",
                      "cream", "windows", "electronics",
                      "appliances"
                      ]:
            if prop.endswith("s"):
                word = prop[:-1]
            else:
                word = prop
            question = f"Answer yes or no: Is a {object} a {word}?"
        elif prop == "can_open":
            question = f"Answer yes or no: Is a {object} able to be opened?"
        elif prop == "has_switch":
            question = f"Answer yes or no: Is a {object} able to be switched on or off?"
        elif prop == "cover_object":
            question = f"Answer yes or no: Is a {object} used to cover another object?"
        elif prop == "recipient":
            question = f"Answer yes or no: Is a {object} able to hold another object within it?"
        elif prop == "has_plug":
            question = f"Answer yes or no: Is a {object} able to be plugged in?"
        elif prop == "lookable":
            question = f"Answer yes or no: Is a {object} something one would watch or look at?"
        elif prop == "has_paper":
            question = f"Answer yes or no: Is a {object} made of paper?"
        elif prop == "cuttable":
            question = f"Answer yes or no: Is a {object} something one could cut with a knife or scissors?"
        else:
            question = f"Answer yes or no: Is a {object} {prop}?"

        answer = llm.ask_llm(question).lower()

        results[prop] = "yes" in answer

    obj = cfc_helper.VHObject(type=object, number=number, **results)
    obj.print(properties_only=True)

    return obj

def test_llm_accuracy(objects_db, llm):
    total_number = 0
    number_completely_correct = 0
    aggregated_one_hot = [0 for _ in range(35)]
    total_score = 0
    total_precision = 0
    total_recall = 0
    total_accuracy = 0
    for object in objects_db:
        name = objects_db[object].name
        if "character" in name:
            continue
        second_obj = get_attributes_from_llm(name, llm)
        one_hot, total_positive, total_negative, true_positive, true_negative, false_positive, false_negative \
            = objects_db[object].compare_properties(second_obj)
        aggregated_one_hot = [a + b for a, b in zip(aggregated_one_hot, one_hot)]
        if sum(one_hot) == len(one_hot):
            number_completely_correct += 1
        total_score = total_score + sum(one_hot)
        total_number += 1
        if not (true_positive + false_positive == 0):
            total_precision += true_positive / (true_positive + false_positive)
        if not (true_positive + false_negative == 0):
            total_recall += true_positive / (true_positive + false_negative)
        total_accuracy += (true_positive + true_negative) / (true_positive + false_negative + false_positive + true_negative)
    average_score = (total_score/len(aggregated_one_hot))/total_number
    print("Final Results:")
    print("Number of objects: " + str(total_number))
    print("Number completely correct: " + str(number_completely_correct))
    print("Final aggregated one-hot matrix: " + str(aggregated_one_hot))
    print("Average Score: " + str(average_score))
    print("Total Score: " + str(total_score))
    print("Average Precision: " + str(total_precision/total_number))
    print("Average Recall: " + str(total_recall/total_number))
    print("Average Accuracy: " + str(total_accuracy/total_number))

def append_files(file1_path, file2_path, output_path):
    with open(file1_path, "r", encoding="utf-8") as f1:
        content1 = f1.read()
    with open(file2_path, "r", encoding="utf-8") as f2:
        content2 = f2.read()
    with open(output_path, "w", encoding="utf-8") as out:
        out.write(content1)
        out.write(content2)

if __name__ == '__main__':
    logging.basicConfig(format='%(levelname)s:%(message)s', level=logging.INFO)
    logging.info("Initializing databases...")
    # Ingest all VH Dataset Plans and VH Objects
    llm = llm.LocalLLM()
    # virtualhome_data_ingest.pickle_virtualhome_objects()
    # virtualhome_data_ingest.pickle_virtualhome_data()
    objects_db = virtualhome_data_ingest.unpickle_virtualhome_objects()
    test_llm_accuracy(objects_db, llm)
    exit(0)
    tasks_db = virtualhome_data_ingest.unpickle_virtualhome_data()
    # Split Training and Test Data
    logging.info("Splitting test and training data...")
    train, test = train_test_split_dict(tasks_db, train_ratio=.999, seed=15)
    # For each item in the test dataset...
    for task in test:
        sim_key, similar = nlp.get_similar(test[task].task, train)
        logging.info("Learning task \"" + test[task].task.replace("\n","") + "\" from \"" + similar.replace("\n","") + "\"")
        # OPTIONAL: Verify validity of example task
        # example_valid = counterfactual_verification(train[sim_key], objects_db)
        # logging.info("Example validity: " + str(example_valid))
        # Get all objects in training task
        object_names = set()
        for action in train[sim_key].plan:
            object_names.add(action.objects[0])
        logging.info("Valid objects: " + str(object_names))
        for object in object_names:
            name_only = re.sub(r'\d+', '', object)
            name_only = name_only.replace("_", "")
            number_only = re.sub(r"\D", "", object)
            if not name_only in objects_db:
                logging.warning("Object not in DB: " + name_only)
                logging.warning("Asking LLM for information...")
                get_attributes_from_llm(name_only, llm, number=int(number_only))
                continue
        # Find similar objects
        append_files("scasp_knowledge_base/observed_objects_db.pl",
                     "scasp_knowledge_base/llm_objects_db.pl",
                     "scasp_knowledge_base/generated_scasp.pl")
        # Use NLP (spacy?) to identify most relevant objects
        # Verify validity of generated task
