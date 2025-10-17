from counterfactual_checker import VHObject, Action

def vecsr_put_shoes_and_coat(objects):
	# Put shoes and coat
	# shoe3203
	objects.append(
		VHObject("shoe", 3203, clothes=True, grabbable=True, movable=True, inside=["bedroom74"], ontopof=["floor75"]))
	# shoe3204
	objects.append(
		VHObject("shoe", 3204, clothes=True, grabbable=True, movable=True, inside=["bedroom74"], ontopof=["floor75"]))
	# coat3205
	objects.append(VHObject("coat", 3205, clothes=True, grabbable=True, movable=True, inside=["bedroom74", "closet114"],
	                        ontopof=["closetdrawer122"]))
	# floor75
	objects.append(VHObject("floor", 75, surfaces=True, floor=True, inside=["bedroom74"]))
	# closetdrawer122
	objects.append(
		VHObject("closetdrawer", 122, furniture=True, inside=["closet114", "bedroom74"], ontopof=["closetdrawer125"]))
	# closet114
	objects.append(
		VHObject("closet", 114, closed=True, can_open=True, containers=True, furniture=True, inside=["bedroom74"]))

	# Actions:
	# walk(bedroom74),walk(shoe3203),grab(shoe3203),walk(shoe3204),grab(shoe3204),walk(character1),put(shoe3203,character1),
	# put(shoe3204,character1),walk(coat3205),grab(coat3205),walk(character1),put(coat3205,character1)
	actions = [Action(1, "walk", "bedroom74"), Action(2, "walk", "shoe3203"), Action(3, "grab", "shoe3203"),
	           Action(4, "walk", "shoe3204"), Action(5, "grab", "shoe3204"), Action(6, "walk", "character1"),
	           Action(7, "put", "character1"), Action(8, "put", "character1"), Action(9, "walk", "coat3205"),
	           Action(10, "grab", "coat3205"), Action(11, "walk", "character1"), Action(12, "put", "character1")]

	return objects, actions

def vecsr_have_iced_coffee(objects):
	# mug196
	objects.append(VHObject("mug", 196, grabbable=True, recipient=True, pourable=True, movable=True, props=True,
	                        inside=["bedroom74"], ontopof=["desk110"]))
	# icedcoffee3217
	objects.append(VHObject("icedcoffee", 3217, drinkable=True, pourable=True, inside=["mug196"]))

	# walk(bedroom74),walk(mug196),eat(mug196)
	actions = [Action(1, "walk", "bedroom74"), Action(2, "walk", "mug196"), Action(3, "eat", "mug196")]
	return objects, actions

def vecsr_get_in_way_of_guests_trying_to_leave(objects):
	# Plan
	# walk(character2)
	actions = [Action(1, "walk", "character2")]
	return objects, actions

def vecsr_prepare_letter_for_mailing(objects):
	# paper303
	objects.append(VHObject("paper", 303, grabbable=True, readable=True, has_paper=True, movable=True, props=True,
	                        inside=["kitchen207"], close=["character1"], ontopof=["bookshelf250"]))
	# envelope3218
	objects.append(VHObject("envelope", 3218, recipient=True, grabbable=True, movable=True, inside=["bedroom74"]))
	# mailbox3219
	objects.append(VHObject("mailbox", 3219, recipient=True))
	# Plan
	# grab(paper303),walk(bedroom74),walk(envelope3218),grab(envelope3218),put(paper303,envelope3218),walk(kitchen207),
	# walk(bedroom74),walk(kitchen207),walk(mailbox3219),put(envelope3218,mailbox3219)
	actions = [Action(1, "grab", "paper303"), Action(2, "walk", "bedroom74"), Action(3, "walk", "envelope3218"),
	           Action(4, "grab", "envelope3218"), Action(5, "put", "envelope3218"), Action(6, "walk", "kitchen207"),
	           Action(7, "walk", "bedroom74"), Action(8, "walk", "kitchen207"), Action(9, "walk", "mailbox3219"),
	           Action(10, "put", "mailbox3219")]
	return objects, actions

def gpt_go_to_sleep(objects):
	# bed111
	objects.append(
		VHObject("bed", 111, surfaces=True, sittable=True, lieable=True, furniture=True, inside=["bedroom74"],
		         ontopof=["floor76"]))
	# Task: Go to sleep - 83.33%
	# Step 1: Walk to bedroom (or wherever you sleep).
	# Step 2: Prepare the sleeping area (e.g., adjust pillows, blankets).
	# Step 3: Lie down in bed.
	# Step 4: Close your eyes and relax your body.
	# Step 5: Breathe deeply and allow yourself to drift off to sleep.
	actions = [Action(1, "walk", "bedroom74"), Action(2, "walk", "bed111"), Action(3, "lie", "bed111"),
	           Action(4, "use", "bed111")]
	return objects, actions

