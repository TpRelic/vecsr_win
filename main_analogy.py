import logging
import random
import re

from src.analogy_learning import virtualhome_data_ingest
from src.analogy_learning import nlp
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
        number_only = re.sub(r"\D", "", object)
        if not name_only in object_db:
            logging.warning("Not object in db: " + name_only)
            objects.append(cfc_helper.VHObject(name_only, number_only))
            continue
        temp_obj = object_db[name_only]
        temp_obj.set_number(number_only)
        objects.append(temp_obj)
    counterfactual_checker.counterfactual_checker(objects, actions, rule_file="scasp_knowledge_base/weak_counterfactual_analysis.pl")

if __name__ == '__main__':
    logging.basicConfig(format='%(levelname)s:%(message)s', level=logging.INFO)
    logging.info("Initializing databases...")
    # virtualhome_data_ingest.pickle_virtualhome_objects()
    # virtualhome_data_ingest.pickle_virtualhome_data()
    objects = virtualhome_data_ingest.unpickle_virtualhome_objects()
    tasks = virtualhome_data_ingest.unpickle_virtualhome_data()
    logging.info("Splitting test and training data...")
    train, test = train_test_split_dict(tasks, seed=10)
    sim_key, similar = nlp.get_similar(test["split38_2"].task, train)
    logging.info("Learning task \"" + test["split38_2"].task.replace("\n","") + "\" from \"" + similar.replace("\n","") + "\"")
    counterfactual_verification(train[sim_key], objects)
