import logging
import re


from src.counterfactual_analysis import cfc_helper
from src.scasp_functions.scaspharness import ScaspHarness
from src.simulators.simulator_virtualhome import MockVirtualHomeSimulator

rooms = ["bathroom11", "bedroom74", "kitchen207", "livingroom336"]

def format_objects_and_actions(actions, relevant, real_simulator):
	objects = []
	# rooms
	for room in rooms:
		name = re.sub(r'\d+', '', room)
		number = re.sub('\D', '', room)
		objects.append(cfc_helper.VHObject(name, number, rooms=True))
	# character1
	objects.append(cfc_helper.VHObject("character", 1, characters=True, inside=["kitchen207"]))
	for object in relevant:
		obj = cfc_helper.get_non_sim_object(object)
		if obj:
			objects.append(obj)
			continue
		name = "".join(ch for ch in object if ch.isalpha())
		id = "".join(ch for ch in object if ch.isdigit())
		node = real_simulator.check_for_node(real_simulator.get_graph(), identifier=id, class_name=name)
		if node:
			# TODO
			print(node)
	time = 1
	new_actions = []
	for action in actions:
		if action:
			if "put" in action:
				new_actions.append(cfc_helper.Action(time, "put", action.split(",")[-1]))
			else:
				if "(" in action:
					new_actions.append(cfc_helper.Action(time, action.split("(")[0].replace(",", ""), action.split("(")[1].replace(",", "")))
				else:
					new_actions.append(cfc_helper.Action(time, action.replace(",", "")))
			time = time + 1
	return objects, new_actions


def counterfactual_checker(objects, actions, rule_file="scasp_knowledge_base/counterfactual_analysis.pl"):
	fake_sim = MockVirtualHomeSimulator()
	scasp = ScaspHarness(fake_sim)

	rules = ""
	for action in actions:
		rules = rules + action.get_scasp(include_action=False)
	for object in objects:
		rules = rules + object.get_scasp(actions)
	other_rules = open(rule_file, "r")
	rules = rules + other_rules.read()
	other_rules.close()
	for action in actions:
		f = open("scasp_knowledge_base/generated_scasp.pl", "w")
		f.write(rules)
		f.write("\n\n?- action_possible(" + action.action + "," + action.object + "," + str(action.time - 1) + ").")
		f.close()
		result, _ = scasp.run_generated_scasp()
		if result == None:
			result = "Success"
		logging.debug(str(action.time) + " " + str(result))
		if result == False:
			logging.warning("Failed action, investigating.")
			investigate_failure(scasp)
			return False
		rules = rules + "\naction_done(" + action.action + "," + action.object + "," + str(action.time - 1) + ")."
	logging.info("Plan is valid")
	return True

def investigate_failure(scasp):
	scasp.scasp_runner = "scasp_knowledge_base/test_justification.sh"
	with open("scasp_knowledge_base/generated_scasp.pl") as f: d = f.read()
	with open("scasp_knowledge_base/generated_scasp.pl", "w") as f: f.write(d.replace("?-", "?- not"))
	_, output = scasp.run_generated_scasp()
	logging.error(output)

if __name__ == '__main__':
	objects = []
	# rooms
	for room in rooms:
		name = re.sub(r'\d+', '', room)
		number = re.sub('\D', '', room)
		objects.append(cfc_helper.VHObject(name, number, rooms=True))
	# character1
	objects.append(cfc_helper.VHObject("character", 1, characters=True, inside=["kitchen207"]))
	# Some possible setups (others stored elsewhere for size convenience)
	# objects, actions = cfc_helper.vecsr_put_shoes_and_coat(objects)
	# objects, actions = cfc_helper.huang_change_sheets_and_pillowcases(objects)
	# objects, actions = cfc_helper.vecsr_have_iced_coffee(objects)
	# objects, actions, = cfc_helper.vecsr_get_in_way_of_guests_trying_to_leave(objects)
	# objects, actions = cfc_helper.vecsr_prepare_letter_for_mailing(objects)
	# objects, actions = cfc_helper.gpt_go_to_sleep(objects)
	# objects, actions = cfc_helper.gpt_browse_internet(objects)
	# objects, actions = cfc_helper.gpt_wash_teeth(objects)
	# objects, actions = cfc_helper.gpt_brush_teeth(objects)
	# objects, actions = cfc_helper.gpt_vacuum(objects)
	# objects, actions = cfc_helper.gpt_wash_dirty_dishes(objects)
	# objects, actions = cfc_helper.gpt_feed_me(objects)
	# objects, actions = cfc_helper.gpt_breakfast(objects)
	# objects, actions = cfc_helper.gpt_read(objects)
	# objects, actions = cfc_helper.huang_go_to_sleep(objects)
	# objects, actions = cfc_helper.huang_browse_internet(objects)
	# objects, actions = cfc_helper.huang_wash_teeth(objects)
	# objects, actions = cfc_helper.huang_brush_teeth(objects)
	# objects, actions = cfc_helper.huang_vacuum(objects)
	# objects, actions = cfc_helper.huang_change_sheets_and_pillowcases(objects)
	# objects, actions = cfc_helper.huang_wash_dirty_dishes(objects)
	# objects, actions = cfc_helper.huang_feed_me(objects)
	# objects, actions = cfc_helper.huang_breakfast(objects)
	# objects, actions = cfc_helper.huang_read(objects)
	objects, actions = cfc_helper.just_walk(objects)
	counterfactual_checker(objects, actions)