def gpt_browse_internet(objects):
	# chair109
	objects.append(VHObject("chair", 109, surfaces=True, grabbable=True, sittable=True, movable=True, furniture=True,
	                        inside=["bedroom74"], close=["computer176", "mouse172"]))
	# computer176
	objects.append(VHObject("computer", 176, off=True, has_switch=True, lookable=True, electronics=True,
	                        inside=["bedroom74"], close=["chair109", "mouse172"]))
	# mouse172
	objects.append(VHObject("mouse", 172, grabbable=True, has_plug=True, movable=True, electronics=True,
	                        inside=["bedroom74"], close=["chair109", "computer176"]))

	# Task: Browse internet
	# Step 1: Walk to your home office.
	# Step 2: Walk to your chair.
	# Step 3: Find your chair.
	# Step 4: Sit on the chair.
	# Step 5: Find your computer.
	# Step 6: Switch on the computer.
	# Step 7: Find your mouse.
	# Step 8: Grab your mouse.
	# Step 9: Open a web browser (e.g., Chrome, Firefox, Safari).
	# Step 10: Use the mouse and/or keyboard to type the website or search query you want to browse.
	actions = [Action(1, "walk", "bedroom74"), Action(2, "walk", "chair109"), Action(3, "find", "chair109"),
	           Action(4, "sit", "chair109"), Action(5, "find", "computer176"), Action(6, "switch_on", "computer176"),
	           Action(7, "find", "mouse172"), Action(8, "grab", "mouse172"), Action(9, "use", "computer176"),
	           Action(10, "use", "mouse172")]
	return objects, actions

def gpt_wash_teeth(objects):
	# bathroomcounter50
	objects.append(VHObject("bathroomcounter", 50, closed=True, surfaces=True, furniture=True,
	                        inside=["bathroom11"], close=["faucet51", "toothbrush66", "toothpaste63"]))
	# faucet51
	objects.append(VHObject("faucet", 51, off=True, has_switch=True, furniture=True,
	                        inside=["bathroom11"], close=["bathroomcounter50", "toothbrush66", "toothpaste63"]))
	# toothbrush66
	objects.append(VHObject("toothbrush", 66, grabbable=True, recipient=True, movable=True, props=True,
	                        inside=["bathroom11"], close=["bathroomcounter50", "faucet51", "toothpaste63"]))
	# toothpaste63
	objects.append(VHObject("toothpaste", 63, closed=True, grabbable=True, pourable=True, can_open=True, movable=True,
	                        cream=True, props=True, inside=["bathroom11"], close=["bathroomcounter50", "faucet51", "toothbrush66"]))
	# Task: Wash teeth - 16.67%
	# Step 1: Walk to bathroom
	# Step 2: Walk to sink
	# Step 3: Find faucet
	# Step 4: Switch on faucet
	# Step 5: Grab toothbrush
	# Step 6: Find toothpaste
	# Step 7: Open toothpaste cap
	# Step 8: Squeeze toothpaste onto toothbrush
	# Step 9: Close toothpaste cap
	# Step 10: Put toothbrush into mouth
	# Step 11: Brush teeth thoroughly (front, back, sides, and chewing surfaces)
	# Step 12: Spit out toothpaste residue into sink
	# Step 13: Rinse toothbrush under faucet
	# Step 14: Switch off faucet
	# Step 15: Rinse mouth with water and spit
	# Step 16: Put toothbrush and toothpaste back in their place
	actions = [Action(1, "walk", "bathroom11"), Action(2, "walk", "bathroomcounter50"), Action(3, "find", "faucet51"),
	           Action(4, "switch_on", "faucet51"), Action(5, "grab", "toothbrush66"), Action(6, "open", "toothpaste63"),
	           Action(7, "use", "toothpaste63"), Action(8, "close", "toothpaste63"), Action(9, "use", "toothbrush66"), # 10-12
	           Action(10, "use", "faucet51"), Action(11, "switch_off", "faucet51"), Action(12, "use", "faucet51"),
	           Action(13, "put", "toothbrush66")]
	return objects, actions

