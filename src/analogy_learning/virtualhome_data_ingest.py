from pathlib import Path
import re
import pickle

from src.counterfactual_analysis.cfc_helper import VHObject
from src.simulators import simulator_virtualhome

class VH_Task():
	def __init__(self, task, description, plan, preconditions=None):
		self.task = task
		self.description = description
		self.preconditions = preconditions
		self.plan = plan

class Action:
	def __init__(self, time, action, objects=None):
		if objects is None:
			objects = []
		self.time = time
		self.action = action
		self.objects = objects

	def print(self):
		object = ""
		if isinstance(self.objects, list):
			for o in self.objects:
				object += o + ", "
			object = object.rstrip(", ")
		elif isinstance(self.objects, str):
			object = self.objects
		print(str(self.time) + ") [" + self.action + "] " + object)

def parse_command(s):
	result = []
	# Extract action
	action_match = re.search(r"\[(.*?)\]", s)
	if action_match:
		result.append(action_match.group(1))

	# Extract parameters
	param_matches = re.findall(r"<([^>]+)>\s*\((\d+)\)", s)
	for name, number in param_matches:
		result.append(f"{name}{number}")

	return result

def pickle_virtualhome_data():
	tasks_folder = "src/programs_processed_precond_nograb_morepreconds/withoutconds"
	# tasks_folder = "src/programs_processed_precond_nograb_morepreconds/test_task"
	preconditions_folder = "src/programs_processed_precond_nograb_morepreconds/initstate"
	# preconditions_folder = "src/programs_processed_precond_nograb_morepreconds/test_cond"
	tasks = {}
	for path in Path(tasks_folder).rglob("*"):
		if path.is_file():
			with open(path, "r", encoding="utf-8") as file:
				lines = file.readlines()
				task = lines[0]
				desc = lines[1]
				lines.pop(0)
				lines.pop(0)
				while lines[0].isspace():
					lines.pop(0)
				actions = []
				time = 1
				for line in lines:
					action = parse_command(line)
					if len(action) == 0:
						continue
					if len(action) == 1:
						actions.append(Action(time, action[0]))
					else:
						a = action[0]
						action.pop(0)
						cleaned_actions = [s.replace("_", "") for s in action]
						actions.append(Action(time, a, objects=cleaned_actions))
					time = time + 1
				tasks[Path(path).stem] = VH_Task(task, desc, actions)
	for path in Path(preconditions_folder).rglob("*"):
		if path.is_file():
			with open(path, "r", encoding="utf-8") as file:
				lines = file.read()
				# TODO: read preconditions
	pickle.dump(tasks, open("src/analogy_learning/vh_tasks_db.pkl", 'wb'))

def unpickle_virtualhome_data(use_llm_data=True):
	loaded = {}
	if Path("src/analogy_learning/vh_tasks_db.pkl").is_file():
		loaded = pickle.load(open("src/analogy_learning/vh_tasks_db.pkl", 'rb'))
	return loaded

def print_virtualhome_data(data):
	for key in data:
		print(key + " " + str(data[key]))
		print(data[key].task)
		print(data[key].description)
		for action in data[key].plan:
			print(str(action.time) + " " + action.action)
			print(action.objects)

def pickle_virtualhome_objects():
	simulator = simulator_virtualhome.VirtualHomeSimulator(environment=0)
	graph = simulator.get_graph()
	objects = {}
	for node in graph["nodes"]:
		if node["class_name"] in objects:
			continue
		objects[node["class_name"]] = VHObject(node["class_name"], node["id"])
		if "GRABBABLE" in node["properties"]:
			objects[node["class_name"]].grabbable = True
		if "EATABLE" in node["properties"]:
			objects[node["class_name"]].eatable = True
		if "CAN_OPEN" in node["properties"]:
			objects[node["class_name"]].can_open = True
		if "SITTABLE" in node["properties"]:
			objects[node["class_name"]].sittable = True
		if "LIEABLE" in node["properties"]:
			objects[node["class_name"]].lieable = True
		if "MOVABLE" in node["properties"]:
			objects[node["class_name"]].movable = True
		if "SURFACES" in node["properties"]:
			objects[node["class_name"]].surfaces = True
		if "HAS_SWITCH" in node["properties"]:
			objects[node["class_name"]].has_switch = True
		if "ROOMS" == node["category"].upper():
			objects[node["class_name"]].rooms = True
		if "FLOOR"  == node["category"].upper():
			objects[node["class_name"]].floor = True
		if "WALLS" == node["category"].upper():
			objects[node["class_name"]].walls = True
		if "CEILING" == node["category"].upper():
			objects[node["class_name"]].ceiling = True
		if "DECOR" == node["category"].upper():
			objects[node["class_name"]].decor = True
		if "COVER_OBJECT" in node["properties"]:
			objects[node["class_name"]].cover_object = True
		if "LAMPS" == node["category"].upper():
			objects[node["class_name"]].lamps = True
		if "FURNITURE" == node["category"].upper():
			objects[node["class_name"]].furniture = True
		if "CONTAINERS" in node["properties"]:
			objects[node["class_name"]].containers = True
		if "DOORS" == node["category"].upper():
			objects[node["class_name"]].doors = True
		if "PROPS" == node["category"].upper():
			objects[node["class_name"]].props = True
		if "POURABLE" in node["properties"]:
			objects[node["class_name"]].pourable = True
		if "CREAM" in node["properties"]:
			objects[node["class_name"]].cream = True
		if "RECIPIENT" in node["properties"]:
			objects[node["class_name"]].recipient = True
		if "WINDOWS" == node["category"].upper():
			objects[node["class_name"]].windows = True
		if "HAS_PLUG" in node["properties"]:
			objects[node["class_name"]].has_plug = True
		if "ELECTRONICS" == node["category"].upper():
			objects[node["class_name"]].electronics = True
		if "APPLIANCES" == node["category"].upper():
			objects[node["class_name"]].appliances = True
		if "HANGABLE" in node["properties"]:
			objects[node["class_name"]].hangable = True
		if "CLOTHES" in node["properties"]:
			objects[node["class_name"]].clothes = True
		if "LOOKABLE" in node["properties"]:
			objects[node["class_name"]].lookable = True
		if "HAS_PAPER" in node["properties"]:
			objects[node["class_name"]].has_paper = True
		if "CUTTABLE" in node["properties"]:
			objects[node["class_name"]].cuttable = True
		if "READABLE" in node["properties"]:
			objects[node["class_name"]].readable = True
		if "CHARACTERS" == node["category"].upper():
			objects[node["class_name"]].characters = True
		if "FOOD" == node["category"].upper():
			objects[node["class_name"]].food = True
		if "DRINKABLE" in node["properties"]:
			objects[node["class_name"]].drinkable = True
	pickle.dump(objects, open("src/analogy_learning/vh_objects_db.pkl", 'wb'))

def unpickle_virtualhome_objects():
	data = {}
	if Path("src/analogy_learning/vh_objects_db.pkl").is_file():
		data = pickle.load(open("src/analogy_learning/vh_objects_db.pkl", 'rb'))
	if Path("src/analogy_learning/llm_objects_db.pkl").is_file():
		data = pickle.load(open("src/analogy_learning/llm_objects_db.pkl", 'rb')) | data
	return data

def print_virtualhome_objects(objects):
	for key in objects:
		print(key)
		objects[key].print(properties_only=True)
