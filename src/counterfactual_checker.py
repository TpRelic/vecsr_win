import re
import cfc_helper

from scaspharness import ScaspHarness
from simulator_virtualhome import MockVirtualHomeSimulator

rooms = ["bathroom11", "bedroom74", "kitchen207", "livingroom336"]

class Action:
	def __init__(self, time, action, object="none"):
		self.time = time
		self.action = action
		self.object = object

	def get_scasp(self, include_action=True):
		rule = "time(" + str(self.time) + ").\n"
		if include_action:
			rule = rule + "action_done(" + self.action + ", " + self.object + ", " + str(self.time) + ").\n"
		return rule

class VHObject:
	def __init__(self, type, number,
	             grabbable=False, eatable=False, can_open=False, sittable=False,
	             lieable=False, movable=False, surfaces=False, has_switch=False,
	             rooms=False, floor=False, walls=False, ceiling=False,
	             decor=False, cover_object=False, lamps=False, furniture=False,
	             containers=False, doors=False, props=False, pourable=False,
	             cream=False, recipient=False, windows=False, has_plug=False,
	             electronics=False, appliances=False, hangable=False, clothes=False,
	             lookable=False, has_paper=False, cuttable=False, readable=False,
	             characters=False, food=False, drinkable=False,
	             closed=False, open=False, on=False, off=False, held=False,
	             sat_on=False, laid_on = False, used=False, eaten=False,
	             sitting=False, laying=False,
	             inside=None, ontopof=None, close=None, facing=None):
		self.name = type + str(number)
		self.type = type
		self.number = number

		# Immutable properties
		self.grabbable = grabbable
		self.eatable = eatable
		self.can_open = can_open
		self.sittable = sittable
		self.lieable = lieable
		self.movable = movable
		self.surfaces = surfaces
		self.has_switch = has_switch
		self.rooms = rooms
		self.floor = floor
		self.walls = walls
		self.ceiling = ceiling
		self.decor = decor
		self.cover_object = cover_object
		self.lamps = lamps
		self.furniture = furniture
		self.containers = containers
		self.doors = doors
		self.props = props
		self.pourable = pourable
		self.cream = cream
		self.recipient = recipient
		self.windows = windows
		self.has_plug = has_plug
		self.electronics = electronics
		self.appliances = appliances
		self.hangable = hangable
		self.clothes = clothes
		self.lookable = lookable
		self.has_paper = has_paper
		self.cuttable = cuttable
		self.readable = readable
		self.characters = characters
		self.food = food
		self.drinkable = drinkable

		# Temporary states
		self.closed = closed
		self.open = open
		self.on = on
		self.off = off
		self.held = held
		self.sat_on = sat_on
		self.laid_on = laid_on
		self.used = used
		self.eaten = eaten
		self.sitting = sitting
		self.laying = laying
		if inside is None:
			self.inside = []
		else:
			self.inside = inside
		if ontopof is None:
			self.ontopof = []
		else:
			self.ontopof = ontopof
		if close is None:
			self.close = []
		else:
			self.close = close
		if facing is None:
			self.facing = []
		else:
			self.facing = facing

	def get_scasp(self, actions=None):
		rules = "type(" + self.name + ", " + self.type + ").\n"
		if self.grabbable:
			rules = rules + "grabbable(" + self.name + ").\n"
		if self.eatable:
			rules = rules + "eatable(" + self.name + ").\n"
		if self.can_open:
			rules = rules + "can_open(" + self.name + ").\n"
		if self.sittable:
			rules = rules + "sittable(" + self.name + ").\n"
		if self.lieable:
			rules = rules + "lieable(" + self.name + ").\n"
		if self.movable:
			rules = rules + "movable(" + self.name + ").\n"
		if self.surfaces:
			rules = rules + "surfaces(" + self.name + ").\n"
		if self.has_switch:
			rules = rules + "has_switch(" + self.name + ").\n"
		if self.rooms:
			rules = rules + "rooms(" + self.name + ").\n"
		if self.floor:
			rules = rules + "floor(" + self.name + ").\n"
		if self.walls:
			rules = rules + "walls(" + self.name + ").\n"
		if self.ceiling:
			rules = rules + "ceiling(" + self.name + ").\n"
		if self.decor:
			rules = rules + "decor(" + self.name + ").\n"
		if self.cover_object:
			rules = rules + "cover_object(" + self.name + ").\n"
		if self.lamps:
			rules = rules + "lamps(" + self.name + ").\n"
		if self.furniture:
			rules = rules + "furniture(" + self.name + ").\n"
		if self.containers:
			rules = rules + "containers(" + self.name + ").\n"
		if self.doors:
			rules = rules + "doors(" + self.name + ").\n"
		if self.props:
			rules = rules + "props(" + self.name + ").\n"
		if self.pourable:
			rules = rules + "pourable(" + self.name + ").\n"
		if self.cream:
			rules = rules + "cream(" + self.name + ").\n"
		if self.recipient:
			rules = rules + "recipient(" + self.name + ").\n"
		if self.windows:
			rules = rules + "windows(" + self.name + ").\n"
		if self.has_plug:
			rules = rules + "has_plug(" + self.name + ").\n"
		if self.electronics:
			rules = rules + "electronics(" + self.name + ").\n"
		if self.appliances:
			rules = rules + "appliances(" + self.name + ").\n"
		if self.hangable:
			rules = rules + "hangable(" + self.name + ").\n"
		if self.clothes:
			rules = rules + "clothes(" + self.name + ").\n"
		if self.lookable:
			rules = rules + "lookable(" + self.name + ").\n"
		if self.has_paper:
			rules = rules + "has_paper(" + self.name + ").\n"
		if self.cuttable:
			rules = rules + "cuttable(" + self.name + ").\n"
		if self.readable:
			rules = rules + "readable(" + self.name + ").\n"
		if self.characters:
			rules = rules + "characters(" + self.name + ").\n"
		if self.food:
			rules = rules + "food(" + self.name + ").\n"
		if self.drinkable:
			rules = rules + "drinkable(" + self.name + ").\n"
		rules = rules + self.time_scasp_helper(self.name, 0, closed = self.closed, open = self.open, on = self.on, off = self.off,
	                      held = self.held, sat_on = self.sat_on, laid_on = self.laid_on, used = self.used, eaten = self.eaten,
	                      sitting = self.sitting, laying = self.laying,
	                      inside = self.inside, ontopof = self.ontopof, close = self.close, facing = self.facing)
		if actions:
			closed = self.closed
			open = self.open
			on = self.on
			off = self.off
			held = self.held
			sat_on = self.sat_on
			laid_on = self.laid_on
			used = self.used
			eaten = self.eaten
			sitting = self.sitting
			laying = self.laying
			inside = self.inside
			ontopof = self.ontopof
			close = self.close
			facing = self.facing
			for action in actions:
				# If we are a character, do...
				if self.type == "character":
					if action.action == "walk" and action.object in rooms:
						inside = [action.object]
					elif action.action == "walk":
						close = [action.object]
					# elif action.action == "grab":
					# 	continue
					elif action.action == "sit":
						sitting = True
					elif action.action == "lie":
						laying = True
					elif action.action == "standup":
						sitting = False
						laying = False
					# elif action.action == "put":
					# 	continue
					# elif action.action == "switch_on":
					# 	continue
					# elif action.action == "switch_off":
					# 	continue
					# elif action.action == "use":
					# 	continue
					# elif action.action == "eat":
					# 	continue
					# elif action.action == "open":
					# 	continue
					# elif action.action == "close":
					# 	continue
				# If the action is being enacted on us...
				elif self.name == action.object:
					if action.action == "walk" and held and action.object in rooms:
						inside = [action.object]
					elif action.action == "walk" and held:
						close = [action.object]
					elif action.action == "grab":
						held = True
						ontopof = []
						inside = [x for x in inside if x in rooms]
					elif action.action == "sit":
						sat_on = True
					elif action.action == "lie":
						laid_on = True
					elif action.action == "standup":
						sat_on = False
						laid_on = False
					elif action.action == "switch_on":
						on = True
						off = False
					elif action.action == "switch_off":
						on = False
						off = True
					elif action.action == "use":
						used = True
					elif action.action == "eat":
						eaten = True
					elif action.action == "open":
						open = True
						closed = False
					elif action.action == "close":
						open = False
						closed = True
				elif held:
					if action.action == "walk" and action.object in rooms:
						inside = [action.object, "character1"]
					elif action.action == "walk":
						close = [action.object, "character1"]
					elif action.action == "put":
						ontopof.append(action.object)
						held = False
				elif action.action == "walk" and action.object in close:
					close.append("character1")
				rules = rules + self.time_scasp_helper(self.name, action.time, closed=closed, open=open, on=on, off=off,
				                       held=held, sat_on=sat_on, laid_on=laid_on, used=used,
				                       eaten=eaten,
				                       sitting=sitting, laying=laying,
				                       inside=inside, ontopof=ontopof, close=close, facing=facing)
		return rules

	@staticmethod
	def time_scasp_helper(name, time, closed = False, open = False, on = False, off = False,
	                      held = False, sat_on = False, laid_on = False, used = False, eaten = False,
	                      sitting = False, laying = False,
	                      inside = None, ontopof = None, close = None, facing = None):
		rules = ""
		if closed:
			rules = rules + "closed(" + name + ", " + str(time) + ").\n"
		if open:
			rules = rules + "open(" + name + ", " + str(time) + ").\n"
		if on:
			rules = rules + "on(" + name + ", " + str(time) + ").\n"
		if off:
			rules = rules + "off(" + name + ", " + str(time) + ").\n"
		if held:
			rules = rules + "held(" + name + ", " + str(time) + ").\n"
		if sat_on:
			rules = rules + "sat_on(" + name + ", " + str(time) + ").\n"
		if laid_on:
			rules = rules + "laid_on(" + name + ", " + str(time) + ").\n"
		if used:
			rules = rules + "used(" + name + ", " + str(time) + ").\n"
		if eaten:
			rules = rules + "eaten(" + name + ", " + str(time) + ").\n"
		if sitting:
			rules = rules + "sitting(" + name + ", " + str(time) + ").\n"
		if laying:
			rules = rules + "laying(" + name + ", " + str(time) + ").\n"

		if inside:
			for i in inside:
				rules = rules + "inside(" + name + ", " + i + ", " + str(time) + ").\n"
		if ontopof:
			for i in ontopof:
				rules = rules + "ontopof(" + name + ", " + i + ", " + str(time) + ").\n"
		if close:
			for i in close:
				rules = rules + "close(" + name + ", " + i + ", " + str(time) + ").\n"
		if facing:
			for i in facing:
				rules = rules + "facing(" + name + ", " + i + ", " + str(time) + ").\n"
		return rules