def gpt_brush_teeth(objects):
	# bathroomcounter50
	objects.append(VHObject("bathroomcounter", 50, closed=True, surfaces=True, furniture=True,
	                        inside=["bathroom11"], close=["faucet51", "toothbrush66", "toothpaste63"]))
	# faucet51
	objects.append(VHObject("faucet", 51, off=True, has_switch=True, furniture=True,
	                        inside=["bathroom11"], close=["bathroomcounter50", "toothbrush66", "toothpaste63"]))
	# toothbrush66
	objects.append(VHObject("toothbrush", 66, grabbable=True, recipient=True, movable=True, props=True,
	                        inside=["bathroom11"], close=["bathroomcounter50", "faucet51", "toothpaste63"]))
	# toothpaste63
	objects.append(VHObject("toothpaste", 63, closed=True, grabbable=True, pourable=True, can_open=True, movable=True,
	                        cream=True, props=True, inside=["bathroom11"], close=["bathroomcounter50", "faucet51", "toothbrush66"]))
	# Task: Brush Teeth - 91.67%
	# Step 1: Walk to the bathroom.
	# Step 2: Walk to the sink.
	# Step 3: Locate your toothbrush.
	# Step 4: Pick up the toothbrush.
	# Step 5: Find toothpaste.
	# Step 6: Open the toothpaste cap.
	# Step 7: Squeeze a pea-sized amount of toothpaste onto the toothbrush.
	# Step 8: Close the toothpaste cap and put it back.
	# Step 9: Turn on the faucet.
	# Step 10: Briefly wet the toothbrush bristles under running water (optional).
	# Step 11: Turn off the faucet.
	# Step 12: Place the toothbrush in your mouth.
	# Step 13: Brush your teeth using circular motions, making sure to clean all surfaces (front, back, and chewing surfaces) for at least 2 minutes.
	# Step 14: Brush your tongue gently to remove bacteria.
	# Step 15: Turn on the faucet again.
	# Step 16: Rinse your mouth with water.
	# Step 17: Spit out the water into the sink.
	# Step 18: Rinse your toothbrush under the faucet.
	# Step 19: Turn off the faucet.
	# Step 20: Put the toothbrush back in its holder.
	# Step 21: Wipe your mouth with a towel if needed.
	actions = [Action(1, "walk", "bathroom11"), Action(2, "walk", "bathroomcounter50"), Action(3, "find", "toothbrush66"),
	           Action(4, "grab", "toothbrush66"), Action(5, "find", "toothpaste63"), Action(6, "open", "toothpaste63"),
	           Action(7, "use", "toothpaste63"), Action(8, "close", "toothpaste63"), Action(9, "switch_on", "faucet51"),
	           Action(10, "use", "faucet51"), Action(11, "switch_off", "faucet51"), Action(12, "use", "toothbrush66"),
	           Action(13, "switch_on", "faucet51"), Action(14, "use", "faucet51"), Action(15, "switch_off", "faucet51"),
	           Action(16, "put", "toothbrush66")]
	return objects, actions

def gpt_vacuum(objects):
	# vacuum10
	objects.append(VHObject("vacuum,", 10, has_switch=True, grabbable=True, has_plug=True, movable=True, off=True,
	                        inside=["bedroom74"]))
	# Task: Vacuum - 83.33%
	# Step 1: Walk to the storage area where the vacuum cleaner is kept.
	# Step 2: Locate the vacuum cleaner.
	# Step 3: Plug the vacuum cleaner into a nearby power outlet.
	# Step 4: Turn on the vacuum cleaner.
	# Step 5: Begin vacuuming the designated area (e.g., carpet, floor, rug).
	# Step 6: Move the vacuum cleaner methodically to cover all areas.
	# Step 7: Check for missed spots and re-vacuum if necessary.
	# Step 8: Turn off the vacuum cleaner.
	# Step 9: Unplug the vacuum cleaner and return it to its storage location.
	# Step 10: Empty the vacuum cleaner’s dust compartment or replace the bag if needed.
	actions = [Action(1, "walk", "bedroom74"), Action(2, "walk", "vacuum10"), Action(3, "switch_on", "vacuum10"),
	           Action(4, "use", "vacuum10"), Action(5, "switch_off", "vacuum10"), Action(6, "walk", "bedroom74"),
	           Action(7, "put", "vacuum10")]
	return objects, actions

def gpt_change_sheets_and_pillow_cases(objects):
	objects[-1].inside = ["bedroom74"]
	objects[-1].close = ["bed111", "sheets1", "pillowcase11", "sheets2", "pillowcase12", "laundryhamper20", "closet114"]
	# bed111
	objects.append(
		VHObject("bed", 111, surfaces=True, sittable=True, lieable=True, furniture=True, inside=["bedroom74"],
		         ontopof=["floor76"], close=["sheets1", "pillowcase11"]))
	# sheets1
	objects.append(VHObject("sheets", 1, grabbable=True, movable=True,
	                        inside=["bedroom74"], ontopof=["bed111"], close=["bed111", "pillowcase11"]))
	# pillowcase11
	objects.append(VHObject("pillowcase", 11, grabbable=True, movable=True,
	                        inside=["bedroom74"], close=["sheets1", "sheets1"]))
	# sheets2
	objects.append(VHObject("sheets", 2, grabbable=True, movable=True, inside=["bedroom74"], ontopof=["bed111"]))
	# pillowcase12
	objects.append(VHObject("pillowcase", 12, grabbable=True, movable=True, inside=["bedroom74"]))
	# laundryhamper20
	objects.append(VHObject("laundryhamper", 20, grabbable=True, movable=True, recipient=True, inside=["bedroom74"]))
	# closet114
	objects.append(
		VHObject("closet", 114, open=True, can_open=True, containers=True, furniture=True, inside=["bedroom74"]))
	# Task: Change sheets and pillow cases - 91.67%
	# Remove any pillows from the bed.
	# Take off the pillowcases from all pillows.
	# Remove the comforter/blanket and set it aside.
	# Pull off the fitted sheet and flat sheet from the mattress.
	# Place the dirty sheets and pillowcases in the laundry basket or hamper.
	# Take out clean sheets and pillowcases from the linen closet.
	# Put the fitted sheet on the mattress, ensuring it is snug and corners are secured.
	# Lay the flat sheet on top of the fitted sheet and tuck it in neatly around the bed.
	# Place the comforter/blanket back on the bed and adjust it evenly.
	# Slip the clean pillowcases onto the pillows.
	# Place the pillows back on the bed.
	# Make final adjustments to ensure the bed looks neat and tidy.
	actions = [Action(1, "grab", "pillowcase11"), Action(2, "grab", "sheets1"), Action(3, "put", "laundryhamper20"),
	           Action(4, "grab", "pillowcase12"), Action(5, "grab", "sheets2"), Action(6, "put", "bed111")]
	return objects, actions

def gpt_wash_dirty_dishes(objects):
	# sink247
	objects.append(VHObject("sink", 247, recipient=True, containers=True, furniture=True,
	                        inside=["kitchen207"], close=["faucet249", "washingsponge267", "plate278", "dishsoap268", "towel68"]))
	# plate278
	objects.append(VHObject("plate", 278, surfaces=True, grabbable=True, recipient=True, movable=True, props=True,
	                        inside=["kitchen207"], close=["faucet249", "washingsponge267", "sink247", "dishsoap268", "towel68"]))
	# faucet249
	objects.append(VHObject("faucet", 249, off=True, has_switch=True, furniture=True,
	                        inside=["kitchen207"], close=["plate278", "washingsponge267", "sink247", "dishsoap268", "towel68"]))
	# washingsponge267
	objects.append(VHObject("washingsponge", 267, grabbable=True, movable=True, props=True,
	                        inside=["kitchen207"], close=["plate278", "faucet249", "sink247", "dishsoap268", "towel68"]))
	# dishsoap268
	objects.append(VHObject("dishsoap", 268, grabbable=True, movable=True, pourable=True,
	                        inside=["kitchen207"], close=["plate278", "faucet249", "sink247", "washingsponge267", "towel68"]))
	# towel68
	objects.append(VHObject("towel", 68, grabbable=True, cover_object=True, movable=True, props=True,
	                        inside=["kitchen207"], close=["plate278", "faucet249", "sink247", "washingsponge267", "dishsoap268"]))
	# Task: Wash dirty dishes - 83.33%
	# Step 1: Walk to the kitchen sink.
	# Step 2: Find dirty dishes in or near the sink.
	# Step 3: Scrape off leftover food into the trash or compost bin.
	# Step 4: Turn on the faucet and adjust water temperature.
	# Step 5: Grab a sponge or dish brush.
	# Step 6: Find dish soap.
	# Step 7: Squeeze dish soap onto the sponge or dish brush.
	# Step 8: Pick up a dirty dish.
	# Step 9: Scrub the dirty dish with the soapy sponge or brush.
	# Step 10: Rinse the dish under running water until it's clean.
	# Step 11: Place the clean dish on a drying rack or towel.
	# Step 12: Repeat steps 8–11 for all remaining dirty dishes.
	# Step 13: Turn off the faucet when finished.
	# Step 14: Rinse and wring out the sponge or brush.
	# Step 15: Wipe down the sink and surrounding area.
	actions = [Action(1, "walk", "sink247"), Action(2, "find", "plate278"), Action(3, "use", "plate278"),
	           Action(4, "switch_on", "faucet249"), Action(5, "grab", "washingsponge267"), Action(6, "find", "dishsoap268"),
	           Action(7, "use", "dishsoap268"), Action(8, "grab", "plate278"), Action(9, "use", "washingsponge267"),
	           Action(10, "use", "faucet249"), Action(11, "put", "towel68"), Action(12, "switch_off", "faucet249"),
	           Action(13, "use", "washingsponge267")]
	return objects, actions