if __name__ == '__main__':
	fake_sim = MockVirtualHomeSimulator()
	scasp = ScaspHarness(fake_sim)
	objects = []
	# rooms
	for room in rooms:
		name = re.sub(r'\d+', '', room)
		number = re.sub('\D', '', room)
		objects.append(VHObject(name, number, rooms=True))
	# character1
	objects.append(VHObject("character", 1, characters=True, inside=["kitchen207"]))

	# Possible setups
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
	# objects, actions = cfc_helper.gpt_change_sheets_and_pillow_cases(objects)
	# objects, actions = cfc_helper.gpt_wash_dirty_dishes(objects)
	# objects, actions = cfc_helper.gpt_feed_me(objects)
	# objects, actions = cfc_helper.gpt_breakfast(objects)
	objects, actions = cfc_helper.gpt_read(objects)

	rules = ""
	for action in actions:
		rules = rules + action.get_scasp(include_action=False)
	for object in objects:
		rules = rules + object.get_scasp(actions)
	other_rules = open("scasp_knowledge_base/counterfactual_analysis.pl", "r")
	rules = rules + other_rules.read()
	other_rules.close()
	for action in actions:
		f = open("scasp_knowledge_base/generated_scasp.pl", "w")
		f.write(rules)
		f.write("\n\n?- action_possible(" + action.action + "," + action.object + "," + str(action.time - 1) + ").")
		f.close()
		print(str(action.time) + " " + str(scasp.run_generated_scasp()))
		rules = rules + "\naction_done(" + action.action + "," + action.object + "," + str(action.time - 1) + ")."