def gpt_feed_me(objects):
	objects[-1].inside = ["bedroom74"]
	# kitchentable231
	objects.append(VHObject("kitchentable", 231, surfaces=True, movable=True, furniture=True,
	                        inside=["kitchen207"], close=["bench232", "plate278", "creamybuns334"]))
	# bench232
	objects.append(VHObject("bench", 232, surfaces=True, sittable=True, lieable=True, movable=True, furniture=True,
	                        inside=["kitchen207"], close=["kitchentable231", "plate278", "creamybuns334"]))
	# plate278
	objects.append(VHObject("plate", 278, surfaces=True, grabbable=True, recipient=True, movable=True, props=True,
	                        inside=["kitchen207"], close=["bench232", "kitchentable231", "creamybuns334"]))
	# creamybuns334
	objects.append(VHObject("creamybuns", 334, grabbable=True, eatable=True, cuttable=True, movable=True, food=True,
	                        inside=["kitchen207"], close=["bench232", "plate278", "kitchentable231"]))
	# Task: Feed me - 33.33%
	# Step 1: Walk to dining room.
	# Step 2: Walk to table where you are seated.
	# Step 3: Find a chair for me to use (if needed).
	# Step 4: Pull chair closer to table.
	# Step 5: Sit on the chair (if I were human).
	# Step 6: Locate plate for you.
	# Step 7: Locate food for you.
	# Step 8: Grab food for you.
	# Step 9: Place food on your plate.
	# Step 10: Hand you the food or assist you with eating.
	actions = [Action(1, "walk", "kitchen207"), Action(2, "walk", "kitchentable231"), Action(3, "find", "bench232"),
	           Action(4, "move", "bench232"), Action(5, "sit", "bench232"), Action(6, "find", "plate278"),
	           Action(7, "find", "creamybuns334"), Action(8, "grab", "creamybuns334"), Action(9, "put", "plate278"),
	           Action(10, "eat", "creamybuns334")]
	return objects, actions

def gpt_breakfast(objects):
	objects[-1].inside = ["bedroom74"]
	# kitchentable231
	objects.append(VHObject("kitchentable", 231, surfaces=True, movable=True, furniture=True,
	                        inside=["kitchen207"], close=["bench232", "plate278", "creamybuns334", "cutleryfork277"]))
	# bench232
	objects.append(VHObject("bench", 232, surfaces=True, sittable=True, lieable=True, movable=True, furniture=True,
	                        inside=["kitchen207"], close=["kitchentable231", "plate278", "creamybuns334", "cutleryfork277"]))
	# plate278
	objects.append(VHObject("plate", 278, surfaces=True, grabbable=True, recipient=True, movable=True, props=True,
	                        inside=["kitchen207"], close=["bench232", "kitchentable231", "creamybuns334", "cutleryfork277"]))
	# cutleryfork277
	objects.append(VHObject("cutleryfork", 277, grabbable=True, movable=True, props=True,
	                        inside=["kitchen207"], close=["bench232", "kitchentable231", "creamybuns334", "plate278"]))
	# creamybuns334
	objects.append(VHObject("creamybuns", 334, grabbable=True, eatable=True, cuttable=True, movable=True, food=True,
	                        inside=["kitchen207"], close=["fridge306"]))
	# fridge306
	objects.append(VHObject("fridge", 306, closed=True, can_open=True, has_switch=True, containers=True, has_plug=True, appliances=True,
	                       inside=["kitchen207"], close=["creamybuns334"]))
	# Task: Breakfast - 25.00%
	# Step 1: Walk to kitchen
	# Step 2: Walk to plate
	# Step 3: Find plate
	# Step 4: Grab plate
	# Step 5: Walk to fridge or pantry
	# Step 6: Find breakfast food (e.g., cereal, eggs, bread, etc.)
	# Step 7: Grab breakfast food
	# Step 8: Prepare breakfast food (e.g., pour cereal, cook eggs, toast bread, etc.)
	# Step 9: Put food on plate or bowl
	# Step 10: Walk to table
	# Step 11: Put plate or bowl on table
	# Step 12: Find chair
	# Step 13: Sit on chair
	# Step 14: Find utensil (e.g., spoon, fork, knife, etc.)
	# Step 15: Grab utensil
	# Step 16: Eat from plate or bowl
	actions = [Action(1, "walk", "kitchen207"), Action(2, "walk", "plate278"), Action(3, "find", "plate278"),
	           Action(4, "grab", "plate278"), Action(5, "walk", "fridge306"), Action(6, "find", "creamybuns334"),
	           Action(7, "grab", "creamybuns334"), Action(8, "put", "plate278"), Action(9, "walk", "kitchentable231"),
	           Action(10, "put", "kitchentable231"), Action(11, "find", "bench232"), Action(12, "sit", "bench232"),
	           Action(13, "find", "cutleryfork277"), Action(14, "grab", "cutleryfork277"), Action(15, "eat", "creamybuns334")]
	return objects, actions

def gpt_read(objects):
	# book192
	objects.append(VHObject("book", 192, closed=True, grabbable=True, cuttable=True, can_open=True, readable=True,
	                        has_paper=True, movable=True, props=True, inside=["bedroom74"], close=["character1"]))
	# chair109
	objects.append(VHObject("chair", 109, surfaces=True, grabbable=True, sittable=True, movable=True, furniture=True,
	                        inside=["bedroom74"], close=["character1"]))
	# Task: Read - 66.67%
	# Step 1: Choose what to read (e.g., book, article, e-book).
	# Step 2: Find a comfortable reading environment.
	# Step 3: Gather necessary tools (e.g., bookmark, device, notebook).
	# Step 4: Open the material to the correct page or section.
	# Step 5: Begin reading at your own pace.
	# Step 6: Take breaks if needed to avoid fatigue.
	# Step 7: Reflect on or summarize what you’ve read.
	# Step 8: Save your progress or finish the material.
	actions = [Action(1, "find", "book192"), Action(2, "find", "chair109"), Action(3, "grab", "book192"),
	           Action(4, "open", "book192"), Action(5, "use", "book192"), Action(6, "close", "book192")]
	return objects, actions

def huang_go_to_sleep(objects):
	# bed111
	objects.append(
		VHObject("bed", 111, surfaces=True, sittable=True, lieable=True, furniture=True, inside=["bedroom74"],
		         ontopof=["floor76"]))
	actions = [Action(1, "walk", "bedroom74"), Action(2, "walk", "bed111"), Action(3, "lie", "bed111"),
	           Action(4, "use", "bed111")]
	return objects, actions

def huang_browse_internet(objects):
	# chair109
	objects.append(VHObject("chair", 109, surfaces=True, grabbable=True, sittable=True, movable=True, furniture=True,
	                        inside=["bedroom74"], close=["computer176", "mouse172", "desk110"]))
	# computer176
	objects.append(VHObject("computer", 176, off=True, has_switch=True, lookable=True, electronics=True,
	                        inside=["bedroom74"], close=["chair109", "mouse172", "desk110"]))
	# mouse172
	objects.append(VHObject("mouse", 172, grabbable=True, has_plug=True, movable=True, electronics=True,
	                        inside=["bedroom74"], close=["chair109", "computer176", "desk110"]))
	# desk110
	objects.append(VHObject("desk", 110, closed=True, surfaces=True, can_open=True, movable=True, furniture=True,
	                        inside=["bedroom74"], close=["chair109", "computer176", "mouse172"]))

	actions = [Action(1, "walk", "bedroom74"), Action(2, "walk", "desk110"), Action(3, "find", "chair109"),
	           Action(4, "sit", "chair109"), Action(5, "find", "computer176"), Action(6, "switch_on", "computer176"),
	           Action(7, "find", "mouse172"), Action(8, "grab", "mouse172"), Action(9, "turn_to", "computer176"),
	           Action(10, "point", "computer176")]
	return objects, actions

def huang_wash_teeth(objects):
	# bathroomcounter50
	objects.append(VHObject("bathroomcounter", 50, closed=True, surfaces=True, furniture=True,
	                        inside=["bathroom11"], close=["faucet51"]))
	# faucet51
	objects.append(VHObject("faucet", 51, off=True, has_switch=True, furniture=True,
	                        inside=["bathroom11"], close=["bathroomcounter50", "toothpaste63"]))
	# toothbrush66
	objects.append(VHObject("toothbrush", 66, grabbable=True, recipient=True, movable=True, props=True,
	                        inside=["bathroom11"], close=[]))
	# toothpaste63
	objects.append(VHObject("toothpaste", 63, closed=True, grabbable=True, pourable=True, can_open=True, movable=True,
	                        cream=True, props=True, inside=["bathroom11"], close=["bathroomcounter50", "faucet51"]))

	actions = [Action(1, "walk", "bathroom11"), Action(2, "walk", "bathroomcounter50"), Action(3, "find", "faucet51"),
	           Action(4, "switch_on", "faucet51"), Action(5, "walk", "toothbrush66"), Action(6, "grab", "toothbrush66")]
	return objects, actions

def huang_brush_teeth(objects):
	# bathroomcounter50
	objects.append(VHObject("bathroomcounter", 50, closed=True, surfaces=True, furniture=True,
	                        inside=["bathroom11"], close=["faucet51", "toothbrush66", "toothpaste63"]))
	# faucet51
	objects.append(VHObject("faucet", 51, off=True, has_switch=True, furniture=True,
	                        inside=["bathroom11"], close=["bathroomcounter50", "toothbrush66", "toothpaste63"]))
	# toothbrush66
	objects.append(VHObject("toothbrush", 66, grabbable=True, recipient=True, movable=True, props=True,
	                        inside=["bathroom11"], close=["bathroomcounter50", "faucet51", "toothpaste63"]))
	# toothpaste63
	objects.append(VHObject("toothpaste", 63, closed=True, grabbable=True, pourable=True, can_open=True, movable=True,
	                        cream=True, props=True, inside=["bathroom11"], close=["bathroomcounter50", "faucet51", "toothbrush66"]))

	actions = [Action(1, "find", "toothbrush66"), Action(2, "turn_to", "toothbrush66"), Action(3, "point", "toothbrush66"),
	           Action(4, "use", "toothbrush66")]
	return objects, actions

def huang_vacuum(objects):
	# vacuum10
	objects.append(VHObject("vacuum,", 10, has_switch=True, grabbable=True, has_plug=True, movable=True, off=True,
	                        inside=["bedroom74", "dresser3201"]))
	# dresser3201
	objects.append(VHObject("dresser", 3201, surfaces=True, movable=True, inside=["bedroom74"]))

	actions = [Action(1, "walk", "bedroom74"), Action(2, "walk", "dresser3201"), Action(3, "open", "dresser3201"),
	           Action(4, "find", "vacuum10"), Action(5, "grab", "vacuum10"), Action(6, "switch_on", "vacuum10")]
	return objects, actions

def huang_change_sheets_and_pillowcases(objects):
	# bed111
	objects.append(VHObject("bed", 111, surfaces=True, sittable=True, lieable=True, furniture=True,
	                        inside=["bedroom74"], ontopof=["floor76"], close=["sheets1", "pillow11"]))
	# sheets1
	objects.append(VHObject("sheets", 1, grabbable=True, movable=True,
	                        inside=["bedroom74"], ontopof=["bed111"], close=["bed111", "pillow11"]))
	# pillow11
	objects.append(VHObject("pillow", 11, grabbable=True, movable=True,
	                        inside=["bedroom74"], close=["sheets1", "bed111"]))
	#Task: Change sheets and pillowcases
	# Step 1: Walk to bedroom
	# Step 2: Walk to bed
	# Step 3: Find sheets
	# Step 4: Grab sheets
	# Step 5: Find pillow
	# Step 6: Grab pillow
	actions = [Action(1, "walk", "bedroom74"), Action(2, "walk", "bed111"), Action(3, "find", "sheets1"),
	           Action(4, "grab", "sheets1"), Action(5, "find", "pillow11"), Action(6, "grab", "pillow11")]
	return objects, actions

def huang_wash_dirty_dishes(objects):
	objects[-1].inside=["bedroom74"]
	# sink247
	objects.append(VHObject("sink", 247, recipient=True, containers=True, furniture=True,
	                        inside=["kitchen207"], close=["faucet249", "washingsponge267", "plate278", "dishsoap268", "towel68"]))
	# plate278
	objects.append(VHObject("plate", 278, surfaces=True, grabbable=True, recipient=True, movable=True, props=True,
	                        inside=["kitchen207"], close=["faucet249", "washingsponge267", "sink247", "dishsoap268", "towel68"]))
	# faucet249
	objects.append(VHObject("faucet", 249, off=True, has_switch=True, furniture=True,
	                        inside=["kitchen207"], close=["plate278", "washingsponge267", "sink247", "dishsoap268", "towel68"]))
	# washingsponge267
	objects.append(VHObject("washingsponge", 267, grabbable=True, movable=True, props=True,
	                        inside=["kitchen207"], close=["plate278", "faucet249", "sink247", "dishsoap268", "towel68"]))
	# dishsoap268
	objects.append(VHObject("dishsoap", 268, grabbable=True, movable=True, pourable=True,
	                        inside=["kitchen207"], close=["plate278", "faucet249", "sink247", "washingsponge267", "towel68"]))
	# towel68
	objects.append(VHObject("towel", 68, grabbable=True, cover_object=True, movable=True, props=True,
	                        inside=["kitchen207"], close=["plate278", "faucet249", "sink247", "washingsponge267", "dishsoap268"]))

	actions = [Action(1, "walk", "kitchen207"), Action(2, "walk", "sink247"), Action(3, "find", "faucet249"),
	           Action(4, "switch_on", "faucet249"), Action(5, "walk", "plate278"), Action(6, "grab", "plate278")]
	return objects, actions

def huang_feed_me(objects):
	objects[-1].inside = ["bedroom74"]
	# kitchentable231
	objects.append(VHObject("kitchentable", 231, surfaces=True, movable=True, furniture=True,
	                        inside=["kitchen207"], close=["bench232", "plate278", "creamybuns334"]))
	# bench232
	objects.append(VHObject("bench", 232, surfaces=True, sittable=True, lieable=True, movable=True, furniture=True,
	                        inside=["kitchen207"], close=["kitchentable231", "plate278", "creamybuns334"]))
	# plate278
	objects.append(VHObject("plate", 278, surfaces=True, grabbable=True, recipient=True, movable=True, props=True,
	                        inside=["kitchen207"], close=["bench232", "kitchentable231", "creamybuns334"]))
	# creamybuns334
	objects.append(VHObject("creamybuns", 334, grabbable=True, eatable=True, cuttable=True, movable=True, food=True,
	                        inside=["kitchen207"], close=["bench232", "plate278", "kitchentable231"]))

	actions = [Action(1, "walk", "kitchen207"), Action(2, "walk", "kitchentable231"), Action(3, "find", "kitchentable231")] # abridged
	return objects, actions

def huang_breakfast(objects):
	objects[-1].inside = ["bedroom74"]
	# kitchentable231
	objects.append(VHObject("kitchentable", 231, surfaces=True, movable=True, furniture=True,
	                        inside=["kitchen207"], close=["bench232", "plate278", "creamybuns334", "cutleryfork277"]))
	# bench232
	objects.append(VHObject("bench", 232, surfaces=True, sittable=True, lieable=True, movable=True, furniture=True,
	                        inside=["kitchen207"], close=["kitchentable231", "plate278", "creamybuns334", "cutleryfork277"]))
	# plate278
	objects.append(VHObject("plate", 278, surfaces=True, grabbable=True, recipient=True, movable=True, props=True,
	                        inside=["kitchen207"], close=["bench232", "kitchentable231", "creamybuns334", "cutleryfork277"]))
	# cutleryfork277
	objects.append(VHObject("cutleryfork", 277, grabbable=True, movable=True, props=True,
	                        inside=["kitchen207"], close=["bench232", "kitchentable231", "creamybuns334", "plate278"]))
	# creamybuns334
	objects.append(VHObject("creamybuns", 334, grabbable=True, eatable=True, cuttable=True, movable=True, food=True,
	                        inside=["kitchen207"], close=["fridge306"]))
	# fridge306
	objects.append(VHObject("fridge", 306, closed=True, can_open=True, has_switch=True, containers=True, has_plug=True, appliances=True,
	                       inside=["kitchen207"], close=["creamybuns334"]))

	actions = [Action(1, "walk", "kitchen207"), Action(2, "walk", "fridge306"), Action(3, "find", "fridge306")] # abridged
	return objects, actions

def huang_read(objects):
	# book192
	objects.append(VHObject("book", 192, closed=True, grabbable=True, cuttable=True, can_open=True, readable=True,
	                        has_paper=True, movable=True, props=True, inside=["bedroom74"], close=["character1"]))
	# chair109
	objects.append(VHObject("chair", 109, surfaces=True, grabbable=True, sittable=True, movable=True, furniture=True,
	                        inside=["bedroom74"], close=["character1"]))
	objects.append(VHObject("light", 1)) # abridged
	# Task: Read - 66.67%
	# Step 1: Choose what to read (e.g., book, article, e-book).
	# Step 2: Find a comfortable reading environment.
	# Step 3: Gather necessary tools (e.g., bookmark, device, notebook).
	# Step 4: Open the material to the correct page or section.
	# Step 5: Begin reading at your own pace.
	# Step 6: Take breaks if needed to avoid fatigue.
	# Step 7: Reflect on or summarize what you’ve read.
	# Step 8: Save your progress or finish the material.
	actions = [Action(1, "walk", "bedroom74"), Action(2, "walk", "light1"), Action(3, "find", "light1")]
	return objects, actions
