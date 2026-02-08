% Added meat to freezer
get_relevant(added_meat_to_freezer, [FREEZER1, GROCERIES1]) :-
	type(FREEZER1, freezer), type(GROCERIES1, groceries).
complete_task(added_meat_to_freezer, P) :-
	type(FREEZER1, freezer), type(GROCERIES1, groceries),
	transform([close([FREEZER1]), holds([]), sat_on([]), on_top_of([[GROCERIES1, FREEZER1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([FREEZER1])], P).

% Annoy your dog
get_relevant(annoy_your_dog, [CHAIR1, LASERPOINTER1, BANDAIDS1, DOG1]) :-
	type(CHAIR1, chair), type(LASERPOINTER1, laserpointer), type(BANDAIDS1, bandaids), type(DOG1, dog).
complete_task(annoy_your_dog, P) :-
	type(CHAIR1, chair), type(LASERPOINTER1, laserpointer), type(BANDAIDS1, bandaids), type(DOG1, dog),
	transform([close([CHAIR1]), holds([]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), off([LASERPOINTER1]), shake([LASERPOINTER1]), standup([character1])], P).

% Answer door
get_relevant(answer_door, [MAN1]) :-
	type(MAN1, man).
complete_task(answer_door, P) :-
	type(MAN1, man),
	transform([close([MAN1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), greet([MAN1])], P).

% Apply lotion
get_relevant(apply_lotion, [BED1]) :-
	type(BED1, bed).
complete_task(apply_lotion, P) :-
	type(BED1, bed),
	transform([close([]), holds([]), sat_on([BED1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), push([BED1]), wash([BED1])], P).

% Arrange bookshelf
get_relevant(arrange_bookshelf, [RAG1, BOOKSHELF1, BOOK1, BOOK3, DESK1, BOOK2]) :-
	type(RAG1, rag), type(BOOKSHELF1, bookshelf), type(BOOK1, book), type(BOOK3, book), type(DESK1, desk), type(BOOK2, book).
complete_task(arrange_bookshelf, P) :-
	type(RAG1, rag), type(BOOKSHELF1, bookshelf), type(BOOK1, book), type(BOOK3, book), type(DESK1, desk), type(BOOK2, book),
	transform([close([BOOKSHELF1, BOOK1, BOOK3, DESK1, BOOK2]), holds([]), sat_on([]), on_top_of([[BOOK1, BOOKSHELF1], [BOOK3, BOOKSHELF1], [BOOK2, BOOKSHELF1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), open([BOOKSHELF1, DESK1]), wipe([BOOKSHELF1])], P).

% Arrange folders
get_relevant(arrange_folders, [FOLDER4, FOLDER3, FOLDER2, FOLDER5, FOLDER1, DESK1]) :-
	type(FOLDER4, folder), type(FOLDER3, folder), type(FOLDER2, folder), type(FOLDER5, folder), type(FOLDER1, folder), type(DESK1, desk).
complete_task(arrange_folders, P) :-
	type(FOLDER4, folder), type(FOLDER3, folder), type(FOLDER2, folder), type(FOLDER5, folder), type(FOLDER1, folder), type(DESK1, desk),
	transform([close([DESK1]), holds([]), sat_on([]), on_top_of([[FOLDER4, DESK1], [FOLDER3, DESK1], [FOLDER2, DESK1], [FOLDER5, DESK1], [FOLDER1, DESK1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), open([DESK1])], P).

% Bake
get_relevant(bake, [OVEN1, DOUGH1, TRAY1]) :-
	type(OVEN1, oven), type(DOUGH1, dough), type(TRAY1, tray).
complete_task(bake, P) :-
	type(OVEN1, oven), type(DOUGH1, dough), type(TRAY1, tray),
	transform([close([OVEN1]), holds([TRAY1]), sat_on([]), on_top_of([[DOUGH1, TRAY1]]), inside([]), on([OVEN1]), laid_on([]), used([]), eaten([]), closed([OVEN1]), putin([TRAY1])], P).

% Bathe
get_relevant(bathe, [SOAP1, FAUCET1, ARMSBOTH1, BATHTUB1, LEGSBOTH1, SPONGE1, CLOTHESDRESS1]) :-
	type(SOAP1, soap), type(FAUCET1, faucet), type(ARMSBOTH1, armsboth), type(BATHTUB1, bathtub), type(LEGSBOTH1, legsboth), type(SPONGE1, sponge), type(CLOTHESDRESS1, clothesdress).
complete_task(bathe, P) :-
	type(SOAP1, soap), type(FAUCET1, faucet), type(ARMSBOTH1, armsboth), type(BATHTUB1, bathtub), type(LEGSBOTH1, legsboth), type(SPONGE1, sponge), type(CLOTHESDRESS1, clothesdress),
	transform([close([BATHTUB1]), holds([]), sat_on([BATHTUB1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), enter([BATHTUB1]), leave([BATHTUB1]), off([FAUCET1]), pour([SOAP1]), rinse([ARMSBOTH1, LEGSBOTH1]), scrub([ARMSBOTH1, LEGSBOTH1]), standup([character1])], P).

% Break table
get_relevant(break_table, [CHAIR1, TABLE1]) :-
	type(CHAIR1, chair), type(TABLE1, tabl).
complete_task(break_table, P) :-
	type(CHAIR1, chair), type(TABLE1, tabl),
	transform([close([CHAIR1]), holds([]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), pull([CHAIR1])], P).

% Breakfast
get_relevant(breakfast, [FOODFOOD1, BED1, TELEVISION1]) :-
	type(FOODFOOD1, foodfood), type(BED1, bed), type(TELEVISION1, television).
complete_task(breakfast, P) :-
	type(FOODFOOD1, foodfood), type(BED1, bed), type(TELEVISION1, television),
	transform([close([FOODFOOD1, BED1, TELEVISION1]), holds([FOODFOOD1]), sat_on([]), on_top_of([]), inside([]), on([TELEVISION1]), laid_on([BED1]), used([]), eaten([FOODFOOD1]), watch([TELEVISION1])], P).

% Bring dirty plate to sink
get_relevant(bring_dirty_plate_to_sink, [TABLE1, PLATE1, SINK1]) :-
	type(TABLE1, tabl), type(PLATE1, plate), type(SINK1, sink).
complete_task(bring_dirty_plate_to_sink, P) :-
	type(TABLE1, tabl), type(PLATE1, plate), type(SINK1, sink),
	transform([close([PLATE1, SINK1]), holds([]), sat_on([]), on_top_of([[PLATE1, SINK1]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Bring food
get_relevant(bring_food, [FOODFOOD1, PLATE1, BED1]) :-
	type(FOODFOOD1, foodfood), type(PLATE1, plate), type(BED1, bed).
complete_task(bring_food, P) :-
	type(FOODFOOD1, foodfood), type(PLATE1, plate), type(BED1, bed),
	transform([close([PLATE1, BED1]), holds([PLATE1]), sat_on([]), on_top_of([[FOODFOOD1, PLATE1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), sleep([character1]), wakeup([character1])], P).

% Broom
get_relevant(broom, [FLOOR1, DUSTPAN1]) :-
	type(FLOOR1, floor), type(DUSTPAN1, dustpan).
complete_task(broom, P) :-
	type(FLOOR1, floor), type(DUSTPAN1, dustpan),
	transform([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), sweep([FLOOR1])], P).

% Browse computer
get_relevant(browse_computer, [KEYBOARD1, CHAIR1, MOUSE1, MAIL1, DESK1, COMPUTER1]) :-
	type(KEYBOARD1, keyboard), type(CHAIR1, chair), type(MOUSE1, mouse), type(MAIL1, mail), type(DESK1, desk), type(COMPUTER1, computer).
complete_task(browse_computer, P) :-
	type(KEYBOARD1, keyboard), type(CHAIR1, chair), type(MOUSE1, mouse), type(MAIL1, mail), type(DESK1, desk), type(COMPUTER1, computer),
	transform([close([DESK1]), holds([MAIL1]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([COMPUTER1]), laid_on([]), used([]), eaten([]), read([MAIL1]), type([KEYBOARD1])], P).

% Browse internet
get_relevant(browse_internet, [CHAIR1, COMPUTER1, KEYBOARD1]) :-
	type(CHAIR1, chair), type(COMPUTER1, computer), type(KEYBOARD1, keyboard).
complete_task(browse_internet, P) :-
	type(CHAIR1, chair), type(COMPUTER1, computer), type(KEYBOARD1, keyboard),
	transform([close([]), holds([]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([COMPUTER1]), laid_on([]), used([]), eaten([]), type([KEYBOARD1])], P).

% Brush hair
get_relevant(brush_hair, [HAIRBRUSH1, HAIR1, MIRROR1]) :-
	type(HAIRBRUSH1, hairbrush), type(HAIR1, hair), type(MIRROR1, mirror).
complete_task(brush_hair, P) :-
	type(HAIRBRUSH1, hairbrush), type(HAIR1, hair), type(MIRROR1, mirror),
	transform([close([HAIRBRUSH1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), brush([HAIR1])], P).

% Brush teeth
get_relevant(brush_teeth, [TOOTHBRUSH1, TEETH1, TOOTHPASTE1, TOOTHBRUSHHOLDER1, FAUCET1]) :-
	type(TOOTHBRUSH1, toothbrush), type(TEETH1, teeth), type(TOOTHPASTE1, toothpaste), type(TOOTHBRUSHHOLDER1, toothbrushholder), type(FAUCET1, faucet).
complete_task(brush_teeth, P) :-
	type(TOOTHBRUSH1, toothbrush), type(TEETH1, teeth), type(TOOTHPASTE1, toothpaste), type(TOOTHBRUSHHOLDER1, toothbrushholder), type(FAUCET1, faucet),
	transform([close([TOOTHBRUSHHOLDER1]), holds([TOOTHBRUSH1, TOOTHPASTE1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), brush([TEETH1]), drop([TOOTHPASTE1]), off([FAUCET1]), wash([TOOTHBRUSH1, TEETH1])], P).

% Brush teeth
get_relevant(brush_teeth, [TOOTHBRUSH1, TEETH1, TOOTHPASTE1, TOOTHBRUSHHOLDER1]) :-
	type(TOOTHBRUSH1, toothbrush), type(TEETH1, teeth), type(TOOTHPASTE1, toothpaste), type(TOOTHBRUSHHOLDER1, toothbrushholder).
complete_task(brush_teeth, P) :-
	type(TOOTHBRUSH1, toothbrush), type(TEETH1, teeth), type(TOOTHPASTE1, toothpaste), type(TOOTHBRUSHHOLDER1, toothbrushholder),
	transform([close([TOOTHBRUSH1, TOOTHPASTE1, TOOTHBRUSHHOLDER1]), holds([TOOTHBRUSH1, TOOTHPASTE1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), pour([TOOTHPASTE1]), scrub([TEETH1])], P).

% Celebrate
get_relevant(celebrate, [FOODFOOD1, WOMAN1, CHAIR1, PLATE1, WINEGLASS1, PLATE3, WOMAN2, PLATE2]) :-
	type(FOODFOOD1, foodfood), type(WOMAN1, woman), type(CHAIR1, chair), type(PLATE1, plate), type(WINEGLASS1, wineglass), type(PLATE3, plate), type(WOMAN2, woman), type(PLATE2, plate).
complete_task(celebrate, P) :-
	type(FOODFOOD1, foodfood), type(WOMAN1, woman), type(CHAIR1, chair), type(PLATE1, plate), type(WINEGLASS1, wineglass), type(PLATE3, plate), type(WOMAN2, woman), type(PLATE2, plate),
	transform([close([WOMAN1]), holds([]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([PLATE1]), drink([WINEGLASS1]), greet([WOMAN1, WOMAN2]), talk([WOMAN1, WOMAN2])], P).

% Celebrate birthday with nice meal
get_relevant(celebrate_birthday_with_nice_meal, [FOODFOOD1, TABLE1, PLATE1, WINEGLASS1, CHAIR1]) :-
	type(FOODFOOD1, foodfood), type(TABLE1, tabl), type(PLATE1, plate), type(WINEGLASS1, wineglass), type(CHAIR1, chair).
complete_task(celebrate_birthday_with_nice_meal, P) :-
	type(FOODFOOD1, foodfood), type(TABLE1, tabl), type(PLATE1, plate), type(WINEGLASS1, wineglass), type(CHAIR1, chair),
	transform([close([FOODFOOD1]), holds([]), sat_on([CHAIR1]), on_top_of([[FOODFOOD1, PLATE1], [PLATE1, TABLE1], [WINEGLASS1, TABLE1]]), inside([]), on([]), laid_on([]), used([]), eaten([PLATE1]), drink([WINEGLASS1])], P).

% Change TV channel
get_relevant(change_tv_channel, [COUCH1, REMOTECONTROL1, TELEVISION1, BUTTON1]) :-
	type(COUCH1, couch), type(REMOTECONTROL1, remotecontrol), type(TELEVISION1, television), type(BUTTON1, button).
complete_task(change_tv_channel, P) :-
	type(COUCH1, couch), type(REMOTECONTROL1, remotecontrol), type(TELEVISION1, television), type(BUTTON1, button),
	transform([close([REMOTECONTROL1]), holds([REMOTECONTROL1]), sat_on([COUCH1]), on_top_of([]), inside([]), on([TELEVISION1]), laid_on([]), used([]), eaten([]), push([BUTTON1])], P).

% Change clothes
get_relevant(change_clothes, [CLOSET1, CLOTHESDRESS1]) :-
	type(CLOSET1, closet), type(CLOTHESDRESS1, clothesdress).
complete_task(change_clothes, P) :-
	type(CLOSET1, closet), type(CLOTHESDRESS1, clothesdress),
	transform([close([CLOSET1]), holds([CLOTHESDRESS1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([CLOSET1]), puton([CLOTHESDRESS1])], P).

% Change curtains
get_relevant(change_curtains, [CURTAIN1, CLOSET1, BASKETFORCLOTHES1, WINDOW1]) :-
	type(CURTAIN1, curtain), type(CLOSET1, closet), type(BASKETFORCLOTHES1, basketforclothes), type(WINDOW1, window).
complete_task(change_curtains, P) :-
	type(CURTAIN1, curtain), type(CLOSET1, closet), type(BASKETFORCLOTHES1, basketforclothes), type(WINDOW1, window),
	transform([close([CURTAIN1, CLOSET1, BASKETFORCLOTHES1, WINDOW1]), holds([]), sat_on([]), on_top_of([[CURTAIN1, WINDOW1], [BASKETFORCLOTHES1, WINDOW1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([CLOSET1]), fold([CURTAIN1]), pull([CURTAIN1]), touch([CURTAIN1]), unfold([CURTAIN1])], P).

% Change light
get_relevant(change_light, [TRASHCAN1, LIGHTBULB1, LIGHTBULB2, CHAIR1, LIGHT1, CABINET1]) :-
	type(TRASHCAN1, trashcan), type(LIGHTBULB1, lightbulb), type(LIGHTBULB2, lightbulb), type(CHAIR1, chair), type(LIGHT1, light), type(CABINET1, cabinet).
complete_task(change_light, P) :-
	type(TRASHCAN1, trashcan), type(LIGHTBULB1, lightbulb), type(LIGHTBULB2, lightbulb), type(CHAIR1, chair), type(LIGHT1, light), type(CABINET1, cabinet),
	transform([close([TRASHCAN1, LIGHT1, CABINET1]), holds([LIGHTBULB2]), sat_on([]), on_top_of([[LIGHTBULB1, TRASHCAN1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), climb([CHAIR1]), closed([CABINET1]), off([LIGHT1]), pull([LIGHTBULB1, CHAIR1])], P).

% Check email
get_relevant(check_email, [LAPTOP1, CHAIR1]) :-
	type(LAPTOP1, laptop), type(CHAIR1, chair).
complete_task(check_email, P) :-
	type(LAPTOP1, laptop), type(CHAIR1, chair),
	transform([close([LAPTOP1, CHAIR1]), holds([LAPTOP1]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([LAPTOP1]), laid_on([]), used([]), eaten([]), touch([LAPTOP1])], P).

% Check homework
get_relevant(check_homework, [TABLE1, CHAIR1, CHILD1, HOMEWORK1]) :-
	type(TABLE1, tabl), type(CHAIR1, chair), type(CHILD1, child), type(HOMEWORK1, homework).
complete_task(check_homework, P) :-
	type(TABLE1, tabl), type(CHAIR1, chair), type(CHILD1, child), type(HOMEWORK1, homework),
	transform([close([HOMEWORK1]), holds([]), sat_on([CHILD1]), on_top_of([[HOMEWORK1, TABLE1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), talk([CHILD1])], P).

% Check self in mirror
get_relevant(check_self_in_mirror, [MIRROR1]) :-
	type(MIRROR1, mirror).
complete_task(check_self_in_mirror, P) :-
	type(MIRROR1, mirror),
	transform([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), crawl([])], P).

% Chop vegetables
get_relevant(chop_vegetables, [KNIFE1, FOODCARROT1, CUTTINGBOARD1, FRIDGE1, CUPBOARD1]) :-
	type(KNIFE1, knife), type(FOODCARROT1, foodcarrot), type(CUTTINGBOARD1, cuttingboard), type(FRIDGE1, fridge), type(CUPBOARD1, cupboard).
complete_task(chop_vegetables, P) :-
	type(KNIFE1, knife), type(FOODCARROT1, foodcarrot), type(CUTTINGBOARD1, cuttingboard), type(FRIDGE1, fridge), type(CUPBOARD1, cupboard),
	transform([close([FRIDGE1, CUTTINGBOARD1]), holds([KNIFE1, FOODCARROT1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([FRIDGE1, CUPBOARD1]), cut([FOODCARROT1])], P).

% Clean
get_relevant(clean, [TOY2, TOY1, TOY3, CABINET1]) :-
	type(TOY2, toy), type(TOY1, toy), type(TOY3, toy), type(CABINET1, cabinet).
complete_task(clean, P) :-
	type(TOY2, toy), type(TOY1, toy), type(TOY3, toy), type(CABINET1, cabinet),
	transform([close([TOY2, TOY1, TOY3, CABINET1]), holds([]), sat_on([]), on_top_of([[TOY2, CABINET1], [TOY1, CABINET1], [TOY3, CABINET1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([CABINET1])], P).

% Clean bathroom
get_relevant(clean_bathroom, [DETERGENT1, TOILET1, SHOWER1, BRUSH1]) :-
	type(DETERGENT1, detergent), type(TOILET1, toilet), type(SHOWER1, shower), type(BRUSH1, brush).
complete_task(clean_bathroom, P) :-
	type(DETERGENT1, detergent), type(TOILET1, toilet), type(SHOWER1, shower), type(BRUSH1, brush),
	transform([close([BRUSH1]), holds([]), sat_on([]), on_top_of([[DETERGENT1, TOILET1], [BRUSH1, TOILET1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), rinse([TOILET1, SHOWER1]), scrub([TOILET1, SHOWER1])], P).

% Clean dishes
get_relevant(clean_dishes, [DISHSOAP1, DRINKINGGLASS1, COFFEECUP1, FAUCET1, PLATE1, DETERGENT1, DISHWASHER1, SINK1]) :-
	type(DISHSOAP1, dishsoap), type(DRINKINGGLASS1, drinkingglass), type(COFFEECUP1, coffeecup), type(FAUCET1, faucet), type(PLATE1, plate), type(DETERGENT1, detergent), type(DISHWASHER1, dishwasher), type(SINK1, sink).
complete_task(clean_dishes, P) :-
	type(DISHSOAP1, dishsoap), type(DRINKINGGLASS1, drinkingglass), type(COFFEECUP1, coffeecup), type(FAUCET1, faucet), type(PLATE1, plate), type(DETERGENT1, detergent), type(DISHWASHER1, dishwasher), type(SINK1, sink),
	transform([close([SINK1]), holds([]), sat_on([]), on_top_of([[DISHSOAP1, PLATE1], [DRINKINGGLASS1, DISHWASHER1], [COFFEECUP1, PLATE1], [PLATE1, DISHWASHER1], [DETERGENT1, DISHWASHER1]]), inside([]), on([FAUCET1, DISHWASHER1]), laid_on([]), used([]), eaten([]), closed([DISHWASHER1]), wash([DRINKINGGLASS1, COFFEECUP1, PLATE1])], P).

% Clean eggs from our chickens
get_relevant(clean_eggs_from_our_chickens, [RAG1, FAUCET1, BOX1, SPONGE1, SINK1, FRIDGE1, FOODEGG1]) :-
	type(RAG1, rag), type(FAUCET1, faucet), type(BOX1, box), type(SPONGE1, sponge), type(SINK1, sink), type(FRIDGE1, fridge), type(FOODEGG1, foodegg).
complete_task(clean_eggs_from_our_chickens, P) :-
	type(RAG1, rag), type(FAUCET1, faucet), type(BOX1, box), type(SPONGE1, sponge), type(SINK1, sink), type(FRIDGE1, fridge), type(FOODEGG1, foodegg),
	transform([close([BOX1, SINK1, FRIDGE1, FOODEGG1]), holds([BOX1, FOODEGG1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([FRIDGE1]), off([FAUCET1]), putin([BOX1, FOODEGG1]), rinse([FOODEGG1]), scrub([FOODEGG1]), wipe([FOODEGG1])], P).

% Clean floor
get_relevant(clean_floor, [CLEANINGBOTTLE1]) :-
	type(CLEANINGBOTTLE1, cleaningbottle).
complete_task(clean_floor, P) :-
	type(CLEANINGBOTTLE1, cleaningbottle),
	transform([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), shake([CLEANINGBOTTLE1]), wash([CLEANINGBOTTLE1])], P).

% Clean floor
get_relevant(clean_floor, [CLEANINGBOTTLE1]) :-
	type(CLEANINGBOTTLE1, cleaningbottle).
complete_task(clean_floor, P) :-
	type(CLEANINGBOTTLE1, cleaningbottle),
	transform([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), wash([CLEANINGBOTTLE1])], P).

% Clean floor
get_relevant(clean_floor, [MOP1, CLEANINGSOLUTION1, MOPBUCKET1]) :-
	type(MOP1, mop), type(CLEANINGSOLUTION1, cleaningsolution), type(MOPBUCKET1, mopbucket).
complete_task(clean_floor, P) :-
	type(MOP1, mop), type(CLEANINGSOLUTION1, cleaningsolution), type(MOPBUCKET1, mopbucket),
	transform([close([]), holds([MOP1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), pour([CLEANINGSOLUTION1]), soak([MOP1])], P).

% Clean fridge
get_relevant(clean_fridge, [TRASHCAN1, FOODFOOD1, RAG1, MILK1, FOODCHEESE1, TABLE1, FAUCET1, DISHSOAP1, BOWL1, SINK1, FRIDGE1, FOODBREAD1]) :-
	type(TRASHCAN1, trashcan), type(FOODFOOD1, foodfood), type(RAG1, rag), type(MILK1, milk), type(FOODCHEESE1, foodcheese), type(TABLE1, tabl), type(FAUCET1, faucet), type(DISHSOAP1, dishsoap), type(BOWL1, bowl), type(SINK1, sink), type(FRIDGE1, fridge), type(FOODBREAD1, foodbread).
complete_task(clean_fridge, P) :-
	type(TRASHCAN1, trashcan), type(FOODFOOD1, foodfood), type(RAG1, rag), type(MILK1, milk), type(FOODCHEESE1, foodcheese), type(TABLE1, tabl), type(FAUCET1, faucet), type(DISHSOAP1, dishsoap), type(BOWL1, bowl), type(SINK1, sink), type(FRIDGE1, fridge), type(FOODBREAD1, foodbread),
	transform([close([RAG1, DISHSOAP1, BOWL1, SINK1, FRIDGE1]), holds([MILK1, FOODBREAD1]), sat_on([]), on_top_of([[FOODFOOD1, TRASHCAN1], [FOODCHEESE1, TRASHCAN1], [DISHSOAP1, TABLE1], [BOWL1, TABLE1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([FRIDGE1]), off([FAUCET1]), pour([DISHSOAP1]), putin([MILK1, FOODBREAD1]), soak([RAG1]), squeeze([RAG1]), wipe([FRIDGE1])], P).

% Clean kitchen
get_relevant(clean_kitchen, [RAG1, FAUCET1, TABLE1, CLEANINGBOTTLE1, STOVE1, OVEN1, KITCHENCABINET1, CLEANINGSOLUTION1, SINK1]) :-
	type(RAG1, rag), type(FAUCET1, faucet), type(TABLE1, tabl), type(CLEANINGBOTTLE1, cleaningbottle), type(STOVE1, stove), type(OVEN1, oven), type(KITCHENCABINET1, kitchencabinet), type(CLEANINGSOLUTION1, cleaningsolution), type(SINK1, sink).
complete_task(clean_kitchen, P) :-
	type(RAG1, rag), type(FAUCET1, faucet), type(TABLE1, tabl), type(CLEANINGBOTTLE1, cleaningbottle), type(STOVE1, stove), type(OVEN1, oven), type(KITCHENCABINET1, kitchencabinet), type(CLEANINGSOLUTION1, cleaningsolution), type(SINK1, sink),
	transform([close([RAG1, CLEANINGBOTTLE1, STOVE1, OVEN1, KITCHENCABINET1, CLEANINGSOLUTION1, SINK1]), holds([CLEANINGSOLUTION1]), sat_on([]), on_top_of([]), inside([]), on([FAUCET1]), laid_on([]), used([]), eaten([]), pour([CLEANINGSOLUTION1]), rinse([RAG1]), wipe([STOVE1, OVEN1, KITCHENCABINET1])], P).

% Clean mirror
get_relevant(clean_mirror, [CLEANINGSOLUTION1, MIRROR1, RAG1]) :-
	type(CLEANINGSOLUTION1, cleaningsolution), type(MIRROR1, mirror), type(RAG1, rag).
complete_task(clean_mirror, P) :-
	type(CLEANINGSOLUTION1, cleaningsolution), type(MIRROR1, mirror), type(RAG1, rag),
	transform([close([CLEANINGSOLUTION1, MIRROR1, RAG1]), holds([RAG1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), wipe([MIRROR1])], P).

% Clean room
get_relevant(clean_room, [CLOTHESSHIRT1, TOY2, TOY1, FLOORLAMP1, LIGHT1, TELEVISION1, DRESSER1, CLOTHESPANTS1]) :-
	type(CLOTHESSHIRT1, clothesshirt), type(TOY2, toy), type(TOY1, toy), type(FLOORLAMP1, floorlamp), type(LIGHT1, light), type(TELEVISION1, television), type(DRESSER1, dresser), type(CLOTHESPANTS1, clothespants).
complete_task(clean_room, P) :-
	type(CLOTHESSHIRT1, clothesshirt), type(TOY2, toy), type(TOY1, toy), type(FLOORLAMP1, floorlamp), type(LIGHT1, light), type(TELEVISION1, television), type(DRESSER1, dresser), type(CLOTHESPANTS1, clothespants),
	transform([close([]), holds([]), sat_on([]), on_top_of([[CLOTHESSHIRT1, DRESSER1], [TOY2, DRESSER1], [TOY1, DRESSER1], [CLOTHESPANTS1, DRESSER1]]), inside([]), on([FLOORLAMP1]), laid_on([]), used([]), eaten([]), off([LIGHT1, TELEVISION1]), open([DRESSER1])], P).

% Clean sink
get_relevant(clean_sink, [SOAP1, FAUCET1, SPONGE1, SINK1]) :-
	type(SOAP1, soap), type(FAUCET1, faucet), type(SPONGE1, sponge), type(SINK1, sink).
complete_task(clean_sink, P) :-
	type(SOAP1, soap), type(FAUCET1, faucet), type(SPONGE1, sponge), type(SINK1, sink),
	transform([close([SOAP1, SPONGE1, SINK1]), holds([SINK1]), sat_on([]), on_top_of([[SOAP1, SINK1], [SPONGE1, SINK1]]), inside([]), on([FAUCET1]), laid_on([]), used([]), eaten([]), pour([SOAP1]), rinse([SPONGE1, SINK1]), scrub([SINK1]), soak([SPONGE1])], P).

% Clean toilet
get_relevant(clean_toilet, [TOILET1, CLEANINGSOLUTION1, BRUSH1]) :-
	type(TOILET1, toilet), type(CLEANINGSOLUTION1, cleaningsolution), type(BRUSH1, brush).
complete_task(clean_toilet, P) :-
	type(TOILET1, toilet), type(CLEANINGSOLUTION1, cleaningsolution), type(BRUSH1, brush),
	transform([close([]), holds([]), sat_on([]), on_top_of([[CLEANINGSOLUTION1, TOILET1], [BRUSH1, TOILET1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), pour([CLEANINGSOLUTION1]), scrub([TOILET1])], P).

% Clean toilet
get_relevant(clean_toilet, [TOILET1, BRUSH1]) :-
	type(TOILET1, toilet), type(BRUSH1, brush).
complete_task(clean_toilet, P) :-
	type(TOILET1, toilet), type(BRUSH1, brush),
	transform([close([TOILET1, BRUSH1]), holds([BRUSH1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), scrub([TOILET1])], P).

% Clear table
get_relevant(clear_table, [DRINKINGGLASS1, RAG1, TABLE1, PLATE1, FORK2, SINK1, FORK1, PLATE2]) :-
	type(DRINKINGGLASS1, drinkingglass), type(RAG1, rag), type(TABLE1, tabl), type(PLATE1, plate), type(FORK2, fork), type(SINK1, sink), type(FORK1, fork), type(PLATE2, plate).
complete_task(clear_table, P) :-
	type(DRINKINGGLASS1, drinkingglass), type(RAG1, rag), type(TABLE1, tabl), type(PLATE1, plate), type(FORK2, fork), type(SINK1, sink), type(FORK1, fork), type(PLATE2, plate),
	transform([close([DRINKINGGLASS1, RAG1, PLATE1, FORK2, SINK1, FORK1, PLATE2]), holds([]), sat_on([]), on_top_of([[DRINKINGGLASS1, SINK1], [PLATE1, SINK1], [FORK2, SINK1], [FORK1, SINK1], [PLATE2, SINK1]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Close dresser drawer
get_relevant(close_dresser_drawer, [DRESSER1]) :-
	type(DRESSER1, dresser).
complete_task(close_dresser_drawer, P) :-
	type(DRESSER1, dresser),
	transform([close([DRESSER1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([DRESSER1])], P).

% Comb hair
get_relevant(comb_hair, [HAIR1, MIRROR1, COMB1]) :-
	type(HAIR1, hair), type(MIRROR1, mirror), type(COMB1, comb).
complete_task(comb_hair, P) :-
	type(HAIR1, hair), type(MIRROR1, mirror), type(COMB1, comb),
	transform([close([MIRROR1, COMB1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), brush([HAIR1])], P).

% Come in and leave home
get_relevant(come_in_and_leave_home, [SHOES1]) :-
	type(SHOES1, shoes).
complete_task(come_in_and_leave_home, P) :-
	type(SHOES1, shoes),
	transform([close([SHOES1]), holds([SHOES1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), puton([SHOES1])], P).

% Complete homework
get_relevant(complete_homework, [KEYBOARD1, CHAIR1, MECHANICALPENCIL1, NOTEBOOK1, TEXTBOOK1, NOTES1, DESK1, COMPUTER1]) :-
	type(KEYBOARD1, keyboard), type(CHAIR1, chair), type(MECHANICALPENCIL1, mechanicalpencil), type(NOTEBOOK1, notebook), type(TEXTBOOK1, textbook), type(NOTES1, notes), type(DESK1, desk), type(COMPUTER1, computer).
complete_task(complete_homework, P) :-
	type(KEYBOARD1, keyboard), type(CHAIR1, chair), type(MECHANICALPENCIL1, mechanicalpencil), type(NOTEBOOK1, notebook), type(TEXTBOOK1, textbook), type(NOTES1, notes), type(DESK1, desk), type(COMPUTER1, computer),
	transform([close([CHAIR1]), holds([TEXTBOOK1]), sat_on([CHAIR1]), on_top_of([[NOTEBOOK1, DESK1]]), inside([]), on([COMPUTER1]), laid_on([]), used([]), eaten([]), open([DESK1]), read([TEXTBOOK1]), type([KEYBOARD1]), write([NOTEBOOK1])], P).

% Cook some food
get_relevant(cook_some_food, [COOKINGPOT1, FOODRICE1, FOODCARROT1, FOODSALT1, STOVE1, FOODVEGETABLE1, FOODFRUIT1]) :-
	type(COOKINGPOT1, cookingpot), type(FOODRICE1, foodrice), type(FOODCARROT1, foodcarrot), type(FOODSALT1, foodsalt), type(STOVE1, stove), type(FOODVEGETABLE1, foodvegetable), type(FOODFRUIT1, foodfruit).
complete_task(cook_some_food, P) :-
	type(COOKINGPOT1, cookingpot), type(FOODRICE1, foodrice), type(FOODCARROT1, foodcarrot), type(FOODSALT1, foodsalt), type(STOVE1, stove), type(FOODVEGETABLE1, foodvegetable), type(FOODFRUIT1, foodfruit),
	transform([close([STOVE1]), holds([]), sat_on([]), on_top_of([[COOKINGPOT1, STOVE1], [FOODRICE1, STOVE1], [FOODCARROT1, STOVE1], [FOODSALT1, STOVE1], [FOODVEGETABLE1, STOVE1], [FOODFRUIT1, STOVE1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), cut([FOODCARROT1, FOODVEGETABLE1, FOODFRUIT1]), off([STOVE1])], P).

% Curled hair
get_relevant(curled_hair, [BLOWDRYER1, ELECTRICALOUTLET1, HAIR1]) :-
	type(BLOWDRYER1, blowdryer), type(ELECTRICALOUTLET1, electricaloutlet), type(HAIR1, hair).
complete_task(curled_hair, P) :-
	type(BLOWDRYER1, blowdryer), type(ELECTRICALOUTLET1, electricaloutlet), type(HAIR1, hair),
	transform([close([BLOWDRYER1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), off([BLOWDRYER1]), plugin([BLOWDRYER1]), stretch([HAIR1])], P).

% Cut steak
get_relevant(cut_steak, [KNIFE1, FOODSTEAK1, CHAIR1, FORK1]) :-
	type(KNIFE1, knife), type(FOODSTEAK1, foodsteak), type(CHAIR1, chair), type(FORK1, fork).
complete_task(cut_steak, P) :-
	type(KNIFE1, knife), type(FOODSTEAK1, foodsteak), type(CHAIR1, chair), type(FORK1, fork),
	transform([close([CHAIR1]), holds([KNIFE1, FORK1]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), cut([FOODSTEAK1]), push([FORK1])], P).

% Cut your hair
get_relevant(cut_your_hair, [SCISSORS1, HAIRBRUSH1, MIRROR1, HAIR1]) :-
	type(SCISSORS1, scissors), type(HAIRBRUSH1, hairbrush), type(MIRROR1, mirror), type(HAIR1, hair).
complete_task(cut_your_hair, P) :-
	type(SCISSORS1, scissors), type(HAIRBRUSH1, hairbrush), type(MIRROR1, mirror), type(HAIR1, hair),
	transform([close([SCISSORS1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), brush([HAIR1]), cut([HAIR1])], P).

% Dance
get_relevant(dance, [STEREO1, ARMSBOTH1]) :-
	type(STEREO1, stereo), type(ARMSBOTH1, armsboth).
complete_task(dance, P) :-
	type(STEREO1, stereo), type(ARMSBOTH1, armsboth),
	transform([close([STEREO1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([STEREO1]), laid_on([]), used([]), eaten([]), dance([character1]), stretch([ARMSBOTH1])], P).

% Dance with kids
get_relevant(dance_with_kids, [RADIO1, PHONE1, CHILD1, CHILD2, DRESSER1]) :-
	type(RADIO1, radio), type(PHONE1, phone), type(CHILD1, child), type(CHILD2, child), type(DRESSER1, dresser).
complete_task(dance_with_kids, P) :-
	type(RADIO1, radio), type(PHONE1, phone), type(CHILD1, child), type(CHILD2, child), type(DRESSER1, dresser),
	transform([close([RADIO1, PHONE1, CHILD1, DRESSER1]), holds([PHONE1]), sat_on([]), on_top_of([]), inside([]), on([RADIO1]), laid_on([]), used([]), eaten([]), dance([character1]), greet([CHILD1, CHILD2]), plugin([PHONE1])], P).

% Decorate
get_relevant(decorate, [WALL1, TABLE1, PAINTING1, TABLECLOTH1, CENTERPIECE1]) :-
	type(WALL1, wall), type(TABLE1, tabl), type(PAINTING1, painting), type(TABLECLOTH1, tablecloth), type(CENTERPIECE1, centerpiece).
complete_task(decorate, P) :-
	type(WALL1, wall), type(TABLE1, tabl), type(PAINTING1, painting), type(TABLECLOTH1, tablecloth), type(CENTERPIECE1, centerpiece),
	transform([close([TABLECLOTH1]), holds([]), sat_on([]), on_top_of([[PAINTING1, WALL1], [TABLECLOTH1, TABLE1], [CENTERPIECE1, TABLE1]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Decorate it
get_relevant(decorate_it, [WALL1, TABLE1, PAINTING1, CENTERPIECE1, PAINTING2]) :-
	type(WALL1, wall), type(TABLE1, tabl), type(PAINTING1, painting), type(CENTERPIECE1, centerpiece), type(PAINTING2, painting).
complete_task(decorate_it, P) :-
	type(WALL1, wall), type(TABLE1, tabl), type(PAINTING1, painting), type(CENTERPIECE1, centerpiece), type(PAINTING2, painting),
	transform([close([CENTERPIECE1]), holds([]), sat_on([]), on_top_of([[PAINTING1, WALL1], [CENTERPIECE1, TABLE1], [PAINTING2, WALL1]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Deficate
get_relevant(deficate, [WOMAN1, TOILETPAPER1, TOILET1, CLOTHESPANTS1]) :-
	type(WOMAN1, woman), type(TOILETPAPER1, toiletpaper), type(TOILET1, toilet), type(CLOTHESPANTS1, clothespants).
complete_task(deficate, P) :-
	type(WOMAN1, woman), type(TOILETPAPER1, toiletpaper), type(TOILET1, toilet), type(CLOTHESPANTS1, clothespants),
	transform([close([TOILET1]), holds([TOILETPAPER1]), sat_on([TOILET1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), wipe([WOMAN1])], P).

% Defrost chicken
get_relevant(defrost_chicken, [FAUCET1, FOODCHICKEN1, FREEZER1, SINK1]) :-
	type(FAUCET1, faucet), type(FOODCHICKEN1, foodchicken), type(FREEZER1, freezer), type(SINK1, sink).
complete_task(defrost_chicken, P) :-
	type(FAUCET1, faucet), type(FOODCHICKEN1, foodchicken), type(FREEZER1, freezer), type(SINK1, sink),
	transform([close([FOODCHICKEN1, FREEZER1, SINK1]), holds([SINK1]), sat_on([]), on_top_of([[FOODCHICKEN1, SINK1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([FREEZER1]), off([FAUCET1])], P).

% Dining
get_relevant(dining, [MILK1, TABLE1, CHAIR1, BOWL1, FOODCEREAL1, SPOON1, FRIDGE1, CUPBOARD1]) :-
	type(MILK1, milk), type(TABLE1, tabl), type(CHAIR1, chair), type(BOWL1, bowl), type(FOODCEREAL1, foodcereal), type(SPOON1, spoon), type(FRIDGE1, fridge), type(CUPBOARD1, cupboard).
complete_task(dining, P) :-
	type(MILK1, milk), type(TABLE1, tabl), type(CHAIR1, chair), type(BOWL1, bowl), type(FOODCEREAL1, foodcereal), type(SPOON1, spoon), type(FRIDGE1, fridge), type(CUPBOARD1, cupboard),
	transform([close([MILK1, CHAIR1, BOWL1, FOODCEREAL1, SPOON1, FRIDGE1, CUPBOARD1]), holds([SPOON1]), sat_on([CHAIR1]), on_top_of([[BOWL1, TABLE1]]), inside([]), on([]), laid_on([]), used([]), eaten([BOWL1]), closed([FRIDGE1, CUPBOARD1]), pour([MILK1, FOODCEREAL1])], P).

% Do an art project
get_relevant(do_an_art_project, [SCISSORS1, CRAYON1, PAPER1, DESK1, GLUE1, DRAWING1]) :-
	type(SCISSORS1, scissors), type(CRAYON1, crayon), type(PAPER1, paper), type(DESK1, desk), type(GLUE1, glue), type(DRAWING1, drawing).
complete_task(do_an_art_project, P) :-
	type(SCISSORS1, scissors), type(CRAYON1, crayon), type(PAPER1, paper), type(DESK1, desk), type(GLUE1, glue), type(DRAWING1, drawing),
	transform([close([PAPER1]), holds([PAPER1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), cut([DRAWING1]), fold([PAPER1]), open([DESK1]), unfold([PAPER1])], P).

% Do dishes
get_relevant(do_dishes, [FAUCET1, PLATE1, DISHWASHER1, SINK1]) :-
	type(FAUCET1, faucet), type(PLATE1, plate), type(DISHWASHER1, dishwasher), type(SINK1, sink).
complete_task(do_dishes, P) :-
	type(FAUCET1, faucet), type(PLATE1, plate), type(DISHWASHER1, dishwasher), type(SINK1, sink),
	transform([close([SINK1]), holds([]), sat_on([]), on_top_of([[PLATE1, DISHWASHER1]]), inside([]), on([DISHWASHER1]), laid_on([]), used([]), eaten([]), closed([DISHWASHER1]), off([FAUCET1]), rinse([PLATE1])], P).

% Do facial
get_relevant(do_facial, [FAUCET1, MIRROR1, FACIALCLEANSER1, HANDSBOTH1, FACE1, TOWEL1, FACESOAP1, SINK1]) :-
	type(FAUCET1, faucet), type(MIRROR1, mirror), type(FACIALCLEANSER1, facialcleanser), type(HANDSBOTH1, handsboth), type(FACE1, face), type(TOWEL1, towel), type(FACESOAP1, facesoap), type(SINK1, sink).
complete_task(do_facial, P) :-
	type(FAUCET1, faucet), type(MIRROR1, mirror), type(FACIALCLEANSER1, facialcleanser), type(HANDSBOTH1, handsboth), type(FACE1, face), type(TOWEL1, towel), type(FACESOAP1, facesoap), type(SINK1, sink),
	transform([close([SINK1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), off([FAUCET1]), pour([FACIALCLEANSER1]), rinse([FACE1]), scrub([FACE1]), spread([FACIALCLEANSER1]), wash([HANDSBOTH1, FACE1]), wipe([FACE1])], P).

% Do homework
get_relevant(do_homework, [TABLE1, CHAIR1, NOTEBOOK1, TEXTBOOK1, PENCIL1]) :-
	type(TABLE1, tabl), type(CHAIR1, chair), type(NOTEBOOK1, notebook), type(TEXTBOOK1, textbook), type(PENCIL1, pencil).
complete_task(do_homework, P) :-
	type(TABLE1, tabl), type(CHAIR1, chair), type(NOTEBOOK1, notebook), type(TEXTBOOK1, textbook), type(PENCIL1, pencil),
	transform([close([CHAIR1, NOTEBOOK1]), holds([TEXTBOOK1, PENCIL1]), sat_on([CHAIR1]), on_top_of([[NOTEBOOK1, TABLE1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), pull([CHAIR1]), read([TEXTBOOK1]), write([NOTEBOOK1])], P).

% Do laundry
get_relevant(do_laundry, [WASHINGMACHINE1, BASKETFORCLOTHES1, LAUNDRYDETERGENT1, CLOTHESPANTS1, CLOTHESDRESS1]) :-
	type(WASHINGMACHINE1, washingmachine), type(BASKETFORCLOTHES1, basketforclothes), type(LAUNDRYDETERGENT1, laundrydetergent), type(CLOTHESPANTS1, clothespants), type(CLOTHESDRESS1, clothesdress).
complete_task(do_laundry, P) :-
	type(WASHINGMACHINE1, washingmachine), type(BASKETFORCLOTHES1, basketforclothes), type(LAUNDRYDETERGENT1, laundrydetergent), type(CLOTHESPANTS1, clothespants), type(CLOTHESDRESS1, clothesdress),
	transform([close([WASHINGMACHINE1]), holds([LAUNDRYDETERGENT1]), sat_on([]), on_top_of([[BASKETFORCLOTHES1, WASHINGMACHINE1], [CLOTHESPANTS1, WASHINGMACHINE1], [CLOTHESDRESS1, WASHINGMACHINE1]]), inside([]), on([WASHINGMACHINE1]), laid_on([]), used([]), eaten([]), closed([WASHINGMACHINE1]), pour([LAUNDRYDETERGENT1])], P).

% Do nails
get_relevant(do_nails, [SHOES1, NAILPOLISH1, CLOSET1]) :-
	type(SHOES1, shoes), type(NAILPOLISH1, nailpolish), type(CLOSET1, closet).
complete_task(do_nails, P) :-
	type(SHOES1, shoes), type(NAILPOLISH1, nailpolish), type(CLOSET1, closet),
	transform([close([SHOES1, CLOSET1]), holds([NAILPOLISH1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), open([CLOSET1])], P).

% Do taxes
get_relevant(do_taxes, [DOCUMENT1, KEYBOARD1, CHAIR1, COMPUTER1]) :-
	type(DOCUMENT1, document), type(KEYBOARD1, keyboard), type(CHAIR1, chair), type(COMPUTER1, computer).
complete_task(do_taxes, P) :-
	type(DOCUMENT1, document), type(KEYBOARD1, keyboard), type(CHAIR1, chair), type(COMPUTER1, computer),
	transform([close([CHAIR1]), holds([DOCUMENT1]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), off([COMPUTER1]), pull([CHAIR1]), read([DOCUMENT1]), type([KEYBOARD1])], P).

% Draft home
get_relevant(draft_home, [KEYBOARD1, CHAIR1, MOUSE1, COMPUTER1, DRAWING1]) :-
	type(KEYBOARD1, keyboard), type(CHAIR1, chair), type(MOUSE1, mouse), type(COMPUTER1, computer), type(DRAWING1, drawing).
complete_task(draft_home, P) :-
	type(KEYBOARD1, keyboard), type(CHAIR1, chair), type(MOUSE1, mouse), type(COMPUTER1, computer), type(DRAWING1, drawing),
	transform([close([CHAIR1]), holds([]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([COMPUTER1]), laid_on([]), used([]), eaten([]), type([KEYBOARD1])], P).

% Draw picture
get_relevant(draw_picture, [PEN1, CHAIR1, PAPER1, DESK1]) :-
	type(PEN1, pen), type(CHAIR1, chair), type(PAPER1, paper), type(DESK1, desk).
complete_task(draw_picture, P) :-
	type(PEN1, pen), type(CHAIR1, chair), type(PAPER1, paper), type(DESK1, desk),
	transform([close([CHAIR1]), holds([PEN1]), sat_on([CHAIR1]), on_top_of([[PAPER1, DESK1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([DESK1])], P).

% Dress up and pretend
get_relevant(dress_up_and_pretend, [CLOTHESSHIRT1, CLOSET1, CLOTHESSKIRT1, CLOTHESPANTS1, CLOTHESDRESS1]) :-
	type(CLOTHESSHIRT1, clothesshirt), type(CLOSET1, closet), type(CLOTHESSKIRT1, clothesskirt), type(CLOTHESPANTS1, clothespants), type(CLOTHESDRESS1, clothesdress).
complete_task(dress_up_and_pretend, P) :-
	type(CLOTHESSHIRT1, clothesshirt), type(CLOSET1, closet), type(CLOTHESSKIRT1, clothesskirt), type(CLOTHESPANTS1, clothespants), type(CLOTHESDRESS1, clothesdress),
	transform([close([CLOSET1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([CLOSET1]), dance([character1]), puton([CLOTHESSHIRT1, CLOTHESSKIRT1, CLOTHESPANTS1, CLOTHESDRESS1])], P).

% Drink
get_relevant(drink, [WATERGLASS1]) :-
	type(WATERGLASS1, waterglass).
complete_task(drink, P) :-
	type(WATERGLASS1, waterglass),
	transform([close([WATERGLASS1]), holds([WATERGLASS1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), drink([WATERGLASS1])], P).

% Dry hair
get_relevant(dry_hair, [ELECTRICALOUTLET1, HAIRDRYER1, HAIR1]) :-
	type(ELECTRICALOUTLET1, electricaloutlet), type(HAIRDRYER1, hairdryer), type(HAIR1, hair).
complete_task(dry_hair, P) :-
	type(ELECTRICALOUTLET1, electricaloutlet), type(HAIRDRYER1, hairdryer), type(HAIR1, hair),
	transform([close([HAIRDRYER1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([HAIRDRYER1]), eaten([]), plugin([HAIRDRYER1])], P).

% Dust
get_relevant(dust, [DUSTER1, FILINGCABINET1]) :-
	type(DUSTER1, duster), type(FILINGCABINET1, filingcabinet).
complete_task(dust, P) :-
	type(DUSTER1, duster), type(FILINGCABINET1, filingcabinet),
	transform([close([DUSTER1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), wipe([FILINGCABINET1])], P).

% Eat
get_relevant(eat, [FOODFOOD1, KNIFE1, TABLE1, CHAIR1, PLATE1, FORK1]) :-
	type(FOODFOOD1, foodfood), type(KNIFE1, knife), type(TABLE1, tabl), type(CHAIR1, chair), type(PLATE1, plate), type(FORK1, fork).
complete_task(eat, P) :-
	type(FOODFOOD1, foodfood), type(KNIFE1, knife), type(TABLE1, tabl), type(CHAIR1, chair), type(PLATE1, plate), type(FORK1, fork),
	transform([close([FOODFOOD1]), holds([KNIFE1, FORK1]), sat_on([CHAIR1]), on_top_of([[FOODFOOD1, PLATE1], [PLATE1, TABLE1]]), inside([]), on([]), laid_on([]), used([]), eaten([PLATE1])], P).

% Eat cereal
get_relevant(eat_cereal, [CHAIR1]) :-
	type(CHAIR1, chair).
complete_task(eat_cereal, P) :-
	type(CHAIR1, chair),
	transform([close([]), holds([]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), wash([CHAIR1])], P).

% Eat cheese
get_relevant(eat_cheese, [FRIDGE1, FOODCHEESE1]) :-
	type(FRIDGE1, fridge), type(FOODCHEESE1, foodcheese).
complete_task(eat_cheese, P) :-
	type(FRIDGE1, fridge), type(FOODCHEESE1, foodcheese),
	transform([close([FRIDGE1]), holds([FOODCHEESE1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([FOODCHEESE1]), open([FRIDGE1])], P).

% Eat dessert
get_relevant(eat_dessert, [KNIFE1, TABLE1, PLATE1, FORK1, FRIDGE1, FOODDESSERT1]) :-
	type(KNIFE1, knife), type(TABLE1, tabl), type(PLATE1, plate), type(FORK1, fork), type(FRIDGE1, fridge), type(FOODDESSERT1, fooddessert).
complete_task(eat_dessert, P) :-
	type(KNIFE1, knife), type(TABLE1, tabl), type(PLATE1, plate), type(FORK1, fork), type(FRIDGE1, fridge), type(FOODDESSERT1, fooddessert),
	transform([close([FRIDGE1, FOODDESSERT1]), holds([FORK1]), sat_on([]), on_top_of([[KNIFE1, PLATE1], [FOODDESSERT1, PLATE1]]), inside([]), on([]), laid_on([]), used([]), eaten([PLATE1]), closed([FRIDGE1]), cut([FOODDESSERT1]), uncover([FOODDESSERT1])], P).

% Eat dinner
get_relevant(eat_dinner, [FOODFOOD1, TABLE1, PLATE1, STOVE1, CHAIR1, FORK1]) :-
	type(FOODFOOD1, foodfood), type(TABLE1, tabl), type(PLATE1, plate), type(STOVE1, stove), type(CHAIR1, chair), type(FORK1, fork).
complete_task(eat_dinner, P) :-
	type(FOODFOOD1, foodfood), type(TABLE1, tabl), type(PLATE1, plate), type(STOVE1, stove), type(CHAIR1, chair), type(FORK1, fork),
	transform([close([PLATE1]), holds([FORK1]), sat_on([CHAIR1]), on_top_of([[FOODFOOD1, PLATE1], [PLATE1, TABLE1]]), inside([]), on([]), laid_on([]), used([]), eaten([PLATE1]), uncover([FOODFOOD1])], P).

% Eat donuts
get_relevant(eat_donuts, [FOODDONUT1, PLATE1, BOX1]) :-
	type(FOODDONUT1, fooddonut), type(PLATE1, plate), type(BOX1, box).
complete_task(eat_donuts, P) :-
	type(FOODDONUT1, fooddonut), type(PLATE1, plate), type(BOX1, box),
	transform([close([FOODDONUT1]), holds([]), sat_on([]), on_top_of([[FOODDONUT1, PLATE1]]), inside([]), on([]), laid_on([]), used([]), eaten([PLATE1]), open([BOX1])], P).

% Eat family meals
get_relevant(eat_family_meals, [FOODFOOD1, KNIFE1, TABLE1, MAN1, CHAIR1, PLATE1, CHILD1, FORK1]) :-
	type(FOODFOOD1, foodfood), type(KNIFE1, knife), type(TABLE1, tabl), type(MAN1, man), type(CHAIR1, chair), type(PLATE1, plate), type(CHILD1, child), type(FORK1, fork).
complete_task(eat_family_meals, P) :-
	type(FOODFOOD1, foodfood), type(KNIFE1, knife), type(TABLE1, tabl), type(MAN1, man), type(CHAIR1, chair), type(PLATE1, plate), type(CHILD1, child), type(FORK1, fork),
	transform([close([]), holds([KNIFE1, FORK1]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([PLATE1]), cut([FOODFOOD1]), greet([MAN1, CHILD1]), talk([MAN1, CHILD1])], P).

% Eat meals
get_relevant(eat_meals, [FOODFOOD1, CHAIR1, PLATE1, FORK1, SPOON1, KNIFE1]) :-
	type(FOODFOOD1, foodfood), type(CHAIR1, chair), type(PLATE1, plate), type(FORK1, fork), type(SPOON1, spoon), type(KNIFE1, knife).
complete_task(eat_meals, P) :-
	type(FOODFOOD1, foodfood), type(CHAIR1, chair), type(PLATE1, plate), type(FORK1, fork), type(SPOON1, spoon), type(KNIFE1, knife),
	transform([close([CHAIR1]), holds([FORK1, KNIFE1]), sat_on([CHAIR1]), on_top_of([[SPOON1, PLATE1]]), inside([]), on([]), laid_on([]), used([]), eaten([PLATE1]), cut([FOODFOOD1])], P).

% Eat on fancy china
get_relevant(eat_on_fancy_china, [FOODFOOD1, KNIFE1, CHAIR1, PLATE1, FORK1]) :-
	type(FOODFOOD1, foodfood), type(KNIFE1, knife), type(CHAIR1, chair), type(PLATE1, plate), type(FORK1, fork).
complete_task(eat_on_fancy_china, P) :-
	type(FOODFOOD1, foodfood), type(KNIFE1, knife), type(CHAIR1, chair), type(PLATE1, plate), type(FORK1, fork),
	transform([close([CHAIR1]), holds([KNIFE1, FORK1]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([PLATE1]), cut([FOODFOOD1]), uncover([FOODFOOD1])], P).

% Eat snacks and drink tea
get_relevant(eat_snacks_and_drink_tea, [CHAIR1]) :-
	type(CHAIR1, chair).
complete_task(eat_snacks_and_drink_tea, P) :-
	type(CHAIR1, chair),
	transform([close([]), holds([]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), touch([CHAIR1]), wash([CHAIR1])], P).

% Empty dishwasher and fill dishwasher
get_relevant(empty_dishwasher_and_fill_dishwasher, [DISHSOAP1, PLATE1, FORK2, DISHWASHER1, SINK1, FORK1, PLATE2, CUPBOARD1]) :-
	type(DISHSOAP1, dishsoap), type(PLATE1, plate), type(FORK2, fork), type(DISHWASHER1, dishwasher), type(SINK1, sink), type(FORK1, fork), type(PLATE2, plate), type(CUPBOARD1, cupboard).
complete_task(empty_dishwasher_and_fill_dishwasher, P) :-
	type(DISHSOAP1, dishsoap), type(PLATE1, plate), type(FORK2, fork), type(DISHWASHER1, dishwasher), type(SINK1, sink), type(FORK1, fork), type(PLATE2, plate), type(CUPBOARD1, cupboard),
	transform([close([PLATE1, FORK2, DISHWASHER1, SINK1, FORK1, PLATE2, CUPBOARD1]), holds([]), sat_on([]), on_top_of([[DISHSOAP1, DISHWASHER1], [PLATE1, CUPBOARD1], [FORK2, DISHWASHER1], [FORK1, CUPBOARD1], [PLATE2, DISHWASHER1]]), inside([]), on([DISHWASHER1]), laid_on([]), used([]), eaten([]), closed([DISHWASHER1]), open([CUPBOARD1])], P).

% Enjoy view out window
get_relevant(enjoy_view_out_window, [WINDOW1, CHAIR1]) :-
	type(WINDOW1, window), type(CHAIR1, chair).
complete_task(enjoy_view_out_window, P) :-
	type(WINDOW1, window), type(CHAIR1, chair),
	transform([close([CHAIR1]), holds([]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Entertain
get_relevant(entertain, [FOODCHEESE1, WINEGLASS1, CRACKERS1, COUCH1]) :-
	type(FOODCHEESE1, foodcheese), type(WINEGLASS1, wineglass), type(CRACKERS1, crackers), type(COUCH1, couch), type(COFFEETABLE1, coffeetable).
complete_task(entertain, P) :-
	type(FOODCHEESE1, foodcheese), type(WINEGLASS1, wineglass), type(CRACKERS1, crackers), type(COUCH1, couch),
	transform([close([]), holds([WINEGLASS1]), sat_on([COUCH1]), on_top_of([[FOODCHEESE1, COFFEETABLE1],[CRACKERS1, COFFEETABLE1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), drink([WINEGLASS1])], P).

% Exercise
get_relevant(exercise, [ARMSBOTH1, REMOTECONTROL1, TELEVISION1, LEGSBOTH1, FLOOR1]) :-
	type(ARMSBOTH1, armsboth), type(REMOTECONTROL1, remotecontrol), type(TELEVISION1, television), type(LEGSBOTH1, legsboth), type(FLOOR1, floor).
complete_task(exercise, P) :-
	type(ARMSBOTH1, armsboth), type(REMOTECONTROL1, remotecontrol), type(TELEVISION1, television), type(LEGSBOTH1, legsboth), type(FLOOR1, floor),
	transform([close([REMOTECONTROL1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([TELEVISION1]), laid_on([FLOOR1]), used([]), eaten([]), jump([character1]), standup([character1]), stretch([ARMSBOTH1, LEGSBOTH1])], P).

% Face washing
get_relevant(face_washing, [FAUCET1, WATER1, HANDSBOTH1, FACE1, FACESOAP1, SINK1]) :-
	type(FAUCET1, faucet), type(WATER1, water), type(HANDSBOTH1, handsboth), type(FACE1, face), type(FACESOAP1, facesoap), type(SINK1, sink).
complete_task(face_washing, P) :-
	type(FAUCET1, faucet), type(WATER1, water), type(HANDSBOTH1, handsboth), type(FACE1, face), type(FACESOAP1, facesoap), type(SINK1, sink),
	transform([close([SINK1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), off([FAUCET1]), pour([WATER1, FACESOAP1]), rinse([FACE1]), scrub([FACE1]), spread([FACESOAP1]), wash([FACE1])], P).

% Family meetings
get_relevant(family_meetings, [MAN1, WOMAN1, COUCH1, WOMAN2]) :-
	type(MAN1, man), type(WOMAN1, woman), type(COUCH1, couch), type(WOMAN2, woman).
complete_task(family_meetings, P) :-
	type(MAN1, man), type(WOMAN1, woman), type(COUCH1, couch), type(WOMAN2, woman),
	transform([close([MAN1]), holds([]), sat_on([COUCH1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), greet([MAN1, woMAN1]), talk([MAN1, woMAN1]), touch([WOMAN2])], P).

% Fax forms to doctor
get_relevant(fax_forms_to_doctor, [PEN1, DOCUMENT1, FAXMACHINE1, CHAIR1, FILINGCABINET1, DESK1]) :-
	type(PEN1, pen), type(DOCUMENT1, document), type(FAXMACHINE1, faxmachine), type(CHAIR1, chair), type(FILINGCABINET1, filingcabinet), type(DESK1, desk).
complete_task(fax_forms_to_doctor, P) :-
	type(PEN1, pen), type(DOCUMENT1, document), type(FAXMACHINE1, faxmachine), type(CHAIR1, chair), type(FILINGCABINET1, filingcabinet), type(DESK1, desk),
	transform([close([DOCUMENT1, FAXMACHINE1, FILINGCABINET1]), holds([]), sat_on([CHAIR1]), on_top_of([[DOCUMENT1, FAXMACHINE1]]), inside([]), on([FAXMACHINE1]), laid_on([]), used([]), eaten([]), closed([FILINGCABINET1]), open([DESK1]), write([DOCUMENT1])], P).

% Feed me
get_relevant(feed_me, [FOODFOOD1, PLATE1, FORK1, FOODFOOD2]) :-
	type(FOODFOOD1, foodfood), type(PLATE1, plate), type(FORK1, fork), type(FOODFOOD2, foodfood).
complete_task(feed_me, P) :-
	type(FOODFOOD1, foodfood), type(PLATE1, plate), type(FORK1, fork), type(FOODFOOD2, foodfood),
	transform([close([PLATE1]), holds([PLATE1, FORK1]), sat_on([]), on_top_of([[FOODFOOD1, PLATE1], [FOODFOOD2, PLATE1]]), inside([]), on([]), laid_on([]), used([]), eaten([PLATE1])], P).

% File documents
get_relevant(file_documents, [PEN1, DOCUMENT1, CHAIR1, FILINGCABINET1, DESK1]) :-
	type(PEN1, pen), type(DOCUMENT1, document), type(CHAIR1, chair), type(FILINGCABINET1, filingcabinet), type(DESK1, desk).
complete_task(file_documents, P) :-
	type(PEN1, pen), type(DOCUMENT1, document), type(CHAIR1, chair), type(FILINGCABINET1, filingcabinet), type(DESK1, desk),
	transform([close([DOCUMENT1, FILINGCABINET1, DESK1]), holds([DOCUMENT1]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), open([FILINGCABINET1]), putin([DOCUMENT1]), standup([character1]), write([DOCUMENT1])], P).

% File expense reports
get_relevant(file_expense_reports, [KEYBOARD1, CHAIR1, FILINGCABINET1, MOUSE1, FOLDER1, DESK1, COMPUTER1, RECEIPT1]) :-
	type(KEYBOARD1, keyboard), type(CHAIR1, chair), type(FILINGCABINET1, filingcabinet), type(MOUSE1, mouse), type(FOLDER1, folder), type(DESK1, desk), type(COMPUTER1, computer), type(RECEIPT1, receipt).
complete_task(file_expense_reports, P) :-
	type(KEYBOARD1, keyboard), type(CHAIR1, chair), type(FILINGCABINET1, filingcabinet), type(MOUSE1, mouse), type(FOLDER1, folder), type(DESK1, desk), type(COMPUTER1, computer), type(RECEIPT1, receipt),
	transform([close([FILINGCABINET1]), holds([]), sat_on([CHAIR1]), on_top_of([[MOUSE1, DESK1], [FOLDER1, DESK1], [RECEIPT1, DESK1]]), inside([]), on([COMPUTER1]), laid_on([]), used([]), eaten([]), closed([FILINGCABINET1]), open([FOLDER1, DESK1]), type([KEYBOARD1])], P).

% Fix broken toys
get_relevant(fix_broken_toys, [CLOSET1, TOY1, TABLE1]) :-
	type(CLOSET1, closet), type(TOY1, toy), type(TABLE1, tabl).
complete_task(fix_broken_toys, P) :-
	type(CLOSET1, closet), type(TOY1, toy), type(TABLE1, tabl),
	transform([close([CLOSET1, TOY1]), holds([TOY1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([CLOSET1]), putin([TOY1])], P).

% Fluff pillows
get_relevant(fluff_pillows, [PILLOW2, PILLOW1, BED1]) :-
	type(PILLOW2, pillow), type(PILLOW1, pillow), type(BED1, bed).
complete_task(fluff_pillows, P) :-
	type(PILLOW2, pillow), type(PILLOW1, pillow), type(BED1, bed),
	transform([close([BED1]), holds([]), sat_on([]), on_top_of([[PILLOW2, BED1], [PILLOW1, BED1]]), inside([]), on([]), laid_on([BED1]), used([]), eaten([]), pull([PILLOW2, PILLOW1]), push([PILLOW2, PILLOW1]), shake([PILLOW2, PILLOW1]), sleep([character1]), squeeze([PILLOW2, PILLOW1])], P).

% Flush toilet
get_relevant(flush_toilet, [TOILET1]) :-
	type(TOILET1, toilet).
complete_task(flush_toilet, P) :-
	type(TOILET1, toilet),
	transform([close([TOILET1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), flush([TOILET1])], P).

% Fold laundry
get_relevant(fold_laundry, [CLOTHESSHIRT1, COFFEETABLE1, BASKETFORCLOTHES1, CLOTHESPANTS1, SOFA1]) :-
	type(CLOTHESSHIRT1, clothesshirt), type(COFFEETABLE1, coffeetable), type(BASKETFORCLOTHES1, basketforclothes), type(CLOTHESPANTS1, clothespants), type(SOFA1, sofa).
complete_task(fold_laundry, P) :-
	type(CLOTHESSHIRT1, clothesshirt), type(COFFEETABLE1, coffeetable), type(BASKETFORCLOTHES1, basketforclothes), type(CLOTHESPANTS1, clothespants), type(SOFA1, sofa),
	transform([close([BASKETFORCLOTHES1, SOFA1]), holds([]), sat_on([SOFA1]), on_top_of([[CLOTHESSHIRT1, BASKETFORCLOTHES1], [BASKETFORCLOTHES1, COFFEETABLE1], [CLOTHESPANTS1, BASKETFORCLOTHES1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), fold([CLOTHESSHIRT1, CLOTHESPANTS1])], P).

% Get dressed
get_relevant(get_dressed, [CLOTHESSHIRT1, CLOSET1, CLOTHESPANTS1]) :-
	type(CLOTHESSHIRT1, clothesshirt), type(CLOSET1, closet), type(CLOTHESPANTS1, clothespants).
complete_task(get_dressed, P) :-
	type(CLOTHESSHIRT1, clothesshirt), type(CLOSET1, closet), type(CLOTHESPANTS1, clothespants),
	transform([close([CLOSET1]), holds([CLOTHESSHIRT1, CLOTHESPANTS1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([CLOSET1]), puton([CLOTHESSHIRT1, CLOTHESPANTS1])], P).

% Get drink
get_relevant(get_drink, [WATER1, SINK1, KITCHENCABINET1, GLASS1, FRIDGE1]) :-
	type(WATER1, water), type(SINK1, sink), type(KITCHENCABINET1, kitchencabinet), type(GLASS1, glass), type(FRIDGE1, fridge).
complete_task(get_drink, P) :-
	type(WATER1, water), type(SINK1, sink), type(KITCHENCABINET1, kitchencabinet), type(GLASS1, glass), type(FRIDGE1, fridge),
	transform([close([WATER1, SINK1, GLASS1, FRIDGE1]), holds([WATER1, GLASS1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([KITCHENCABINET1]), open([FRIDGE1]), pour([WATER1])], P).

% Get glass of milk
get_relevant(get_glass_of_milk, [FRIDGE1, MILK1, GLASS1]) :-
	type(FRIDGE1, fridge), type(MILK1, milk), type(GLASS1, glass).
complete_task(get_glass_of_milk, P) :-
	type(FRIDGE1, fridge), type(MILK1, milk), type(GLASS1, glass),
	transform([close([FRIDGE1, GLASS1]), holds([GLASS1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([FRIDGE1]), pour([MILK1])], P).

% Get glass of water
get_relevant(get_glass_of_water, [FAUCET1, GLASS1, KITCHENCABINET1, SINK1]) :-
	type(FAUCET1, faucet), type(GLASS1, glass), type(KITCHENCABINET1, kitchencabinet), type(SINK1, sink).
complete_task(get_glass_of_water, P) :-
	type(FAUCET1, faucet), type(GLASS1, glass), type(KITCHENCABINET1, kitchencabinet), type(SINK1, sink),
	transform([close([GLASS1, KITCHENCABINET1, SINK1]), holds([GLASS1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([KITCHENCABINET1]), off([FAUCET1])], P).

% Get out dish
get_relevant(get_out_dish, [PLATE1, CUPBOARD1]) :-
	type(PLATE1, plate), type(CUPBOARD1, cupboard).
complete_task(get_out_dish, P) :-
	type(PLATE1, plate), type(CUPBOARD1, cupboard),
	transform([close([CUPBOARD1]), holds([PLATE1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([CUPBOARD1])], P).

% Get ready for work
get_relevant(get_ready_for_work, [SHOES1, ELECTRICALOUTLET1, MIRROR1, FACE1, CLOSET1, BLOWDRYER1, FOUNDATION1, HAIR1, CLOTHESDRESS1]) :-
	type(SHOES1, shoes), type(ELECTRICALOUTLET1, electricaloutlet), type(MIRROR1, mirror), type(FACE1, face), type(CLOSET1, closet), type(BLOWDRYER1, blowdryer), type(FOUNDATION1, foundation), type(HAIR1, hair), type(CLOTHESDRESS1, clothesdress).
complete_task(get_ready_for_work, P) :-
	type(SHOES1, shoes), type(ELECTRICALOUTLET1, electricaloutlet), type(MIRROR1, mirror), type(FACE1, face), type(CLOSET1, closet), type(BLOWDRYER1, blowdryer), type(FOUNDATION1, foundation), type(HAIR1, hair), type(CLOTHESDRESS1, clothesdress),
	transform([close([MIRROR1, CLOSET1, BLOWDRYER1, FOUNDATION1]), holds([SHOES1, CLOTHESDRESS1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), brush([HAIR1]), closed([CLOSET1]), off([BLOWDRYER1]), plugin([BLOWDRYER1]), puton([SHOES1, CLOTHESDRESS1]), spread([FOUNDATION1])], P).

% Get some water
get_relevant(get_some_water, [CHAIR1, CLOTHNAPKIN1]) :-
	type(CHAIR1, chair), type(CLOTHNAPKIN1, clothnapkin).
complete_task(get_some_water, P) :-
	type(CHAIR1, chair), type(CLOTHNAPKIN1, clothnapkin),
	transform([close([CHAIR1, CLOTHNAPKIN1]), holds([CLOTHNAPKIN1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), drop([CLOTHNAPKIN1]), push([CHAIR1]), wipe([CHAIR1])], P).

% Get toilet paper
get_relevant(get_toilet_paper, [TOILETPAPER1]) :-
	type(TOILETPAPER1, toiletpaper).
complete_task(get_toilet_paper, P) :-
	type(TOILETPAPER1, toiletpaper),
	transform([close([]), holds([TOILETPAPER1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([])], P).

% Getting  dresses
get_relevant(getting__dresses, [CLOTHESSHIRT1, CLOSET1, CLOTHESPANTS1]) :-
	type(CLOTHESSHIRT1, clothesshirt), type(CLOSET1, closet), type(CLOTHESPANTS1, clothespants).
complete_task(getting__dresses, P) :-
	type(CLOTHESSHIRT1, clothesshirt), type(CLOSET1, closet), type(CLOTHESPANTS1, clothespants),
	transform([close([CLOSET1]), holds([CLOTHESSHIRT1, CLOTHESPANTS1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([CLOSET1]), puton([CLOTHESSHIRT1, CLOTHESPANTS1])], P).

% Give milk to cat
get_relevant(give_milk_to_cat, [MILK1, PLATE1, CAT1]) :-
	type(MILK1, milk), type(PLATE1, plate), type(CAT1, cat).
complete_task(give_milk_to_cat, P) :-
	type(MILK1, milk), type(PLATE1, plate), type(CAT1, cat),
	transform([close([CAT1]), holds([MILK1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), pour([MILK1]), pull([CAT1]), scrub([CAT1]), touch([CAT1])], P).

% Go pee
get_relevant(go_pee, [CLOTHESUNDERWEAR1, SOAP1, FAUCET1, HANDSBOTH1, TOILET1, SINK1, CLOTHESDRESS1]) :-
	type(CLOTHESUNDERWEAR1, clothesunderwear), type(SOAP1, soap), type(FAUCET1, faucet), type(HANDSBOTH1, handsboth), type(TOILET1, toilet), type(SINK1, sink), type(CLOTHESDRESS1, clothesdress).
complete_task(go_pee, P) :-
	type(CLOTHESUNDERWEAR1, clothesunderwear), type(SOAP1, soap), type(FAUCET1, faucet), type(HANDSBOTH1, handsboth), type(TOILET1, toilet), type(SINK1, sink), type(CLOTHESDRESS1, clothesdress),
	transform([close([TOILET1, SINK1]), holds([]), sat_on([TOILET1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), flush([TOILET1]), off([FAUCET1]), rinse([HANDSBOTH1]), standup([character1]), wash([HANDSBOTH1])], P).

% Go to bed
get_relevant(go_to_bed, [BLANKET1, BED1]) :-
	type(BLANKET1, blanket), type(BED1, bed).
complete_task(go_to_bed, P) :-
	type(BLANKET1, blanket), type(BED1, bed),
	transform([close([BED1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([BED1]), used([]), eaten([]), cover([BLANKET1]), sleep([character1]), uncover([BED1])], P).

% Go to sleep
get_relevant(go_to_sleep, [BED1]) :-
	type(BED1, bed).
complete_task(go_to_sleep, P) :-
	type(BED1, bed),
	transform([close([BED1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([BED1]), used([]), eaten([]), sleep([character1])], P).

% Go to toilet
get_relevant(go_to_toilet, [TOILET1]) :-
	type(TOILET1, toilet).
complete_task(go_to_toilet, P) :-
	type(TOILET1, toilet),
	transform([close([TOILET1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([TOILET1]), eaten([]), standup([character1])], P).

% Grading papers
get_relevant(grading_papers, [PEN1, DOCUMENT1, CHAIR1, TEXTBOOK1, FOLDER1, DESK1, COMPUTER1]) :-
	type(PEN1, pen), type(DOCUMENT1, document), type(CHAIR1, chair), type(TEXTBOOK1, textbook), type(FOLDER1, folder), type(DESK1, desk), type(COMPUTER1, computer).
complete_task(grading_papers, P) :-
	type(PEN1, pen), type(DOCUMENT1, document), type(CHAIR1, chair), type(TEXTBOOK1, textbook), type(FOLDER1, folder), type(DESK1, desk), type(COMPUTER1, computer),
	transform([close([TEXTBOOK1]), holds([PEN1, DOCUMENT1, TEXTBOOK1]), sat_on([CHAIR1]), on_top_of([[FOLDER1, DESK1]]), inside([]), on([COMPUTER1]), laid_on([]), used([]), eaten([]), open([FOLDER1, DESK1]), read([TEXTBOOK1]), write([DOCUMENT1])], P).

% Greet guests
get_relevant(greet_guests, [WOMAN2, WOMAN1]) :-
	type(WOMAN2, woman), type(WOMAN1, woman).
complete_task(greet_guests, P) :-
	type(WOMAN2, woman), type(WOMAN1, woman),
	transform([close([WOMAN1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), greet([WOMAN2, WOMAN1])], P).

% Greet people
get_relevant(greet_people, [MAN2, MAN1, WOMAN1, WOMAN2]) :-
	type(MAN2, man), type(MAN1, man), type(WOMAN1, woman), type(WOMAN2, woman).
complete_task(greet_people, P) :-
	type(MAN2, man), type(MAN1, man), type(WOMAN1, woman), type(WOMAN2, woman),
	transform([close([woMAN1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), greet([MAN2, MAN1, woMAN1, woMAN2])], P).

% Hair
get_relevant(hair, [HAIRBRUSH1, MIRROR1, HAIR1, COMB1]) :-
	type(HAIRBRUSH1, hairbrush), type(MIRROR1, mirror), type(HAIR1, hair), type(COMB1, comb).
complete_task(hair, P) :-
	type(HAIRBRUSH1, hairbrush), type(MIRROR1, mirror), type(HAIR1, hair), type(COMB1, comb),
	transform([close([HAIRBRUSH1, MIRROR1, COMB1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), brush([HAIR1])], P).

% Hair dressing
get_relevant(hair_dressing, [HAIRBRUSH1, ELECTRICALOUTLET1, HAIRDRYER1, HAIR1]) :-
	type(HAIRBRUSH1, hairbrush), type(ELECTRICALOUTLET1, electricaloutlet), type(HAIRDRYER1, hairdryer), type(HAIR1, hair).
complete_task(hair_dressing, P) :-
	type(HAIRBRUSH1, hairbrush), type(ELECTRICALOUTLET1, electricaloutlet), type(HAIRDRYER1, hairdryer), type(HAIR1, hair),
	transform([close([HAIRBRUSH1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), brush([HAIR1]), off([HAIRDRYER1]), plugin([HAIRDRYER1]), shake([HAIRDRYER1])], P).

% Hand washing
get_relevant(hand_washing, [SOAP1, FAUCET1, HANDSBOTH1, TOWEL1, SINK1]) :-
	type(SOAP1, soap), type(FAUCET1, faucet), type(HANDSBOTH1, handsboth), type(TOWEL1, towel), type(SINK1, sink).
complete_task(hand_washing, P) :-
	type(SOAP1, soap), type(FAUCET1, faucet), type(HANDSBOTH1, handsboth), type(TOWEL1, towel), type(SINK1, sink),
	transform([close([SINK1]), holds([TOWEL1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), off([FAUCET1]), scrub([HANDSBOTH1]), wash([HANDSBOTH1]), wipe([HANDSBOTH1])], P).

% Hang out
get_relevant(hang_out, [WOMAN2, WOMAN1, COUCH1]) :-
	type(WOMAN2, woman), type(WOMAN1, woman), type(COUCH1, couch).
complete_task(hang_out, P) :-
	type(WOMAN2, woman), type(WOMAN1, woman), type(COUCH1, couch),
	transform([close([WOMAN1]), holds([]), sat_on([COUCH1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), greet([WOMAN2, WOMAN1]), talk([WOMAN2, WOMAN1])], P).

% Hang up jacket
get_relevant(hang_up_jacket, [HANGER1, CLOTHESJACKET1]) :-
	type(HANGER1, hanger), type(CLOTHESJACKET1, clothesjacket).
complete_task(hang_up_jacket, P) :-
	type(HANGER1, hanger), type(CLOTHESJACKET1, clothesjacket),
	transform([close([CLOTHESJACKET1]), holds([]), sat_on([]), on_top_of([[CLOTHESJACKET1, HANGER1]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Hang with friends
get_relevant(hang_with_friends, [MAN1, WOMAN1, COUCH1]) :-
	type(MAN1, man), type(WOMAN1, woman), type(COUCH1, couch).
complete_task(hang_with_friends, P) :-
	type(MAN1, man), type(WOMAN1, woman), type(COUCH1, couch),
	transform([close([MAN1, COUCH1]), holds([]), sat_on([COUCH1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), greet([MAN1, woMAN1])], P).

% Have conversation with boyfriend
get_relevant(have_conversation_with_boyfriend, [MAN1, SOFA1]) :-
	type(MAN1, man), type(SOFA1, sofa).
complete_task(have_conversation_with_boyfriend, P) :-
	type(MAN1, man), type(SOFA1, sofa),
	transform([close([SOFA1]), holds([]), sat_on([SOFA1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), greet([MAN1])], P).

% Have quality family time
get_relevant(have_quality_family_time, [TABLE1, CHAIR1, DECKOFCARDS1, CHILD1, CARDS1]) :-
	type(TABLE1, tabl), type(CHAIR1, chair), type(DECKOFCARDS1, deckofcards), type(CHILD1, child), type(CARDS1, cards).
complete_task(have_quality_family_time, P) :-
	type(TABLE1, tabl), type(CHAIR1, chair), type(DECKOFCARDS1, deckofcards), type(CHILD1, child), type(CARDS1, cards),
	transform([close([CHILD1]), holds([]), sat_on([CHAIR1]), on_top_of([[DECKOFCARDS1, TABLE1], [CARDS1, TABLE1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), greet([CHILD1]), play([CARDS1]), uncover([DECKOFCARDS1])], P).

% Have snack
get_relevant(have_snack, [JUICE1, GLASS1, FRIDGE1, FOODSNACK1, CUPBOARD1]) :-
	type(JUICE1, juice), type(GLASS1, glass), type(FRIDGE1, fridge), type(FOODSNACK1, foodsnack), type(CUPBOARD1, cupboard).
complete_task(have_snack, P) :-
	type(JUICE1, juice), type(GLASS1, glass), type(FRIDGE1, fridge), type(FOODSNACK1, foodsnack), type(CUPBOARD1, cupboard),
	transform([close([JUICE1, GLASS1, FRIDGE1, CUPBOARD1]), holds([JUICE1, GLASS1, FOODSNACK1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([FOODSNACK1]), closed([FRIDGE1, CUPBOARD1]), drink([GLASS1]), pour([JUICE1]), putin([JUICE1])], P).

% Help organize files
get_relevant(help_organize_files, [PEN1, BOX4, BOX1, DOCUMENT1, BOX2, DOCUMENT2, BOX3, DOCUMENT4, DOCUMENT3]) :-
	type(PEN1, pen), type(BOX4, box), type(BOX1, box), type(DOCUMENT1, document), type(BOX2, box), type(DOCUMENT2, document), type(BOX3, box), type(DOCUMENT4, document), type(DOCUMENT3, document).
complete_task(help_organize_files, P) :-
	type(PEN1, pen), type(BOX4, box), type(BOX1, box), type(DOCUMENT1, document), type(BOX2, box), type(DOCUMENT2, document), type(BOX3, box), type(DOCUMENT4, document), type(DOCUMENT3, document),
	transform([close([PEN1]), holds([PEN1, BOX4, BOX1, DOCUMENT1, BOX2, DOCUMENT2, BOX3, DOCUMENT4, DOCUMENT3]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), putin([DOCUMENT1, DOCUMENT2, DOCUMENT4, DOCUMENT3]), write([BOX4, BOX1, BOX2, BOX3])], P).

% Hide
get_relevant(hides, [CHAIR1]) :-
	type(CHAIR1, chair).
complete_task(hides, P) :-
	type(CHAIR1, chair),
	transform([close([CHAIR1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), crawl([CHAIR1]), pull([CHAIR1]), push([CHAIR1])], P).

% Homework
get_relevant(homework, [KEYBOARD1, CHAIR1, NOTEBOOK1, NOTES1, COMPUTER1]) :-
	type(KEYBOARD1, keyboard), type(CHAIR1, chair), type(NOTEBOOK1, notebook), type(NOTES1, notes), type(COMPUTER1, computer).
complete_task(homework, P) :-
	type(KEYBOARD1, keyboard), type(CHAIR1, chair), type(NOTEBOOK1, notebook), type(NOTES1, notes), type(COMPUTER1, computer),
	transform([close([CHAIR1]), holds([NOTEBOOK1, NOTES1]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([COMPUTER1]), laid_on([]), used([]), eaten([]), read([NOTES1]), type([KEYBOARD1])], P).

% Ignore people
get_relevant(ignore_people, [EYESBOTH1, LEGSBOTH1, BED1]) :-
	type(EYESBOTH1, eyesboth), type(LEGSBOTH1, legsboth), type(BED1, bed).
complete_task(ignore_people, P) :-
	type(EYESBOTH1, eyesboth), type(LEGSBOTH1, legsboth), type(BED1, bed),
	transform([close([BED1]), holds([]), sat_on([BED1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([EYESBOTH1]), stretch([LEGSBOTH1])], P).

% In living room i eat dinner
get_relevant(in_living_room_i_eat_dinner, [FOODFOOD1, COFFEETABLE1, PLATE1, WINEGLASS1, COUCH1, REMOTECONTROL1, WINE1, TELEVISION1, FORK1]) :-
	type(FOODFOOD1, foodfood), type(COFFEETABLE1, coffeetable), type(PLATE1, plate), type(WINEGLASS1, wineglass), type(COUCH1, couch), type(REMOTECONTROL1, remotecontrol), type(WINE1, wine), type(TELEVISION1, television), type(FORK1, fork).
complete_task(in_living_room_i_eat_dinner, P) :-
	type(FOODFOOD1, foodfood), type(COFFEETABLE1, coffeetable), type(PLATE1, plate), type(WINEGLASS1, wineglass), type(COUCH1, couch), type(REMOTECONTROL1, remotecontrol), type(WINE1, wine), type(TELEVISION1, television), type(FORK1, fork),
	transform([close([COFFEETABLE1, PLATE1, WINEGLASS1, WINE1]), holds([PLATE1, WINEGLASS1, FORK1]), sat_on([COUCH1]), on_top_of([[FOODFOOD1, PLATE1], [WINE1, COFFEETABLE1]]), inside([]), on([TELEVISION1]), laid_on([]), used([]), eaten([PLATE1]), drink([WINEGLASS1]), pour([WINE1]), watch([TELEVISION1])], P).

% Iron shirt
get_relevant(iron_shirt, [CLOTHESSHIRT1, IRONINGBOARD1, IRON1]) :-
	type(CLOTHESSHIRT1, clothesshirt), type(IRONINGBOARD1, ironingboard), type(IRON1, iron).
complete_task(iron_shirt, P) :-
	type(CLOTHESSHIRT1, clothesshirt), type(IRONINGBOARD1, ironingboard), type(IRON1, iron),
	transform([close([IRONINGBOARD1]), holds([]), sat_on([]), on_top_of([[CLOTHESSHIRT1, IRONINGBOARD1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), plugin([IRON1])], P).

% Keep an eye on stove as something is cooking
get_relevant(keep_an_eye_on_stove_as_something_is_cooking, [STOVE1, POT1, WALLCLOCK1]) :-
	type(STOVE1, stove), type(POT1, pot), type(WALLCLOCK1, wallclock).
complete_task(keep_an_eye_on_stove_as_something_is_cooking, P) :-
	type(STOVE1, stove), type(POT1, pot), type(WALLCLOCK1, wallclock),
	transform([close([STOVE1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), off([STOVE1])], P).

% Keep cats inside while door is open
get_relevant(keep_cats_inside_while_door_is_open, [CAT1]) :-
	type(CAT1, cat).
complete_task(keep_cats_inside_while_door_is_open, P) :-
	type(CAT1, cat),
	transform([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), pull([CAT1])], P).

% Laugh
get_relevant(laugh, [MAN1, COUCH1, CHILD1, CHILD2]) :-
	type(MAN1, man), type(COUCH1, couch), type(CHILD1, child), type(CHILD2, child).
complete_task(laugh, P) :-
	type(MAN1, man), type(COUCH1, couch), type(CHILD1, child), type(CHILD2, child),
	transform([close([COUCH1]), holds([]), sat_on([COUCH1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), greet([MAN1, CHILD1, CHILD2]), laugh([character1])], P).

% Lay down on floor and say, i'm rug
get_relevant(lay_down_on_floor_and_say_im_rug, [CARPET1]) :-
	type(CARPET1, carpet).
complete_task(lay_down_on_floor_and_say_im_rug, P) :-
	type(CARPET1, carpet),
	transform([close([CARPET1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([CARPET1]), used([]), eaten([]), speak([character1])], P).

% Lay tablecloth
get_relevant(lay_tablecloth, [TABLECLOTH1]) :-
	type(TABLECLOTH1, tablecloth).
complete_task(lay_tablecloth, P) :-
	type(TABLECLOTH1, tablecloth),
	transform([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), crawl([]), wash([TABLECLOTH1])], P).

% Let baby learn how to walk
get_relevant(let_baby_learn_how_to_walk, [CHILD1, COUCH1]) :-
	type(CHILD1, child), type(COUCH1, couch).
complete_task(let_baby_learn_how_to_walk, P) :-
	type(CHILD1, child), type(COUCH1, couch),
	transform([close([CHILD1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), greet([CHILD1]), touch([CHILD1])], P).

% Listen to music
get_relevant(listen_to_music, [DVDPLAYER1, SOFA1]) :-
	type(DVDPLAYER1, dvdplayer), type(SOFA1, sofa).
complete_task(listen_to_music, P) :-
	type(DVDPLAYER1, dvdplayer), type(SOFA1, sofa),
	transform([close([DVDPLAYER1]), holds([]), sat_on([SOFA1]), on_top_of([]), inside([]), on([DVDPLAYER1]), laid_on([]), used([]), eaten([])], P).

% Load dishwasher
get_relevant(load_dishwasher, [FAUCET1, PLATE1, BOWL1, BOWL2, DISHWASHER1, SINK1]) :-
	type(FAUCET1, faucet), type(PLATE1, plate), type(BOWL1, bowl), type(BOWL2, bowl), type(DISHWASHER1, dishwasher), type(SINK1, sink).
complete_task(load_dishwasher, P) :-
	type(FAUCET1, faucet), type(PLATE1, plate), type(BOWL1, bowl), type(BOWL2, bowl), type(DISHWASHER1, dishwasher), type(SINK1, sink),
	transform([close([PLATE1, BOWL1, BOWL2, DISHWASHER1, SINK1]), holds([]), sat_on([]), on_top_of([[PLATE1, DISHWASHER1], [BOWL1, DISHWASHER1], [BOWL2, DISHWASHER1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([DISHWASHER1]), off([FAUCET1]), rinse([PLATE1, BOWL1, BOWL2])], P).

% Lock door


% Look in refrigerator
get_relevant(look_in_refrigerator, [FRIDGE1, KITCHENCABINET1, FOODFOOD2]) :-
	type(FRIDGE1, fridge), type(KITCHENCABINET1, kitchencabinet), type(FOODFOOD2, foodfood).
complete_task(look_in_refrigerator, P) :-
	type(FRIDGE1, fridge), type(KITCHENCABINET1, kitchencabinet), type(FOODFOOD2, foodfood),
	transform([close([FRIDGE1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([FRIDGE1, KITCHENCABINET1])], P).

% Look out window
get_relevant(look_out_window, [WINDOW1]) :-
	type(WINDOW1, window).
complete_task(look_out_window, P) :-
	type(WINDOW1, window),
	transform([close([WINDOW1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Mail signed letter to customer
get_relevant(mail_signed_letter_to_customer, [PEN1, STAMP1, DOCUMENT1, KEYBOARD1, ENVELOPE1, ADDRESSBOOK1, PRINTINGPAPER1, COMPUTER1, PRINTER1]) :-
	type(PEN1, pen), type(STAMP1, stamp), type(DOCUMENT1, document), type(KEYBOARD1, keyboard), type(ENVELOPE1, envelope), type(ADDRESSBOOK1, addressbook), type(PRINTINGPAPER1, printingpaper), type(COMPUTER1, computer), type(PRINTER1, printer).
complete_task(mail_signed_letter_to_customer, P) :-
	type(PEN1, pen), type(STAMP1, stamp), type(DOCUMENT1, document), type(KEYBOARD1, keyboard), type(ENVELOPE1, envelope), type(ADDRESSBOOK1, addressbook), type(PRINTINGPAPER1, printingpaper), type(COMPUTER1, computer), type(PRINTER1, printer),
	transform([close([COMPUTER1]), holds([PEN1, ADDRESSBOOK1]), sat_on([]), on_top_of([[STAMP1, ENVELOPE1], [DOCUMENT1, ENVELOPE1], [PRINTINGPAPER1, PRINTER1]]), inside([]), on([COMPUTER1, PRINTER1]), laid_on([]), used([]), eaten([]), fold([DOCUMENT1]), read([DOCUMENT1]), type([KEYBOARD1]), write([ENVELOPE1])], P).

% Make  cookies
get_relevant(make__cookies, [COFFEETABLE1, DOUGH1, OVEN1, TRAY1, FRIDGE1, OVENMITTS1]) :-
	type(COFFEETABLE1, coffeetable), type(DOUGH1, dough), type(OVEN1, oven), type(TRAY1, tray), type(FRIDGE1, fridge), type(OVENMITTS1, ovenmitts).
complete_task(make__cookies, P) :-
	type(COFFEETABLE1, coffeetable), type(DOUGH1, dough), type(OVEN1, oven), type(TRAY1, tray), type(FRIDGE1, fridge), type(OVENMITTS1, ovenmitts),
	transform([close([FRIDGE1]), holds([]), sat_on([]), on_top_of([[DOUGH1, TRAY1], [TRAY1, COFFEETABLE1], [OVENMITTS1, COFFEETABLE1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([OVEN1, FRIDGE1]), off([OVEN1]), putin([TRAY1]), puton([OVENMITTS1]), wait([character1])], P).

% Make bed
get_relevant(make_bed, [PILLOW2, SHEETS1, BED1, PILLOW1, BLANKET1]) :-
	type(PILLOW2, pillow), type(SHEETS1, sheets), type(BED1, bed), type(PILLOW1, pillow), type(BLANKET1, blanket).
complete_task(make_bed, P) :-
	type(PILLOW2, pillow), type(SHEETS1, sheets), type(BED1, bed), type(PILLOW1, pillow), type(BLANKET1, blanket),
	transform([close([BED1]), holds([]), sat_on([]), on_top_of([[PILLOW2, BED1], [SHEETS1, BED1], [PILLOW1, BED1], [BLANKET1, BED1]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Make cereal
get_relevant(make_cereal, [MILK1, TABLE1, BOWL1, FOODCEREAL1, SPOON1, FRIDGE1, CUPBOARD1]) :-
	type(MILK1, milk), type(TABLE1, tabl), type(BOWL1, bowl), type(FOODCEREAL1, foodcereal), type(SPOON1, spoon), type(FRIDGE1, fridge), type(CUPBOARD1, cupboard).
complete_task(make_cereal, P) :-
	type(MILK1, milk), type(TABLE1, tabl), type(BOWL1, bowl), type(FOODCEREAL1, foodcereal), type(SPOON1, spoon), type(FRIDGE1, fridge), type(CUPBOARD1, cupboard),
	transform([close([FRIDGE1, CUPBOARD1]), holds([MILK1, SPOON1]), sat_on([]), on_top_of([[BOWL1, TABLE1], [FOODCEREAL1, TABLE1]]), inside([]), on([]), laid_on([]), used([]), eaten([BOWL1]), closed([FRIDGE1, CUPBOARD1]), pour([MILK1, FOODCEREAL1])], P).

% Make child's bed
get_relevant(make_childs_bed, [BED1]) :-
	type(BED1, bed).
complete_task(make_childs_bed, P) :-
	type(BED1, bed),
	transform([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), touch([BED1]), wipe([BED1])], P).

% Make coffee
get_relevant(make_coffee, [GROUNDCOFFEE1, COFFEEFILTER1, COFFEMAKER1]) :-
	type(GROUNDCOFFEE1, groundcoffee), type(COFFEEFILTER1, coffeefilter), type(COFFEMAKER1, coffemaker).
complete_task(make_coffee, P) :-
	type(GROUNDCOFFEE1, groundcoffee), type(COFFEEFILTER1, coffeefilter), type(COFFEMAKER1, coffemaker),
	transform([close([COFFEMAKER1]), holds([]), sat_on([]), on_top_of([[GROUNDCOFFEE1, COFFEMAKER1], [COFFEEFILTER1, COFFEMAKER1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([COFFEMAKER1]), plugin([COFFEMAKER1])], P).

% Make drink
get_relevant(make_drink, [MILK1, KITCHENCABINET1, SPOON1, GLASS1]) :-
	type(MILK1, milk), type(KITCHENCABINET1, kitchencabinet), type(SPOON1, spoon), type(GLASS1, glass).
complete_task(make_drink, P) :-
	type(MILK1, milk), type(KITCHENCABINET1, kitchencabinet), type(SPOON1, spoon), type(GLASS1, glass),
	transform([close([MILK1, GLASS1]), holds([MILK1, GLASS1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), pour([MILK1])], P).

% Make eggs
get_relevant(make_eggs, [FRYINGPAN1, FOODEGG2, STOVE1, FRIDGE1, FOODEGG1]) :-
	type(FRYINGPAN1, fryingpan), type(FOODEGG2, foodegg), type(STOVE1, stove), type(FRIDGE1, fridge), type(FOODEGG1, foodegg).
complete_task(make_eggs, P) :-
	type(FRYINGPAN1, fryingpan), type(FOODEGG2, foodegg), type(STOVE1, stove), type(FRIDGE1, fridge), type(FOODEGG1, foodegg),
	transform([close([FRYINGPAN1, FOODEGG2, STOVE1, FRIDGE1, FOODEGG1]), holds([FRYINGPAN1]), sat_on([]), on_top_of([[FOODEGG2, FRYINGPAN1], [FOODEGG1, FRYINGPAN1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([FRIDGE1]), off([STOVE1]), shake([FRYINGPAN1])], P).

% Make ice in ice trays for freezer
get_relevant(make_ice_in_ice_trays_for_freezer, [WATER1]) :-
	type(WATER1, water).
complete_task(make_ice_in_ice_trays_for_freezer, P) :-
	type(WATER1, water),
	transform([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), crawl([]), drink([WATER1])], P).

% Make jello
get_relevant(make_jello, [WATER1]) :-
	type(WATER1, water).
complete_task(make_jello, P) :-
	type(WATER1, water),
	transform([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), crawl([]), drink([WATER1])], P).

% Make sandwich
get_relevant(make_sandwich, [FOODBREAD2, PLATE1, FOODVEGETABLE2, FOODVEGETABLE1, FOODBREAD1, SAUCE1, FOODVEGETABLE3]) :-
	type(FOODBREAD2, foodbread), type(PLATE1, plate), type(FOODVEGETABLE2, foodvegetable), type(FOODVEGETABLE1, foodvegetable), type(FOODBREAD1, foodbread), type(SAUCE1, sauce), type(FOODVEGETABLE3, foodvegetable).
complete_task(make_sandwich, P) :-
	type(FOODBREAD2, foodbread), type(PLATE1, plate), type(FOODVEGETABLE2, foodvegetable), type(FOODVEGETABLE1, foodvegetable), type(FOODBREAD1, foodbread), type(SAUCE1, sauce), type(FOODVEGETABLE3, foodvegetable),
	transform([close([PLATE1]), holds([FOODBREAD2]), sat_on([]), on_top_of([[PLATE1, FOODBREAD1], [FOODVEGETABLE2, FOODBREAD1], [FOODVEGETABLE1, FOODBREAD1], [FOODBREAD1, PLATE1], [SAUCE1, FOODVEGETABLE3], [FOODVEGETABLE3, FOODBREAD1]]), inside([]), on([]), laid_on([]), used([]), eaten([PLATE1])], P).

% Make several copies on printer
get_relevant(make_several_copies_on_printer, [DOCUMENT1, PAPER1, DESK1, PRINTER1]) :-
	type(DOCUMENT1, document), type(PAPER1, paper), type(DESK1, desk), type(PRINTER1, printer).
complete_task(make_several_copies_on_printer, P) :-
	type(DOCUMENT1, document), type(PAPER1, paper), type(DESK1, desk), type(PRINTER1, printer),
	transform([close([DOCUMENT1, PAPER1, DESK1, PRINTER1]), holds([]), sat_on([]), on_top_of([[DOCUMENT1, PRINTER1], [PAPER1, PRINTER1]]), inside([]), on([PRINTER1]), laid_on([]), used([]), eaten([]), touch([PRINTER1])], P).

% Make tea
get_relevant(make_tea, [FAUCET1, TABLE1, TEABAG1, STOVE1, CUP1, POT1, TEA1, SINK1, CUPBOARD1]) :-
	type(FAUCET1, faucet), type(TABLE1, tabl), type(TEABAG1, teabag), type(STOVE1, stove), type(CUP1, cup), type(POT1, pot), type(TEA1, tea), type(SINK1, sink), type(CUPBOARD1, cupboard).
complete_task(make_tea, P) :-
	type(FAUCET1, faucet), type(TABLE1, tabl), type(TEABAG1, teabag), type(STOVE1, stove), type(CUP1, cup), type(POT1, pot), type(TEA1, tea), type(SINK1, sink), type(CUPBOARD1, cupboard),
	transform([close([TEABAG1, STOVE1, CUP1, POT1, TEA1, CUPBOARD1]), holds([]), sat_on([]), on_top_of([[TEABAG1, TABLE1], [CUP1, TABLE1], [TEA1, TABLE1]]), inside([]), on([FAUCET1]), laid_on([]), used([]), eaten([]), drop([TEABAG1]), off([STOVE1]), pour([TEA1]), wait([character1])], P).

% Make toast
get_relevant(make_toast, [TOASTER1, FOODBREAD1]) :-
	type(TOASTER1, toaster), type(FOODBREAD1, foodbread).
complete_task(make_toast, P) :-
	type(TOASTER1, toaster), type(FOODBREAD1, foodbread),
	transform([close([]), holds([]), sat_on([]), on_top_of([[FOODBREAD1, TOASTER1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([]), plugin([TOASTER1])], P).

% Massage
get_relevant(massage, [ARMSBOTH1, MAN1, BED1, FEETBOTH1, LEGSBOTH1]) :-
	type(ARMSBOTH1, armsboth), type(MAN1, man), type(BED1, bed), type(FEETBOTH1, feetboth), type(LEGSBOTH1, legsboth).
complete_task(massage, P) :-
	type(ARMSBOTH1, armsboth), type(MAN1, man), type(BED1, bed), type(FEETBOTH1, feetboth), type(LEGSBOTH1, legsboth),
	transform([close([BED1]), holds([]), sat_on([BED1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), greet([MAN1]), squeeze([ARMSBOTH1, FEETBOTH1, LEGSBOTH1]), standup([character1]), stretch([ARMSBOTH1, LEGSBOTH1]), touch([ARMSBOTH1, MAN1, FEETBOTH1, LEGSBOTH1])], P).

% Meeting
get_relevant(meeting, [MAN2, DOCUMENT1, MAN1, FOLDER1, DESK1, SOFA1]) :-
	type(MAN2, man), type(DOCUMENT1, document), type(MAN1, man), type(FOLDER1, folder), type(DESK1, desk), type(SOFA1, sofa).
complete_task(meeting, P) :-
	type(MAN2, man), type(DOCUMENT1, document), type(MAN1, man), type(FOLDER1, folder), type(DESK1, desk), type(SOFA1, sofa),
	transform([close([MAN1, DESK1]), holds([DOCUMENT1, FOLDER1]), sat_on([SOFA1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([FOLDER1]), greet([MAN2, MAN1]), read([DOCUMENT1]), talk([MAN2, MAN1])], P).

% Mop
get_relevant(mop, [FAUCET1, MOP1, CLEANINGSOLUTION1, MOPBUCKET1, FLOOR1]) :-
	type(FAUCET1, faucet), type(MOP1, mop), type(CLEANINGSOLUTION1, cleaningsolution), type(MOPBUCKET1, mopbucket), type(FLOOR1, floor).
complete_task(mop, P) :-
	type(FAUCET1, faucet), type(MOP1, mop), type(CLEANINGSOLUTION1, cleaningsolution), type(MOPBUCKET1, mopbucket), type(FLOOR1, floor),
	transform([close([FAUCET1, MOPBUCKET1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([FAUCET1]), laid_on([]), used([]), eaten([]), pour([CLEANINGSOLUTION1]), soak([MOP1]), squeeze([MOP1]), wash([FLOOR1])], P).

% Mop floor
get_relevant(mop_floor, [FAUCET1, MOP1, CLEANINGSOLUTION1, SINK1, MOPBUCKET1, FLOOR1]) :-
	type(FAUCET1, faucet), type(MOP1, mop), type(CLEANINGSOLUTION1, cleaningsolution), type(SINK1, sink), type(MOPBUCKET1, mopbucket), type(FLOOR1, floor).
complete_task(mop_floor, P) :-
	type(FAUCET1, faucet), type(MOP1, mop), type(CLEANINGSOLUTION1, cleaningsolution), type(SINK1, sink), type(MOPBUCKET1, mopbucket), type(FLOOR1, floor),
	transform([close([MOP1, CLEANINGSOLUTION1, SINK1, MOPBUCKET1]), holds([]), sat_on([]), on_top_of([[CLEANINGSOLUTION1, FLOOR1], [MOP1, MOPBUCKET1], [MOPBUCKET1, FLOOR1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), scrub([MOP1])], P).

% Movie
get_relevant(movie, [CDPLAYER1, TELEVISION1]) :-
	type(CDPLAYER1, cdplayer), type(TELEVISION1, television).
complete_task(movie, P) :-
	type(CDPLAYER1, cdplayer), type(TELEVISION1, television),
	transform([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([TELEVISION1]), laid_on([]), used([]), eaten([]), off([CDPLAYER1])], P).

% Open curtains
get_relevant(open_curtains, [CURTAIN2, CURTAIN1]) :-
	type(CURTAIN2, curtain), type(CURTAIN1, curtain).
complete_task(open_curtains, P) :-
	type(CURTAIN2, curtain), type(CURTAIN1, curtain),
	transform([close([CURTAIN2, CURTAIN1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), open([CURTAIN2, CURTAIN1])], P).

% Open door


% Organise paperwork
get_relevant(organise_paperwork, [PAPER1]) :-
	type(PAPER1, paper).
complete_task(organise_paperwork, P) :-
	type(PAPER1, paper),
	transform([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), fold([PAPER1]), write([PAPER1])], P).

% Organize
get_relevant(organize, [TOOTHBRUSH1, CUPBOARD1, BRUSH1, AFTERSHAVE1]) :-
	type(TOOTHBRUSH1, toothbrush), type(CUPBOARD1, cupboard), type(BRUSH1, brush), type(AFTERSHAVE1, aftershave).
complete_task(organize, P) :-
	type(TOOTHBRUSH1, toothbrush), type(CUPBOARD1, cupboard), type(BRUSH1, brush), type(AFTERSHAVE1, aftershave),
	transform([close([AFTERSHAVE1]), holds([]), sat_on([]), on_top_of([[TOOTHBRUSH1, CUPBOARD1], [BRUSH1, CUPBOARD1], [AFTERSHAVE1, CUPBOARD1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), open([CUPBOARD1])], P).

% Organize closet
get_relevant(organize_closet, [CLOTHESSHIRT1, CLOTHESSHIRT2, CLOTHESSHIRT3, CLOSET1, CLOTHESPANTS1, CLOTHESPANTS2, BASKETFORCLOTHES1]) :-
	type(CLOTHESSHIRT1, clothesshirt), type(CLOTHESSHIRT2, clothesshirt), type(CLOTHESSHIRT3, clothesshirt), type(CLOSET1, closet), type(CLOTHESPANTS1, clothespants), type(CLOTHESPANTS2, clothespants), type(BASKETFORCLOTHES1, basketforclothes).
complete_task(organize_closet, P) :-
	type(CLOTHESSHIRT1, clothesshirt), type(CLOTHESSHIRT2, clothesshirt), type(CLOTHESSHIRT3, clothesshirt), type(CLOSET1, closet), type(CLOTHESPANTS1, clothespants), type(CLOTHESPANTS2, clothespants), type(BASKETFORCLOTHES1, basketforclothes),
	transform([close([]), holds([]), sat_on([]), on_top_of([[CLOTHESSHIRT1, BASKETFORCLOTHES1], [CLOTHESSHIRT2, BASKETFORCLOTHES1], [CLOTHESSHIRT3, BASKETFORCLOTHES1], [CLOTHESPANTS1, BASKETFORCLOTHES1], [CLOTHESPANTS2, BASKETFORCLOTHES1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([CLOSET1])], P).

% Organize desk
get_relevant(organize_desk, [NEWSPAPER1, DOCUMENT1, FILINGCABINET1, BOOK1, FOLDER1, DESK1]) :-
	type(NEWSPAPER1, newspaper), type(DOCUMENT1, document), type(FILINGCABINET1, filingcabinet), type(BOOK1, book), type(FOLDER1, folder), type(DESK1, desk).
complete_task(organize_desk, P) :-
	type(NEWSPAPER1, newspaper), type(DOCUMENT1, document), type(FILINGCABINET1, filingcabinet), type(BOOK1, book), type(FOLDER1, folder), type(DESK1, desk),
	transform([close([DESK1]), holds([]), sat_on([]), on_top_of([[NEWSPAPER1, BOOK1], [DOCUMENT1, BOOK1], [FOLDER1, BOOK1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), fold([NEWSPAPER1]), open([FILINGCABINET1, FOLDER1]), putin([DOCUMENT1, FOLDER1])], P).

% Pack lunch
get_relevant(pack_lunch, [FOODFOOD1, FOODCHEESE1, BOX1, TABLE1, BOWL3, BOWL1, ICE1, BOWL2, KITCHENCABINET1, FREEZER1, FOODVEGETABLE1, FRIDGE1]) :-
	type(FOODFOOD1, foodfood), type(FOODCHEESE1, foodcheese), type(BOX1, box), type(TABLE1, tabl), type(BOWL3, bowl), type(BOWL1, bowl), type(ICE1, ice), type(BOWL2, bowl), type(KITCHENCABINET1, kitchencabinet), type(FREEZER1, freezer), type(FOODVEGETABLE1, foodvegetable), type(FRIDGE1, fridge).
complete_task(pack_lunch, P) :-
	type(FOODFOOD1, foodfood), type(FOODCHEESE1, foodcheese), type(BOX1, box), type(TABLE1, tabl), type(BOWL3, bowl), type(BOWL1, bowl), type(ICE1, ice), type(BOWL2, bowl), type(KITCHENCABINET1, kitchencabinet), type(FREEZER1, freezer), type(FOODVEGETABLE1, foodvegetable), type(FRIDGE1, fridge),
	transform([close([FOODFOOD1, FOODCHEESE1, BOWL3, BOWL1, ICE1, BOWL2, KITCHENCABINET1, FREEZER1, foodvegeTABLE1, FRIDGE1]), holds([BOWL3, BOWL1, ICE1, BOWL2]), sat_on([]), on_top_of([[FOODFOOD1, BOWL1], [FOODCHEESE1, BOWL1], [BOX1, TABLE1], [foodvegeTABLE1, BOWL1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([BOX1, KITCHENCABINET1, FREEZER1, FRIDGE1]), putin([BOWL3, BOWL1, ICE1, BOWL2])], P).

% Paint nails
get_relevant(paint_nails, [TRASHCAN1, BED1, PAPERTOWEL1, NAILPOLISH1]) :-
	type(TRASHCAN1, trashcan), type(BED1, bed), type(PAPERTOWEL1, papertowel), type(NAILPOLISH1, nailpolish).
complete_task(paint_nails, P) :-
	type(TRASHCAN1, trashcan), type(BED1, bed), type(PAPERTOWEL1, papertowel), type(NAILPOLISH1, nailpolish),
	transform([close([BED1, NAILPOLISH1]), holds([]), sat_on([BED1]), on_top_of([[PAPERTOWEL1, TRASHCAN1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), cover([NAILPOLISH1]), uncover([NAILPOLISH1])], P).

% Pay bills
get_relevant(pay_bills, [KEYBOARD1, CHAIR1, DESK1, COMPUTER1]) :-
	type(KEYBOARD1, keyboard), type(CHAIR1, chair), type(DESK1, desk), type(COMPUTER1, computer).
complete_task(pay_bills, P) :-
	type(KEYBOARD1, keyboard), type(CHAIR1, chair), type(DESK1, desk), type(COMPUTER1, computer),
	transform([close([DESK1]), holds([]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([COMPUTER1]), laid_on([]), used([]), eaten([]), type([KEYBOARD1])], P).

% Pee
get_relevant(pee, [FAUCET1, HANDSBOTH1, TOILETPAPER1, TOILET1, SINK1]) :-
	type(FAUCET1, faucet), type(HANDSBOTH1, handsboth), type(TOILETPAPER1, toiletpaper), type(TOILET1, toilet), type(SINK1, sink).
complete_task(pee, P) :-
	type(FAUCET1, faucet), type(HANDSBOTH1, handsboth), type(TOILETPAPER1, toiletpaper), type(TOILET1, toilet), type(SINK1, sink),
	transform([close([TOILET1, SINK1]), holds([]), sat_on([]), on_top_of([[TOILETPAPER1, TOILET1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([TOILET1]), flush([TOILET1]), off([FAUCET1]), wash([HANDSBOTH1]), wipe([character1])], P).

% Pet cat
get_relevant(pet_cat, [CAT1]) :-
	type(CAT1, cat).
complete_task(pet_cat, P) :-
	type(CAT1, cat),
	transform([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), touch([CAT1])], P).

% Pet dog
get_relevant(pet_dog, [HANDSBOTH1, COUCH1, DOG1]) :-
	type(HANDSBOTH1, handsboth), type(COUCH1, couch), type(DOG1, dog).
complete_task(pet_dog, P) :-
	type(HANDSBOTH1, handsboth), type(COUCH1, couch), type(DOG1, dog),
	transform([close([COUCH1]), holds([]), sat_on([COUCH1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), stretch([HANDSBOTH1]), touch([DOG1])], P).

% Physical therapy
get_relevant(physical_therapy, [CHAIR1]) :-
	type(CHAIR1, chair).
complete_task(physical_therapy, P) :-
	type(CHAIR1, chair),
	transform([close([]), holds([]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), touch([CHAIR1]), wipe([CHAIR1])], P).

% Pick up
get_relevant(pick_up, [TOY1]) :-
	type(TOY1, toy).
complete_task(pick_up, P) :-
	type(TOY1, toy),
	transform([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), touch([TOY1]), wash([TOY1])], P).

% Pick up dirty dishes
get_relevant(pick_up_dirty_dishes, [TABLE1]) :-
	type(TABLE1, tabl).
complete_task(pick_up_dirty_dishes, P) :-
	type(TABLE1, tabl),
	transform([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Pick up obvious trash
get_relevant(pick_up_obvious_trash, [TRASHCAN1, PAPER2, PAPER3, PAPER1]) :-
	type(TRASHCAN1, trashcan), type(PAPER2, paper), type(PAPER3, paper), type(PAPER1, paper).
complete_task(pick_up_obvious_trash, P) :-
	type(TRASHCAN1, trashcan), type(PAPER2, paper), type(PAPER3, paper), type(PAPER1, paper),
	transform([close([PAPER1]), holds([]), sat_on([]), on_top_of([[PAPER2, TRASHCAN1], [PAPER3, TRASHCAN1], [PAPER1, TRASHCAN1]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Pick up phone
get_relevant(pick_up_phone, [COFFEETABLE1, PHONE1]) :-
	type(COFFEETABLE1, coffeetable), type(PHONE1, phone).
complete_task(pick_up_phone, P) :-
	type(COFFEETABLE1, coffeetable), type(PHONE1, phone),
	transform([close([COFFEETABLE1]), holds([PHONE1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Pick up toys
get_relevant(pick_up_toys, [TOY2, TOY1, TOY3, CABINET1]) :-
	type(TOY2, toy), type(TOY1, toy), type(TOY3, toy), type(CABINET1, cabinet).
complete_task(pick_up_toys, P) :-
	type(TOY2, toy), type(TOY1, toy), type(TOY3, toy), type(CABINET1, cabinet),
	transform([close([TOY2, TOY1, TOY3, CABINET1]), holds([]), sat_on([]), on_top_of([[TOY2, CABINET1], [TOY1, CABINET1], [TOY3, CABINET1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([CABINET1])], P).

% Play
get_relevant(play, [TABLE1, COUCH1, SCRABBLE1, CABINET1]) :-
	type(TABLE1, tabl), type(COUCH1, couch), type(SCRABBLE1, scrabble), type(CABINET1, cabinet).
complete_task(play, P) :-
	type(TABLE1, tabl), type(COUCH1, couch), type(SCRABBLE1, scrabble), type(CABINET1, cabinet),
	transform([close([SCRABBLE1, CABINET1]), holds([]), sat_on([COUCH1]), on_top_of([[SCRABBLE1, TABLE1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), play([SCRABBLE1])], P).

% Play games
get_relevant(play_games, [CHAIR1, TELEVISION1, VIDEOGAMECONTROLLER1, VIDEOGAMECONSOLE1]) :-
	type(CHAIR1, chair), type(TELEVISION1, television), type(VIDEOGAMECONTROLLER1, videogamecontroller), type(VIDEOGAMECONSOLE1, videogameconsole).
complete_task(play_games, P) :-
	type(CHAIR1, chair), type(TELEVISION1, television), type(VIDEOGAMECONTROLLER1, videogamecontroller), type(VIDEOGAMECONSOLE1, videogameconsole),
	transform([close([CHAIR1, VIDEOGAMECONTROLLER1, VIDEOGAMECONSOLE1]), holds([VIDEOGAMECONTROLLER1]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([TELEVISION1, VIDEOGAMECONSOLE1]), laid_on([]), used([]), eaten([])], P).

% Play guitar
get_relevant(play_guitar, [INSTRUMENTGUITAR1, CABINET1]) :-
	type(INSTRUMENTGUITAR1, instrumentguitar), type(CABINET1, cabinet).
complete_task(play_guitar, P) :-
	type(INSTRUMENTGUITAR1, instrumentguitar), type(CABINET1, cabinet),
	transform([close([CABINET1]), holds([INSTRUMENTGUITAR1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([CABINET1]), play([INSTRUMENTGUITAR1])], P).

% Play musical chairs
get_relevant(play_musical_chairs, [CHAIR3, STEREO1, CHAIR1, CHAIR2]) :-
	type(CHAIR3, chair), type(STEREO1, stereo), type(CHAIR1, chair), type(CHAIR2, chair).
complete_task(play_musical_chairs, P) :-
	type(CHAIR3, chair), type(STEREO1, stereo), type(CHAIR1, chair), type(CHAIR2, chair),
	transform([close([CHAIR1]), holds([]), sat_on([CHAIR1, CHAIR2]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), off([STEREO1]), pull([CHAIR3, CHAIR1, CHAIR2]), run([CHAIR1, CHAIR2]), standup([character1])], P).

% Play with barbies
get_relevant(play_with_barbies, [TOY2, TOY1, BED1, CABINET1]) :-
	type(TOY2, toy), type(TOY1, toy), type(BED1, bed), type(CABINET1, cabinet).
complete_task(play_with_barbies, P) :-
	type(TOY2, toy), type(TOY1, toy), type(BED1, bed), type(CABINET1, cabinet),
	transform([close([TOY2, TOY1, BED1, CABINET1]), holds([]), sat_on([BED1]), on_top_of([[TOY2, BED1], [TOY1, BED1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([CABINET1]), shake([TOY2]), squeeze([TOY1]), touch([TOY1])], P).

% Playing video game
get_relevant(playing_video_game, [VIDEOGAMECONSOLE1, VIDEOGAMECONTROLLER2, VIDEOGAMECONTROLLER1, VIDEOGAMECONSOLE2]) :-
	type(VIDEOGAMECONSOLE1, videogameconsole), type(VIDEOGAMECONTROLLER2, videogamecontroller), type(VIDEOGAMECONTROLLER1, videogamecontroller), type(VIDEOGAMECONSOLE2, videogameconsole).
complete_task(playing_video_game, P) :-
	type(VIDEOGAMECONSOLE1, videogameconsole), type(VIDEOGAMECONTROLLER2, videogamecontroller), type(VIDEOGAMECONTROLLER1, videogamecontroller), type(VIDEOGAMECONSOLE2, videogameconsole),
	transform([close([VIDEOGAMECONSOLE1]), holds([VIDEOGAMECONTROLLER2]), sat_on([]), on_top_of([]), inside([]), on([VIDEOGAMECONSOLE2]), laid_on([]), used([]), eaten([]), off([VIDEOGAMECONSOLE1])], P).

% Polish your shoes
get_relevant(polish_your_shoes, [SHOES1, RAG1, BED1, CLEANINGSOLUTION1, BRUSH1, FLOOR1, SHOESHINEKIT1]) :-
	type(SHOES1, shoes), type(RAG1, rag), type(BED1, bed), type(CLEANINGSOLUTION1, cleaningsolution), type(BRUSH1, brush), type(FLOOR1, floor), type(SHOESHINEKIT1, shoeshinekit).
complete_task(polish_your_shoes, P) :-
	type(SHOES1, shoes), type(RAG1, rag), type(BED1, bed), type(CLEANINGSOLUTION1, cleaningsolution), type(BRUSH1, brush), type(FLOOR1, floor), type(SHOESHINEKIT1, shoeshinekit),
	transform([close([SHOES1, BED1]), holds([]), sat_on([BED1]), on_top_of([[SHOES1, FLOOR1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), brush([SHOES1]), cover([CLEANINGSOLUTION1]), open([CLEANINGSOLUTION1])], P).

% Polishing floor
get_relevant(polishing_floor, [SHOES1]) :-
	type(SHOES1, shoes).
complete_task(polishing_floor, P) :-
	type(SHOES1, shoes),
	transform([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), crawl([]), wash([SHOES1])], P).

% Pop zit
get_relevant(pop_zit, [FAUCET1, MIRROR1, HANDSBOTH1, FACE1]) :-
	type(FAUCET1, faucet), type(MIRROR1, mirror), type(HANDSBOTH1, handsboth), type(FACE1, face).
complete_task(pop_zit, P) :-
	type(FAUCET1, faucet), type(MIRROR1, mirror), type(HANDSBOTH1, handsboth), type(FACE1, face),
	transform([close([MIRROR1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), off([FAUCET1]), rinse([HANDSBOTH1]), squeeze([FACE1]), touch([FACE1])], P).

% Practice violin
get_relevant(practice_violin, [INSTRUMENTVIOLIN1, MUSICSTAND1, PAPER1]) :-
	type(INSTRUMENTVIOLIN1, instrumentviolin), type(MUSICSTAND1, musicstand), type(PAPER1, paper).
complete_task(practice_violin, P) :-
	type(INSTRUMENTVIOLIN1, instrumentviolin), type(MUSICSTAND1, musicstand), type(PAPER1, paper),
	transform([close([INSTRUMENTVIOLIN1, MUSICSTAND1, PAPER1]), holds([]), sat_on([]), on_top_of([[INSTRUMENTVIOLIN1, MUSICSTAND1], [PAPER1, MUSICSTAND1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), play([INSTRUMENTVIOLIN1])], P).

% Prepare Dinner
get_relevant(prepare_dinner, [STOVE1, FOODFOOD1]) :-
	type(STOVE1, stove), type(FOODFOOD1, foodfood).
complete_task(prepare_dinner, P) :-
	type(STOVE1, stove), type(FOODFOOD1, foodfood),
	transform([close([]), holds([]), sat_on([]), on_top_of([[FOODFOOD1, STOVE1]]), inside([]), on([STOVE1]), laid_on([]), used([]), eaten([])], P).

% Prepare breakfast
get_relevant(prepare_breakfast, [MILK1, FOODBANANA1, BOWL1, CUP1, KITCHENCABINET1, FOODCEREAL1, KITCHENCABINET2, FRIDGE1]) :-
	type(MILK1, milk), type(FOODBANANA1, foodbanana), type(BOWL1, bowl), type(CUP1, cup), type(KITCHENCABINET1, kitchencabinet), type(FOODCEREAL1, foodcereal), type(KITCHENCABINET2, kitchencabinet), type(FRIDGE1, fridge).
complete_task(prepare_breakfast, P) :-
	type(MILK1, milk), type(FOODBANANA1, foodbanana), type(BOWL1, bowl), type(CUP1, cup), type(KITCHENCABINET1, kitchencabinet), type(FOODCEREAL1, foodcereal), type(KITCHENCABINET2, kitchencabinet), type(FRIDGE1, fridge),
	transform([close([BOWL1, CUP1, KITCHENCABINET1, FOODCEREAL1, KITCHENCABINET2, FRIDGE1]), holds([MILK1, FOODBANANA1, BOWL1, CUP1, FOODCEREAL1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), open([KITCHENCABINET1, FRIDGE1])], P).

% Prepare for work
get_relevant(prepare_for_work, [FOODBREAD2, CHEFKNIFE1, FOODCHEESE1, TABLE1, TABLE2, NAPKIN1, CUTTINGBOARD1, FOODBREAD1]) :-
	type(FOODBREAD2, foodbread), type(CHEFKNIFE1, chefknife), type(FOODCHEESE1, foodcheese), type(TABLE1, tabl), type(TABLE2, tabl), type(NAPKIN1, napkin), type(CUTTINGBOARD1, cuttingboard), type(FOODBREAD1, foodbread).
complete_task(prepare_for_work, P) :-
	type(FOODBREAD2, foodbread), type(CHEFKNIFE1, chefknife), type(FOODCHEESE1, foodcheese), type(TABLE1, tabl), type(TABLE2, tabl), type(NAPKIN1, napkin), type(CUTTINGBOARD1, cuttingboard), type(FOODBREAD1, foodbread),
	transform([close([CUTTINGBOARD1, FOODBREAD1]), holds([]), sat_on([]), on_top_of([[FOODBREAD2, CUTTINGBOARD1], [FOODCHEESE1, CUTTINGBOARD1], [FOODBREAD1, TABLE2]]), inside([]), on([]), laid_on([]), used([]), eaten([]), wrap([FOODBREAD1])], P).

% Prepare letter for mailing
get_relevant(prepare_letter_for_mailing, [PEN1, STAMP1, DOCUMENT1, ENVELOPE1]) :-
	type(PEN1, pen), type(STAMP1, stamp), type(DOCUMENT1, document), type(ENVELOPE1, envelope).
complete_task(prepare_letter_for_mailing, P) :-
	type(PEN1, pen), type(STAMP1, stamp), type(DOCUMENT1, document), type(ENVELOPE1, envelope),
	transform([close([ENVELOPE1]), holds([ENVELOPE1]), sat_on([]), on_top_of([[STAMP1, ENVELOPE1], [DOCUMENT1, ENVELOPE1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([ENVELOPE1]), fold([DOCUMENT1]), write([ENVELOPE1])], P).

% Prepare pot of boiling water
get_relevant(prepare_pot_of_boiling_water, [FAUCET1, STOVE1, POT1, SINK1]) :-
	type(FAUCET1, faucet), type(STOVE1, stove), type(POT1, pot), type(SINK1, sink).
complete_task(prepare_pot_of_boiling_water, P) :-
	type(FAUCET1, faucet), type(STOVE1, stove), type(POT1, pot), type(SINK1, sink),
	transform([close([STOVE1, POT1, SINK1]), holds([]), sat_on([]), on_top_of([[POT1, STOVE1]]), inside([]), on([STOVE1]), laid_on([]), used([]), eaten([]), off([FAUCET1])], P).

% Prepare sandwich
get_relevant(prepare_sandwich, [FOODBREAD2, KNIFE1, TABLE1, PLATE1, FOODPEANUTBUTTER1, FRIDGE1, FOODBREAD1]) :-
	type(FOODBREAD2, foodbread), type(KNIFE1, knife), type(TABLE1, tabl), type(PLATE1, plate), type(FOODPEANUTBUTTER1, foodpeanutbutter), type(FRIDGE1, fridge), type(FOODBREAD1, foodbread).
complete_task(prepare_sandwich, P) :-
	type(FOODBREAD2, foodbread), type(KNIFE1, knife), type(TABLE1, tabl), type(PLATE1, plate), type(FOODPEANUTBUTTER1, foodpeanutbutter), type(FRIDGE1, fridge), type(FOODBREAD1, foodbread),
	transform([close([PLATE1, FRIDGE1]), holds([]), sat_on([]), on_top_of([[FOODBREAD2, PLATE1], [PLATE1, TABLE1], [FOODPEANUTBUTTER1, KNIFE1], [FOODBREAD1, PLATE1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([FRIDGE1]), open([FOODPEANUTBUTTER1]), spread([FOODPEANUTBUTTER1])], P).

% Pretend tea
get_relevant(pretend_tea, [TABLE1, CHILD1, CUP1, CUP2, KETTLE1]) :-
	type(TABLE1, tabl), type(CHILD1, child), type(CUP1, cup), type(CUP2, cup), type(KETTLE1, kettle).
complete_task(pretend_tea, P) :-
	type(TABLE1, tabl), type(CHILD1, child), type(CUP1, cup), type(CUP2, cup), type(KETTLE1, kettle),
	transform([close([CHILD1, CUP1, CUP2, KETTLE1]), holds([]), sat_on([]), on_top_of([[CUP1, TABLE1], [CUP2, TABLE1], [KETTLE1, TABLE1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), drink([CUP1, CUP2]), greet([CHILD1]), pour([KETTLE1])], P).

% Print documents
get_relevant(print_documents, [DOCUMENT1, LAPTOP1, MOUSE1, FOLDER1, PRINTINGPAPER1, PRINTER1]) :-
	type(DOCUMENT1, document), type(LAPTOP1, laptop), type(MOUSE1, mouse), type(FOLDER1, folder), type(PRINTINGPAPER1, printingpaper), type(PRINTER1, printer).
complete_task(print_documents, P) :-
	type(DOCUMENT1, document), type(LAPTOP1, laptop), type(MOUSE1, mouse), type(FOLDER1, folder), type(PRINTINGPAPER1, printingpaper), type(PRINTER1, printer),
	transform([close([LAPTOP1, PRINTINGPAPER1, PRINTER1]), holds([DOCUMENT1, MOUSE1, FOLDER1]), sat_on([]), on_top_of([[PRINTINGPAPER1, PRINTER1]]), inside([]), on([LAPTOP1, PRINTER1]), laid_on([]), used([]), eaten([]), closed([FOLDER1]), putin([DOCUMENT1])], P).

% Print out papers
get_relevant(print_out_papers, [MOUSE1, PRINTINGPAPER1, COMPUTER1, PRINTER1]) :-
	type(MOUSE1, mouse), type(PRINTINGPAPER1, printingpaper), type(COMPUTER1, computer), type(PRINTER1, printer).
complete_task(print_out_papers, P) :-
	type(MOUSE1, mouse), type(PRINTINGPAPER1, printingpaper), type(COMPUTER1, computer), type(PRINTER1, printer),
	transform([close([PRINTER1]), holds([MOUSE1, PRINTINGPAPER1]), sat_on([]), on_top_of([]), inside([]), on([PRINTER1]), laid_on([]), used([]), eaten([])], P).

% Pull hair out of drain
get_relevant(pull_hair_out_of_drain, [SHAMPOO1]) :-
	type(SHAMPOO1, shampoo).
complete_task(pull_hair_out_of_drain, P) :-
	type(SHAMPOO1, shampoo),
	transform([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), shake([SHAMPOO1]), wash([SHAMPOO1])], P).

% Pull up carpet
get_relevant(pull_up_carpet, [CARPET1]) :-
	type(CARPET1, carpet).
complete_task(pull_up_carpet, P) :-
	type(CARPET1, carpet),
	transform([close([CARPET1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), pull([CARPET1]), touch([CARPET1])], P).

% Put away clean clothes
get_relevant(put_away_clean_clothes, [SOAP1]) :-
	type(SOAP1, soap).
complete_task(put_away_clean_clothes, P) :-
	type(SOAP1, soap),
	transform([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), wash([SOAP1])], P).

% Put away groceries
get_relevant(put_away_groceries, [FRIDGE1, GROCERIES1]) :-
	type(FRIDGE1, fridge), type(GROCERIES1, groceries).
complete_task(put_away_groceries, P) :-
	type(FRIDGE1, fridge), type(GROCERIES1, groceries),
	transform([close([FRIDGE1]), holds([]), sat_on([]), on_top_of([[GROCERIES1, FRIDGE1]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Put away shoes
get_relevant(put_away_shoes, [SHOES1, CLOSET1]) :-
	type(SHOES1, shoes), type(CLOSET1, closet).
complete_task(put_away_shoes, P) :-
	type(SHOES1, shoes), type(CLOSET1, closet),
	transform([close([]), holds([]), sat_on([]), on_top_of([[SHOES1,CLOSET1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([CLOSET1])], P).

% Put away toys
get_relevant(put_away_toys, [TOY2, TOY1, CHILD1, TOY3, CABINET1]) :-
	type(TOY2, toy), type(TOY1, toy), type(CHILD1, child), type(TOY3, toy), type(CABINET1, cabinet).
complete_task(put_away_toys, P) :-
	type(TOY2, toy), type(TOY1, toy), type(CHILD1, child), type(TOY3, toy), type(CABINET1, cabinet),
	transform([close([TOY2, TOY1, TOY3, CABINET1]), holds([]), sat_on([]), on_top_of([[TOY2, CABINET1], [TOY1, CABINET1], [TOY3, CABINET1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([CABINET1])], P).

% Put clothes away
get_relevant(put_clothes_away, [CABINET1]) :-
	type(CABINET1, cabinet).
complete_task(put_clothes_away, P) :-
	type(CABINET1, cabinet),
	transform([close([CABINET1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([CABINET1])], P).

% Put dishes away
get_relevant(put_dishes_away, [DRINKINGGLASS1, PLATE1, KITCHENCABINET1, DISHWASHER1]) :-
	type(DRINKINGGLASS1, drinkingglass), type(PLATE1, plate), type(KITCHENCABINET1, kitchencabinet), type(DISHWASHER1, dishwasher).
complete_task(put_dishes_away, P) :-
	type(DRINKINGGLASS1, drinkingglass), type(PLATE1, plate), type(KITCHENCABINET1, kitchencabinet), type(DISHWASHER1, dishwasher),
	transform([close([DRINKINGGLASS1, PLATE1, KITCHENCABINET1, DISHWASHER1]), holds([DRINKINGGLASS1, PLATE1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([KITCHENCABINET1, DISHWASHER1]), putin([DRINKINGGLASS1, PLATE1])], P).

% Put dvds on shelves
get_relevant(put_dvds_on_shelves, [RAG1, TABLE1, CLEANINGBOTTLE1, CLEANINGSOLUTION1, CD1]) :-
	type(RAG1, rag), type(TABLE1, tabl), type(CLEANINGBOTTLE1, cleaningbottle), type(CLEANINGSOLUTION1, cleaningsolution), type(CD1, cd).
complete_task(put_dvds_on_shelves, P) :-
	type(RAG1, rag), type(TABLE1, tabl), type(CLEANINGBOTTLE1, cleaningbottle), type(CLEANINGSOLUTION1, cleaningsolution), type(CD1, cd),
	transform([close([RAG1, CLEANINGBOTTLE1, CLEANINGSOLUTION1]), holds([CLEANINGSOLUTION1, CD1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), pour([CLEANINGSOLUTION1]), wipe([CD1])], P).

% Put groceries in Fridge
get_relevant(put_groceries_in_fridge, [FRIDGE1, GROCERIES1]) :-
	type(FRIDGE1, fridge), type(GROCERIES1, groceries).
complete_task(put_groceries_in_fridge, P) :-
	type(FRIDGE1, fridge), type(GROCERIES1, groceries),
	transform([close([FRIDGE1]), holds([]), sat_on([]), on_top_of([[GROCERIES1, FRIDGE1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), open([FRIDGE1])], P).

% Put mail in mail organizer
get_relevant(put_mail_in_mail_organizer, [MAIL1, MAIL2, TABLE1]) :-
	type(MAIL1, mail), type(MAIL2, mail), type(TABLE1, tabl).
complete_task(put_mail_in_mail_organizer, P) :-
	type(MAIL1, mail), type(MAIL2, mail), type(TABLE1, tabl),
	transform([close([MAIL1, MAIL2]), holds([]), sat_on([]), on_top_of([[MAIL1, TABLE1], [MAIL2, TABLE1]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Put new books in shelves
get_relevant(put_new_books_in_shelves, [BOOKSHELF1, BOOK1, DESK1, BOOK2]) :-
	type(BOOKSHELF1, bookshelf), type(BOOK1, book), type(DESK1, desk), type(BOOK2, book).
complete_task(put_new_books_in_shelves, P) :-
	type(BOOKSHELF1, bookshelf), type(BOOK1, book), type(DESK1, desk), type(BOOK2, book),
	transform([close([BOOKSHELF1, BOOK1, DESK1, BOOK2]), holds([]), sat_on([]), on_top_of([[BOOK1, BOOKSHELF1], [BOOK2, BOOKSHELF1]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Put on coat
get_relevant(put_on_coat, [CLOTHESSHIRT1, CLOSET1]) :-
	type(CLOTHESSHIRT1, clothesshirt), type(CLOSET1, closet).
complete_task(put_on_coat, P) :-
	type(CLOTHESSHIRT1, clothesshirt), type(CLOSET1, closet),
	transform([close([CLOSET1]), holds([CLOTHESSHIRT1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), open([CLOSET1]), puton([CLOTHESSHIRT1])], P).

% Put on foundation
get_relevant(put_on_foundation, [MIRROR1, FACE1, FOUNDATION1, SPONGE1]) :-
	type(MIRROR1, mirror), type(FACE1, face), type(FOUNDATION1, foundation), type(SPONGE1, sponge).
complete_task(put_on_foundation, P) :-
	type(MIRROR1, mirror), type(FACE1, face), type(FOUNDATION1, foundation), type(SPONGE1, sponge),
	transform([close([FOUNDATION1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), spread([FOUNDATION1])], P).

% Put on glasses
get_relevant(put_on_glasses, [SPECTACLES1, DRESSER1]) :-
	type(SPECTACLES1, spectacles), type(DRESSER1, dresser).
complete_task(put_on_glasses, P) :-
	type(SPECTACLES1, spectacles), type(DRESSER1, dresser),
	transform([close([DRESSER1]), holds([SPECTACLES1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), puton([SPECTACLES1])], P).

% Put on purse, put keys and lucky charms in pockets, leave home
get_relevant(put_on_purse_put_keys_and_lucky_charms_in_pockets_leave_home, [PURSE1, KEYS1, CABINET1]) :-
	type(PURSE1, purse), type(KEYS1, keys), type(CABINET1, cabinet).
complete_task(put_on_purse_put_keys_and_lucky_charms_in_pockets_leave_home, P) :-
	type(PURSE1, purse), type(KEYS1, keys), type(CABINET1, cabinet),
	transform([close([CABINET1]), holds([PURSE1]), sat_on([]), on_top_of([[KEYS1, PURSE1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([PURSE1])], P).

% Put on your shoes
get_relevant(put_on_your_shoes, [SHOES1, FEETBOTH1, CHAIR1]) :-
	type(SHOES1, shoes), type(FEETBOTH1, feetboth), type(CHAIR1, chair).
complete_task(put_on_your_shoes, P) :-
	type(SHOES1, shoes), type(FEETBOTH1, feetboth), type(CHAIR1, chair),
	transform([close([SHOES1]), holds([]), sat_on([CHAIR1]), on_top_of([[SHOES1, FEETBOTH1]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Put them to sleep
get_relevant(put_them_to_sleep, [LAMP1, CHAIR1, BED1, CHILD1, BOOK1, DRESSER1]) :-
	type(LAMP1, lamp), type(CHAIR1, chair), type(BED1, bed), type(CHILD1, child), type(BOOK1, book), type(DRESSER1, dresser).
complete_task(put_them_to_sleep, P) :-
	type(LAMP1, lamp), type(CHAIR1, chair), type(BED1, bed), type(CHILD1, child), type(BOOK1, book), type(DRESSER1, dresser),
	transform([close([LAMP1, BED1, BOOK1, DRESSER1]), holds([]), sat_on([CHAIR1]), on_top_of([[CHILD1, BED1], [BOOK1, DRESSER1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), off([LAMP1]), open([DRESSER1]), read([BOOK1])], P).

% Put toys away
get_relevant(put_toys_away, [TOY2, TOY1, TOY3, CABINET1]) :-
	type(TOY2, toy), type(TOY1, toy), type(TOY3, toy), type(CABINET1, cabinet).
complete_task(put_toys_away, P) :-
	type(TOY2, toy), type(TOY1, toy), type(TOY3, toy), type(CABINET1, cabinet),
	transform([close([TOY2, TOY1, TOY3, CABINET1]), holds([]), sat_on([]), on_top_of([[TOY2, CABINET1], [TOY1, CABINET1], [TOY3, CABINET1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([CABINET1])], P).

% Put umbrella away
get_relevant(put_umbrella_away, [MOPBUCKET1]) :-
	type(MOPBUCKET1, mopbucket).
complete_task(put_umbrella_away, P) :-
	type(MOPBUCKET1, mopbucket),
	transform([close([MOPBUCKET1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Put up coat
get_relevant(put_up_coat, [CLOTHESSHIRT1, CLOSET1]) :-
	type(CLOTHESSHIRT1, clothesshirt), type(CLOSET1, closet).
complete_task(put_up_coat, P) :-
	type(CLOTHESSHIRT1, clothesshirt), type(CLOSET1, closet),
	transform([close([]), holds([CLOTHESSHIRT1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([CLOSET1]), putin([CLOTHESSHIRT1])], P).

% Put up decoration
get_relevant(put_up_decoration, [WALL1, TABLE1, PAINTING1, CENTERPIECE1]) :-
	type(WALL1, wall), type(TABLE1, tabl), type(PAINTING1, painting), type(CENTERPIECE1, centerpiece).
complete_task(put_up_decoration, P) :-
	type(WALL1, wall), type(TABLE1, tabl), type(PAINTING1, painting), type(CENTERPIECE1, centerpiece),
	transform([close([WALL1, PAINTING1, CENTERPIECE1]), holds([]), sat_on([]), on_top_of([[PAINTING1, WALL1], [CENTERPIECE1, TABLE1]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Put up jacket
get_relevant(put_up_jacket, [CLOTHESSHIRT1, CLOSET1]) :-
	type(CLOTHESSHIRT1, clothesshirt), type(CLOSET1, closet).
complete_task(put_up_jacket, P) :-
	type(CLOTHESSHIRT1, clothesshirt), type(CLOSET1, closet),
	transform([close([]), holds([CLOTHESSHIRT1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([CLOSET1]), putin([CLOTHESSHIRT1])], P).

% Put up towel
get_relevant(put_up_towel, [TOWEL1, CABINET1]) :-
	type(TOWEL1, towel), type(CABINET1, cabinet).
complete_task(put_up_towel, P) :-
	type(TOWEL1, towel), type(CABINET1, cabinet),
	transform([close([TOWEL1]), holds([]), sat_on([]), on_top_of([[TOWEL1, CABINET1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), fold([TOWEL1]), open([CABINET1])], P).

% Re arrange office
get_relevant(re_arrange_office, [LIGHTSWITCH1, CHAIR1, FILINGCABINET1, DESK1, SOFA1]) :-
	type(LIGHTSWITCH1, lightswitch), type(CHAIR1, chair), type(FILINGCABINET1, filingcabinet), type(DESK1, desk), type(SOFA1, sofa).
complete_task(re_arrange_office, P) :-
	type(LIGHTSWITCH1, lightswitch), type(CHAIR1, chair), type(FILINGCABINET1, filingcabinet), type(DESK1, desk), type(SOFA1, sofa),
	transform([close([LIGHTSWITCH1, CHAIR1, FILINGCABINET1, DESK1, SOFA1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([LIGHTSWITCH1]), laid_on([]), used([]), eaten([]), push([CHAIR1, FILINGCABINET1, DESK1, SOFA1])], P).

% Read
get_relevant(read, [CHAIR1, BOOK1]) :-
	type(CHAIR1, chair), type(BOOK1, book).
complete_task(read, P) :-
	type(CHAIR1, chair), type(BOOK1, book),
	transform([close([CHAIR1, BOOK1]), holds([BOOK1]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), read([BOOK1])], P).

% Read book
get_relevant(read_book, [BOOK1]) :-
	type(BOOK1, book).
complete_task(read_book, P) :-
	type(BOOK1, book),
	transform([close([]), holds([BOOK1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), read([BOOK1])], P).

% Read news
get_relevant(read_news, [NEWSPAPER1, CHAIR1]) :-
	type(NEWSPAPER1, newspaper), type(CHAIR1, chair).
complete_task(read_news, P) :-
	type(NEWSPAPER1, newspaper), type(CHAIR1, chair),
	transform([close([CHAIR1]), holds([NEWSPAPER1]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), read([NEWSPAPER1])], P).

% Read newspaper
get_relevant(read_newspaper, [NEWSPAPER1, COUCH1]) :-
	type(NEWSPAPER1, newspaper), type(COUCH1, couch).
complete_task(read_newspaper, P) :-
	type(NEWSPAPER1, newspaper), type(COUCH1, couch),
	transform([close([NEWSPAPER1]), holds([NEWSPAPER1]), sat_on([COUCH1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), read([NEWSPAPER1])], P).

% Read on sofa
get_relevant(read_on_sofa, [BOOKMARK1, BOOK1, SOFA1]) :-
	type(BOOKMARK1, bookmark), type(BOOK1, book), type(SOFA1, sofa).
complete_task(read_on_sofa, P) :-
	type(BOOKMARK1, bookmark), type(BOOK1, book), type(SOFA1, sofa),
	transform([close([BOOK1]), holds([BOOK1]), sat_on([SOFA1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), read([BOOK1])], P).

% Read paper
get_relevant(read_paper, [NEWSPAPER1, TABLE1, CHAIR1, LIGHT1]) :-
	type(NEWSPAPER1, newspaper), type(TABLE1, tabl), type(CHAIR1, chair), type(LIGHT1, light).
complete_task(read_paper, P) :-
	type(NEWSPAPER1, newspaper), type(TABLE1, tabl), type(CHAIR1, chair), type(LIGHT1, light),
	transform([close([LIGHT1]), holds([]), sat_on([CHAIR1]), on_top_of([[NEWSPAPER1, TABLE1]]), inside([]), on([LIGHT1]), laid_on([]), used([]), eaten([]), fold([NEWSPAPER1]), read([NEWSPAPER1])], P).

% Read them bedtime story
get_relevant(read_them_bedtime_story, [SHEETS1, BED1, CHILD1, BOOK1, BLANKET1, CABINET1]) :-
	type(SHEETS1, sheets), type(BED1, bed), type(CHILD1, child), type(BOOK1, book), type(BLANKET1, blanket), type(CABINET1, cabinet).
complete_task(read_them_bedtime_story, P) :-
	type(SHEETS1, sheets), type(BED1, bed), type(CHILD1, child), type(BOOK1, book), type(BLANKET1, blanket), type(CABINET1, cabinet),
	transform([close([CHILD1, CABINET1]), holds([BOOK1]), sat_on([BED1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), cover([CHILD1]), greet([CHILD1]), read([BOOK1])], P).

% Read to child
get_relevant(read_to_child, [CHAIR1, CHILD1, BOOK1, CABINET1]) :-
	type(CHAIR1, chair), type(CHILD1, child), type(BOOK1, book), type(CABINET1, cabinet).
complete_task(read_to_child, P) :-
	type(CHAIR1, chair), type(CHILD1, child), type(BOOK1, book), type(CABINET1, cabinet),
	transform([close([CHAIR1, CHILD1, BOOK1, CABINET1]), holds([BOOK1]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), greet([CHILD1]), open([CABINET1]), pull([CHAIR1]), read([BOOK1])], P).

% Read yourself to sleep
get_relevant(read_yourself_to_sleep, [BOOKMARK1, BOOK1, BED1]) :-
	type(BOOKMARK1, bookmark), type(BOOK1, book), type(BED1, bed).
complete_task(read_yourself_to_sleep, P) :-
	type(BOOKMARK1, bookmark), type(BOOK1, book), type(BED1, bed),
	transform([close([BOOK1]), holds([BOOK1]), sat_on([BED1]), on_top_of([[BOOKMARK1, BOOK1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), read([BOOK1]), sleep([character1])], P).

% Rearrange photo frames
get_relevant(rearrange_photo_frames, [WALL1, PICTURE1, WALL2, PICTURE2]) :-
	type(WALL1, wall), type(PICTURE1, picture), type(WALL2, wall), type(PICTURE2, picture).
complete_task(rearrange_photo_frames, P) :-
	type(WALL1, wall), type(PICTURE1, picture), type(WALL2, wall), type(PICTURE2, picture),
	transform([close([WALL1, PICTURE1, WALL2, PICTURE2]), holds([]), sat_on([]), on_top_of([[PICTURE1, WALL2], [PICTURE2, WALL1]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Receive credit card
get_relevant(receive_credit_card, [SCISSORS1, CREDITCARD1, ENVELOPE1]) :-
	type(SCISSORS1, scissors), type(CREDITCARD1, creditcard), type(ENVELOPE1, envelope).
complete_task(receive_credit_card, P) :-
	type(SCISSORS1, scissors), type(CREDITCARD1, creditcard), type(ENVELOPE1, envelope),
	transform([close([SCISSORS1, ENVELOPE1]), holds([CREDITCARD1, ENVELOPE1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), open([ENVELOPE1])], P).

% Relax
get_relevant(relax, [COUCH1]) :-
	type(COUCH1, couch).
complete_task(relax, P) :-
	type(COUCH1, couch),
	transform([close([COUCH1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([COUCH1]), used([]), eaten([])], P).

% Relax on sofa
get_relevant(relax_on_sofa, [SOFA1]) :-
	type(SOFA1, sofa).
complete_task(relax_on_sofa, P) :-
	type(SOFA1, sofa),
	transform([close([SOFA1]), holds([]), sat_on([SOFA1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Research
get_relevant(research, [COMPUTER1, DOCUMENT1]) :-
	type(COMPUTER1, computer), type(DOCUMENT1, document).
complete_task(research, P) :-
	type(COMPUTER1, computer), type(DOCUMENT1, document),
	transform([close([COMPUTER1]), holds([DOCUMENT1]), sat_on([]), on_top_of([]), inside([]), on([COMPUTER1]), laid_on([]), used([]), eaten([]), read([DOCUMENT1])], P).

% Scrub face
get_relevant(scrub_face, [HANDSBOTH1, FAUCET1, FACIALCLEANSER1, FACE1, SINK1]) :-
	type(HANDSBOTH1, handsboth), type(FAUCET1, faucet), type(FACIALCLEANSER1, facialcleanser), type(FACE1, face), type(SINK1, sink).
complete_task(scrub_face, P) :-
	type(HANDSBOTH1, handsboth), type(FAUCET1, faucet), type(FACIALCLEANSER1, facialcleanser), type(FACE1, face), type(SINK1, sink),
	transform([close([SINK1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), off([FAUCET1]), pour([FACIALCLEANSER1]), rinse([FACE1]), scrub([FACE1]), spread([FACIALCLEANSER1])], P).

% Scrub toilet
get_relevant(scrub_toilet, [FAUCET1, CLEANINGBOTTLE1, TOILET1, BRUSH1]) :-
	type(FAUCET1, faucet), type(CLEANINGBOTTLE1, cleaningbottle), type(TOILET1, toilet), type(BRUSH1, brush).
complete_task(scrub_toilet, P) :-
	type(FAUCET1, faucet), type(CLEANINGBOTTLE1, cleaningbottle), type(TOILET1, toilet), type(BRUSH1, brush),
	transform([close([CLEANINGBOTTLE1, TOILET1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), flush([TOILET1]), off([FAUCET1]), pour([CLEANINGBOTTLE1]), scrub([TOILET1]), squeeze([CLEANINGBOTTLE1]), wash([BRUSH1])], P).

% Send  email
get_relevant(send__email, [MAIL2, KEYBOARD1, CHAIR1, MAIL1, COMPUTER1]) :-
	type(MAIL2, mail), type(KEYBOARD1, keyboard), type(CHAIR1, chair), type(MAIL1, mail), type(COMPUTER1, computer).
complete_task(send__email, P) :-
	type(MAIL2, mail), type(KEYBOARD1, keyboard), type(CHAIR1, chair), type(MAIL1, mail), type(COMPUTER1, computer),
	transform([close([CHAIR1]), holds([MAIL2, MAIL1]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([COMPUTER1]), laid_on([]), used([]), eaten([]), read([MAIL2, MAIL1]), type([KEYBOARD1])], P).

% Sent email
get_relevant(sent_email, [COMPUTER1, DESK1, CHAIR1]) :-
	type(COMPUTER1, computer), type(DESK1, desk), type(CHAIR1, chair).
complete_task(sent_email, P) :-
	type(COMPUTER1, computer), type(DESK1, desk), type(CHAIR1, chair),
	transform([close([DESK1]), holds([]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), off([COMPUTER1]), pull([CHAIR1]), write([character1])], P).

% Serve hors d'oeuvres to entering guests at cocktail party
get_relevant(serve_hors_doeuvres_to_entering_guests_at_cocktail_party, [FOODFOOD1, TABLE1, MAN1, PLATE1, NAPKIN1, WOMAN1, NAPKIN3, WOMAN2, NAPKIN2]) :-
	type(FOODFOOD1, foodfood), type(TABLE1, tabl), type(MAN1, man), type(PLATE1, plate), type(NAPKIN1, napkin), type(WOMAN1, woman), type(NAPKIN3, napkin), type(WOMAN2, woman), type(NAPKIN2, napkin).
complete_task(serve_hors_doeuvres_to_entering_guests_at_cocktail_party, P) :-
	type(FOODFOOD1, foodfood), type(TABLE1, tabl), type(MAN1, man), type(PLATE1, plate), type(NAPKIN1, napkin), type(WOMAN1, woman), type(NAPKIN3, napkin), type(WOMAN2, woman), type(NAPKIN2, napkin),
	transform([close([MAN1, PLATE1]), holds([PLATE1]), sat_on([]), on_top_of([[FOODFOOD1, PLATE1], [NAPKIN1, PLATE1], [NAPKIN3, PLATE1], [NAPKIN2, PLATE1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), greet([MAN1, woMAN1, WOMAN2]), uncover([FOODFOOD1])], P).

% Set mail on table
get_relevant(set_mail_on_table, [MAIL1, TABLE1]) :-
	type(MAIL1, mail), type(TABLE1, tabl).
complete_task(set_mail_on_table, P) :-
	type(MAIL1, mail), type(TABLE1, tabl),
	transform([close([MAIL1]), holds([MAIL1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), drop([MAIL1])], P).

% Set out some snacks for toddler
get_relevant(set_out_some_snacks_for_toddler, [FOODCARROT5, FOODCHEESE1, FOODCARROT1, COFFEETABLE1, PLATE1, FOODCARROT4, FOODCARROT2, FOODCARROT3, CRACKERS1]) :-
	type(FOODCARROT5, foodcarrot), type(FOODCHEESE1, foodcheese), type(FOODCARROT1, foodcarrot), type(COFFEETABLE1, coffeetable), type(PLATE1, plate), type(FOODCARROT4, foodcarrot), type(FOODCARROT2, foodcarrot), type(FOODCARROT3, foodcarrot), type(CRACKERS1, crackers).
complete_task(set_out_some_snacks_for_toddler, P) :-
	type(FOODCARROT5, foodcarrot), type(FOODCHEESE1, foodcheese), type(FOODCARROT1, foodcarrot), type(COFFEETABLE1, coffeetable), type(PLATE1, plate), type(FOODCARROT4, foodcarrot), type(FOODCARROT2, foodcarrot), type(FOODCARROT3, foodcarrot), type(CRACKERS1, crackers),
	transform([close([FOODCARROT5, FOODCHEESE1, FOODCARROT1, COFFEETABLE1, PLATE1, FOODCARROT4, FOODCARROT2, FOODCARROT3, CRACKERS1]), holds([]), sat_on([]), on_top_of([[FOODCARROT5, COFFEETABLE1], [FOODCHEESE1, COFFEETABLE1], [FOODCARROT1, COFFEETABLE1], [PLATE1, COFFEETABLE1], [FOODCARROT4, COFFEETABLE1], [FOODCARROT2, COFFEETABLE1], [FOODCARROT3, COFFEETABLE1], [CRACKERS1, COFFEETABLE1]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Set up buffet area
get_relevant(set_up_buffet_area, [TABLE1, NAPKIN1, FORK2, BOWL1, BOWL2, TABLECLOTH1, FORK1, NAPKIN2]) :-
	type(TABLE1, tabl), type(NAPKIN1, napkin), type(FORK2, fork), type(BOWL1, bowl), type(BOWL2, bowl), type(TABLECLOTH1, tablecloth), type(FORK1, fork), type(NAPKIN2, napkin).
complete_task(set_up_buffet_area, P) :-
	type(TABLE1, tabl), type(NAPKIN1, napkin), type(FORK2, fork), type(BOWL1, bowl), type(BOWL2, bowl), type(TABLECLOTH1, tablecloth), type(FORK1, fork), type(NAPKIN2, napkin),
	transform([close([NAPKIN1, FORK2, BOWL1, BOWL2, TABLECLOTH1, FORK1, NAPKIN2]), holds([]), sat_on([]), on_top_of([[NAPKIN1, TABLE1], [FORK2, TABLE1], [BOWL1, TABLE1], [BOWL2, TABLE1], [TABLECLOTH1, TABLE1], [FORK1, TABLE1], [NAPKIN2, TABLE1]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Set up table
get_relevant(set_up_table, [TABLE1, PLATE1, CUP1, CUP2, PLATE2]) :-
	type(TABLE1, tabl), type(PLATE1, plate), type(CUP1, cup), type(CUP2, cup), type(PLATE2, plate).
complete_task(set_up_table, P) :-
	type(TABLE1, tabl), type(PLATE1, plate), type(CUP1, cup), type(CUP2, cup), type(PLATE2, plate),
	transform([close([]), holds([]), sat_on([]), on_top_of([[PLATE1, TABLE1], [CUP1, TABLE1], [CUP2, TABLE1], [PLATE2, TABLE1]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Settle in
get_relevant(settle_in, [SHOES1, COUCH1]) :-
	type(SHOES1, shoes), type(COUCH1, couch).
complete_task(settle_in, P) :-
	type(SHOES1, shoes), type(COUCH1, couch),
	transform([close([SHOES1, COUCH1]), holds([]), sat_on([COUCH1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Sew
get_relevant(sew, [CHAIR1, CLOSET1, CLOTHESDRESS1]) :-
	type(CHAIR1, chair), type(CLOSET1, closet), type(CLOTHESDRESS1, clothesdress).
complete_task(sew, P) :-
	type(CHAIR1, chair), type(CLOSET1, closet), type(CLOTHESDRESS1, clothesdress),
	transform([close([CLOSET1]), holds([CLOTHESDRESS1]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([CLOSET1])], P).

% Sew button
get_relevant(sew_button, [CLOTHESSHIRT1, BED1, THREAD1, DESK1, NEEDLE1, BUTTON1]) :-
	type(CLOTHESSHIRT1, clothesshirt), type(BED1, bed), type(THREAD1, thread), type(DESK1, desk), type(NEEDLE1, needle), type(BUTTON1, button).
complete_task(sew_button, P) :-
	type(CLOTHESSHIRT1, clothesshirt), type(BED1, bed), type(THREAD1, thread), type(DESK1, desk), type(NEEDLE1, needle), type(BUTTON1, button),
	transform([close([BED1, THREAD1, DESK1, NEEDLE1, BUTTON1]), holds([CLOTHESSHIRT1]), sat_on([BED1]), on_top_of([[THREAD1, BED1], [NEEDLE1, BED1], [BUTTON1, CLOTHESSHIRT1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), open([DESK1]), sew([BUTTON1])], P).

% Shampoo hair
get_relevant(shampoo_hair, [FAUCET1, HANDSBOTH1, SHAMPOO1, SINK1, HAIR1]) :-
	type(FAUCET1, faucet), type(HANDSBOTH1, handsboth), type(SHAMPOO1, shampoo), type(SINK1, sink), type(HAIR1, hair).
complete_task(shampoo_hair, P) :-
	type(FAUCET1, faucet), type(HANDSBOTH1, handsboth), type(SHAMPOO1, shampoo), type(SINK1, sink), type(HAIR1, hair),
	transform([close([SHAMPOO1, SINK1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), off([FAUCET1]), pour([SHAMPOO1]), wash([HAIR1])], P).

% Shave
get_relevant(shave, [RAZOR1]) :-
	type(RAZOR1, razor).
complete_task(shave, P) :-
	type(RAZOR1, razor),
	transform([close([RAZOR1]), holds([RAZOR1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([RAZOR1]), eaten([])], P).

% Shoe removal
get_relevant(shoe_removal, [SHOES1, SHOES2]) :-
	type(SHOES1, shoes), type(SHOES2, shoes).
complete_task(shoe_removal, P) :-
	type(SHOES1, shoes), type(SHOES2, shoes),
	transform([close([SHOES1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Shop
get_relevant(shop, [CREDITCARD1, KEYBOARD1, CHAIR1, DESK1, COMPUTER1]) :-
	type(CREDITCARD1, creditcard), type(KEYBOARD1, keyboard), type(CHAIR1, chair), type(DESK1, desk), type(COMPUTER1, computer).
complete_task(shop, P) :-
	type(CREDITCARD1, creditcard), type(KEYBOARD1, keyboard), type(CHAIR1, chair), type(DESK1, desk), type(COMPUTER1, computer),
	transform([close([CHAIR1]), holds([]), sat_on([CHAIR1]), on_top_of([[CREDITCARD1, DESK1]]), inside([]), on([COMPUTER1]), laid_on([]), used([]), eaten([]), open([DESK1]), type([KEYBOARD1])], P).

% Shred receipts
get_relevant(shred_receipts, [ELECTRICALOUTLET1, FILINGCABINET1, SHREDDER1, RECEIPT1]) :-
	type(ELECTRICALOUTLET1, electricaloutlet), type(FILINGCABINET1, filingcabinet), type(SHREDDER1, shredder), type(RECEIPT1, receipt).
complete_task(shred_receipts, P) :-
	type(ELECTRICALOUTLET1, electricaloutlet), type(FILINGCABINET1, filingcabinet), type(SHREDDER1, shredder), type(RECEIPT1, receipt),
	transform([close([FILINGCABINET1]), holds([]), sat_on([]), on_top_of([[RECEIPT1, SHREDDER1]]), inside([]), on([SHREDDER1]), laid_on([]), used([]), eaten([]), closed([FILINGCABINET1]), plugin([SHREDDER1])], P).

% Shut front door


% Sit
get_relevant(sit, [CHAIR1]) :-
	type(CHAIR1, chair).
complete_task(sit, P) :-
	type(CHAIR1, chair),
	transform([close([CHAIR1]), holds([]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), pull([CHAIR1])], P).

% Sit quietly
get_relevant(sit_quietly, [WALL1, CHAIR1]) :-
	type(WALL1, wall), type(CHAIR1, chair).
complete_task(sit_quietly, P) :-
	type(WALL1, wall), type(CHAIR1, chair),
	transform([close([CHAIR1]), holds([]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Sleep
get_relevant(sleep, [BED1]) :-
	type(BED1, bed).
complete_task(sleep, P) :-
	type(BED1, bed),
	transform([close([BED1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([BED1]), used([]), eaten([]), sleep([character1])], P).

% Social media  checks
get_relevant(social_media__checks, [COMPUTER1, CHAIR1]) :-
	type(COMPUTER1, computer), type(CHAIR1, chair).
complete_task(social_media__checks, P) :-
	type(COMPUTER1, computer), type(CHAIR1, chair),
	transform([close([COMPUTER1]), holds([]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([COMPUTER1]), laid_on([]), used([]), eaten([])], P).

% Sort mail
get_relevant(sort_mail, [MAIL1]) :-
	type(MAIL1, mail).
complete_task(sort_mail, P) :-
	type(MAIL1, mail),
	transform([close([]), holds([MAIL1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), crawl([]), read([MAIL1]), write([MAIL1])], P).

% Speaking on headset in skype or some form of voip for business call
get_relevant(speaking_on_headset_in_skype_or_some_form_of_voip_for_business_call, [COMPUTER1, KEYBOARD1, CHAIR1]) :-
	type(COMPUTER1, computer), type(KEYBOARD1, keyboard), type(CHAIR1, chair).
complete_task(speaking_on_headset_in_skype_or_some_form_of_voip_for_business_call, P) :-
	type(COMPUTER1, computer), type(KEYBOARD1, keyboard), type(CHAIR1, chair),
	transform([close([CHAIR1]), holds([]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([COMPUTER1]), laid_on([]), used([]), eaten([]), dial([COMPUTER1]), talk([character1]), type([KEYBOARD1])], P).

% Spread table with appropriate supplies
get_relevant(spread_table_with_appropriate_supplies, [TABLE1]) :-
	type(TABLE1, tabl).
complete_task(spread_table_with_appropriate_supplies, P) :-
	type(TABLE1, tabl),
	transform([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Start computer
get_relevant(start_computer, [COMPUTER1, CHAIR1]) :-
	type(COMPUTER1, computer), type(CHAIR1, chair).
complete_task(start_computer, P) :-
	type(COMPUTER1, computer), type(CHAIR1, chair),
	transform([close([CHAIR1]), holds([]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([COMPUTER1]), laid_on([]), used([]), eaten([])], P).

% Steam mop floor
get_relevant(steam_mop_floor, [FAUCET1, MOP1, SINK1, MOPBUCKET1]) :-
	type(FAUCET1, faucet), type(MOP1, mop), type(SINK1, sink), type(MOPBUCKET1, mopbucket).
complete_task(steam_mop_floor, P) :-
	type(FAUCET1, faucet), type(MOP1, mop), type(SINK1, sink), type(MOPBUCKET1, mopbucket),
	transform([close([SINK1, MOPBUCKET1]), holds([MOPBUCKET1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), off([FAUCET1]), pull([MOPBUCKET1]), soak([MOP1]), squeeze([MOP1])], P).

% Story reading time
get_relevant(story_reading_time, [CHILD1, BED1, BOOK1]) :-
	type(CHILD1, child), type(BED1, bed), type(BOOK1, book).
complete_task(story_reading_time, P) :-
	type(CHILD1, child), type(BED1, bed), type(BOOK1, book),
	transform([close([CHILD1]), holds([BOOK1]), sat_on([BED1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), greet([CHILD1]), read([BOOK1])], P).

% Straighten magazines
get_relevant(straighten_magazines, [MAGAZINE4, COFFEETABLE1, MAGAZINE3, MAGAZINE5, GARBAGECAN1, MAGAZINE2, MAGAZINE1]) :-
	type(MAGAZINE4, magazine), type(COFFEETABLE1, coffeetable), type(MAGAZINE3, magazine), type(MAGAZINE5, magazine), type(GARBAGECAN1, garbagecan), type(MAGAZINE2, magazine), type(MAGAZINE1, magazine).
complete_task(straighten_magazines, P) :-
	type(MAGAZINE4, magazine), type(COFFEETABLE1, coffeetable), type(MAGAZINE3, magazine), type(MAGAZINE5, magazine), type(GARBAGECAN1, garbagecan), type(MAGAZINE2, magazine), type(MAGAZINE1, magazine),
	transform([close([MAGAZINE4, COFFEETABLE1, MAGAZINE3, MAGAZINE5, GARBAGECAN1, MAGAZINE2, MAGAZINE1]), holds([]), sat_on([]), on_top_of([[MAGAZINE4, GARBAGECAN1], [MAGAZINE3, GARBAGECAN1], [MAGAZINE5, COFFEETABLE1], [MAGAZINE2, GARBAGECAN1], [MAGAZINE1, GARBAGECAN1]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Stretch
get_relevant(stretch, [LEGSBOTH1, ARMSBOTH1]) :-
	type(LEGSBOTH1, legsboth), type(ARMSBOTH1, armsboth).
complete_task(stretch, P) :-
	type(LEGSBOTH1, legsboth), type(ARMSBOTH1, armsboth),
	transform([close([ARMSBOTH1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), stretch([LEGSBOTH1, ARMSBOTH1])], P).

% String green beans
get_relevant(string_green_beans, [TABLE1, PLATE1, FOODVEGETABLE4, BOWL1, FOODVEGETABLE2, FOODVEGETABLE1, FOODVEGETABLE5, FOODVEGETABLE3]) :-
	type(TABLE1, tabl), type(PLATE1, plate), type(FOODVEGETABLE4, foodvegetable), type(BOWL1, bowl), type(FOODVEGETABLE2, foodvegetable), type(FOODVEGETABLE1, foodvegetable), type(FOODVEGETABLE5, foodvegetable), type(FOODVEGETABLE3, foodvegetable).
complete_task(string_green_beans, P) :-
	type(TABLE1, tabl), type(PLATE1, plate), type(FOODVEGETABLE4, foodvegetable), type(BOWL1, bowl), type(FOODVEGETABLE2, foodvegetable), type(FOODVEGETABLE1, foodvegetable), type(FOODVEGETABLE5, foodvegetable), type(FOODVEGETABLE3, foodvegetable),
	transform([close([PLATE1, BOWL1]), holds([]), sat_on([]), on_top_of([[PLATE1, TABLE1], [FOODVEGETABLE4, BOWL1], [BOWL1, TABLE1], [FOODVEGETABLE2, BOWL1], [foodvegeTABLE1, BOWL1], [FOODVEGETABLE5, BOWL1], [FOODVEGETABLE3, BOWL1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), cut([FOODVEGETABLE4, FOODVEGETABLE2, foodvegeTABLE1, FOODVEGETABLE5, FOODVEGETABLE3])], P).

% Study
get_relevant(study, [BOOK1, LAMP1, CHAIR1]) :-
	type(BOOK1, book), type(LAMP1, lamp), type(CHAIR1, chair).
complete_task(study, P) :-
	type(BOOK1, book), type(LAMP1, lamp), type(CHAIR1, chair),
	transform([close([LAMP1]), holds([BOOK1]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([LAMP1]), laid_on([]), used([]), eaten([]), read([BOOK1])], P).

% Study bible
get_relevant(study_bible, [BOOK1, NOTEPAD1, CHAIR1]) :-
	type(BOOK1, book), type(NOTEPAD1, notepad), type(CHAIR1, chair).
complete_task(study_bible, P) :-
	type(BOOK1, book), type(NOTEPAD1, notepad), type(CHAIR1, chair),
	transform([close([CHAIR1]), holds([BOOK1, NOTEPAD1]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), read([BOOK1]), write([NOTEPAD1])], P).

% Style hair
get_relevant(style_hair, [HAIRBRUSH1, ELECTRICALOUTLET1, BLOWDRYER1, HAIR1]) :-
	type(HAIRBRUSH1, hairbrush), type(ELECTRICALOUTLET1, electricaloutlet), type(BLOWDRYER1, blowdryer), type(HAIR1, hair).
complete_task(style_hair, P) :-
	type(HAIRBRUSH1, hairbrush), type(ELECTRICALOUTLET1, electricaloutlet), type(BLOWDRYER1, blowdryer), type(HAIR1, hair),
	transform([close([ELECTRICALOUTLET1, BLOWDRYER1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), brush([HAIR1]), off([BLOWDRYER1]), plugin([BLOWDRYER1])], P).

% Sweep and wipe table off with rag
get_relevant(sweep_and_wipe_table_off_with_rag, [RAG1, TABLE1, CLOSET1]) :-
	type(RAG1, rag), type(TABLE1, tabl), type(CLOSET1, closet).
complete_task(sweep_and_wipe_table_off_with_rag, P) :-
	type(RAG1, rag), type(TABLE1, tabl), type(CLOSET1, closet),
	transform([close([RAG1, CLOSET1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([CLOSET1]), pull([]), push([]), putin([])], P).

% Sweep entrance hall
get_relevant(sweep_entrance_hall, [TRASHCAN1, DIRT1, DUSTPAN1, FLOOR1]) :-
	type(TRASHCAN1, trashcan), type(DIRT1, dirt), type(DUSTPAN1, dustpan), type(FLOOR1, floor).
complete_task(sweep_entrance_hall, P) :-
	type(TRASHCAN1, trashcan), type(DIRT1, dirt), type(DUSTPAN1, dustpan), type(FLOOR1, floor),
	transform([close([TRASHCAN1, DUSTPAN1]), holds([]), sat_on([]), on_top_of([[DUSTPAN1], [DIRT1, TRASHCAN1], [DUSTPAN1, TRASHCAN1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), sweep([FLOOR1])], P).

% Sweep floor
get_relevant(sweep_floor, [TRASHCAN1, DIRT1, DUSTPAN1]) :-
	type(TRASHCAN1, trashcan), type(DIRT1, dirt), type(DUSTPAN1, dustpan).
complete_task(sweep_floor, P) :-
	type(TRASHCAN1, trashcan), type(DIRT1, dirt), type(DUSTPAN1, dustpan),
	transform([close([]), holds([]), sat_on([]), on_top_of([[DIRT1, TRASHCAN1], [DUSTPAN1, TRASHCAN1]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Tabletop game
get_relevant(tabletop_game, [TABLE1, COUCH1, BOARDGAME1]) :-
	type(TABLE1, tabl), type(COUCH1, couch), type(BOARDGAME1, boardgame).
complete_task(tabletop_game, P) :-
	type(TABLE1, tabl), type(COUCH1, couch), type(BOARDGAME1, boardgame),
	transform([close([BOARDGAME1]), holds([]), sat_on([COUCH1]), on_top_of([[BOARDGAME1, TABLE1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), play([BOARDGAME1])], P).

% Take bath
get_relevant(take_bath, [FAUCET1, BATHTUB1]) :-
	type(FAUCET1, faucet), type(BATHTUB1, bathtub).
complete_task(take_bath, P) :-
	type(FAUCET1, faucet), type(BATHTUB1, bathtub),
	transform([close([BATHTUB1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([FAUCET1]), laid_on([BATHTUB1]), used([]), eaten([])], P).

% Take coat
get_relevant(take_coat, [CLOTHESJACKET1, CLOSET1, HANGER1]) :-
	type(CLOTHESJACKET1, clothesjacket), type(CLOSET1, closet), type(HANGER1, hanger).
complete_task(take_coat, P) :-
	type(CLOTHESJACKET1, clothesjacket), type(CLOSET1, closet), type(HANGER1, hanger),
	transform([close([CLOTHESJACKET1, CLOSET1]), holds([HANGER1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([CLOSET1]), putin([HANGER1])], P).

% Take dishes out of dishwasher
get_relevant(take_dishes_out_of_dishwasher, [DISHWASHER1]) :-
	type(DISHWASHER1, dishwasher).
complete_task(take_dishes_out_of_dishwasher, P) :-
	type(DISHWASHER1, dishwasher),
	transform([close([DISHWASHER1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([DISHWASHER1])], P).

% Take jacket off
get_relevant(take_jacket_off, [CLOTHESJACKET1, CLOSET1]) :-
	type(CLOTHESJACKET1, clothesjacket), type(CLOSET1, closet).
complete_task(take_jacket_off, P) :-
	type(CLOTHESJACKET1, clothesjacket), type(CLOSET1, closet),
	transform([close([CLOTHESJACKET1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([CLOSET1])], P).

% Take nap
get_relevant(take_nap, [COUCH1, BLANKET1]) :-
	type(COUCH1, couch), type(BLANKET1, blanket).
complete_task(take_nap, P) :-
	type(COUCH1, couch), type(BLANKET1, blanket),
	transform([close([COUCH1, BLANKET1]), holds([BLANKET1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([COUCH1]), used([]), eaten([]), cover([BLANKET1]), sleep([character1])], P).

% Take off outerwear
get_relevant(take_off_outerwear, [SHOES1, CLOTHESJACKET1, CLOSET1, CLOTHESHAT1, LIGHT1, HANGER1]) :-
	type(SHOES1, shoes), type(CLOTHESJACKET1, clothesjacket), type(CLOSET1, closet), type(CLOTHESHAT1, clotheshat), type(LIGHT1, light), type(HANGER1, hanger).
complete_task(take_off_outerwear, P) :-
	type(SHOES1, shoes), type(CLOTHESJACKET1, clothesjacket), type(CLOSET1, closet), type(CLOTHESHAT1, clotheshat), type(LIGHT1, light), type(HANGER1, hanger),
	transform([close([LIGHT1]), holds([SHOES1]), sat_on([]), on_top_of([[CLOTHESJACKET1, HANGER1], [CLOTHESHAT1, HANGER1]]), inside([]), on([LIGHT1]), laid_on([]), used([]), eaten([]), closed([CLOSET1]), putin([SHOES1])], P).

% Take off shoes
get_relevant(take_off_shoes, [SHOES1, FLOOR1]) :-
	type(SHOES1, shoes), type(FLOOR1, floor).
complete_task(take_off_shoes, P) :-
	type(SHOES1, shoes), type(FLOOR1, floor),
	transform([close([SHOES1]), holds([]), sat_on([]), on_top_of([[SHOES1, FLOOR1]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Take shower
get_relevant(take_shower, [SHOWER1, TOWEL1]) :-
	type(SHOWER1, shower), type(TOWEL1, towel).
complete_task(take_shower, P) :-
	type(SHOWER1, shower), type(TOWEL1, towel),
	transform([close([SHOWER1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([SHOWER1]), laid_on([]), used([]), eaten([]), enter([SHOWER1])], P).

% Tale off shoes
get_relevant(tale_off_shoes, [MAT1, SHOES1, CLOSET1]) :-
	type(MAT1, mat), type(SHOES1, shoes), type(CLOSET1, closet).
complete_task(tale_off_shoes, P) :-
	type(MAT1, mat), type(SHOES1, shoes), type(CLOSET1, closet),
	transform([close([MAT1]), holds([SHOES1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([CLOSET1]), putin([SHOES1]), wipe([SHOES1])], P).

% Talk on phone
get_relevant(talk_on_phone, [TELEPHONE1, CHAIR1]) :-
	type(TELEPHONE1, telephone), type(CHAIR1, chair).
complete_task(talk_on_phone, P) :-
	type(TELEPHONE1, telephone), type(CHAIR1, chair),
	transform([close([CHAIR1]), holds([]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), dial([TELEPHONE1]), talk([TELEPHONE1])], P).

% Talk to kids
get_relevant(talk_to_kids, [CHILD1, CHAIR1, CHILD2]) :-
	type(CHILD1, child), type(CHAIR1, chair), type(CHILD2, child).
complete_task(talk_to_kids, P) :-
	type(CHILD1, child), type(CHAIR1, chair), type(CHILD2, child),
	transform([close([CHILD1]), holds([]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), greet([CHILD1, CHILD2]), talk([CHILD1, CHILD2])], P).

% Talk with friends
get_relevant(talk_with_friends, [WOMAN2, WOMAN1, COUCH1]) :-
	type(WOMAN2, woman), type(WOMAN1, woman), type(COUCH1, couch).
complete_task(talk_with_friends, P) :-
	type(WOMAN2, woman), type(WOMAN1, woman), type(COUCH1, couch),
	transform([close([WOMAN1]), holds([]), sat_on([COUCH1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), greet([WOMAN2, WOMAN1]), talk([WOMAN2, WOMAN1])], P).

% Talk with guest
get_relevant(talk_with_guest, [MAN1, CHAIR1]) :-
	type(MAN1, man), type(CHAIR1, chair).
complete_task(talk_with_guest, P) :-
	type(MAN1, man), type(CHAIR1, chair),
	transform([close([MAN1]), holds([]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), greet([MAN1]), talk([MAN1])], P).

% Talk with your child about their day
get_relevant(talk_with_your_child_about_their_day, [CHILD1, CHAIR1]) :-
	type(CHILD1, child), type(CHAIR1, chair).
complete_task(talk_with_your_child_about_their_day, P) :-
	type(CHILD1, child), type(CHAIR1, chair),
	transform([close([CHILD1]), holds([]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), greet([CHILD1]), talk([CHILD1])], P).

% Teach them to make their bed
get_relevant(teach_them_to_make_their_bed, [PILLOW2, SHEETS1, BED1, PILLOW1, CABINET1]) :-
	type(PILLOW2, pillow), type(SHEETS1, sheets), type(BED1, bed), type(PILLOW1, pillow), type(CABINET1, cabinet).
complete_task(teach_them_to_make_their_bed, P) :-
	type(PILLOW2, pillow), type(SHEETS1, sheets), type(BED1, bed), type(PILLOW1, pillow), type(CABINET1, cabinet),
	transform([close([PILLOW2, SHEETS1, BED1, PILLOW1, CABINET1]), holds([]), sat_on([]), on_top_of([[PILLOW2, BED1], [SHEETS1, BED1], [PILLOW1, BED1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), cover([BED1])], P).

% Tell jokes
get_relevant(tell_jokes, [MAN1]) :-
	type(MAN1, man).
complete_task(tell_jokes, P) :-
	type(MAN1, man),
	transform([close([MAN1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), greet([MAN1]), talk([MAN1])], P).

% Text friends while sitting on couch
get_relevant(text_friends_while_sitting_on_couch, [COUCH1, CELLPHONE1, KEYBOARD1]) :-
	type(COUCH1, couch), type(CELLPHONE1, cellphone), type(KEYBOARD1, keyboard).
complete_task(text_friends_while_sitting_on_couch, P) :-
	type(COUCH1, couch), type(CELLPHONE1, cellphone), type(KEYBOARD1, keyboard),
	transform([close([COUCH1]), holds([CELLPHONE1]), sat_on([COUCH1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), touch([KEYBOARD1]), type([KEYBOARD1])], P).

% Thanksgiving
get_relevant(thanksgiving, [FOODFOOD1, TABLE1, PLATE1, FOODTURKEY1, CLOTHNAPKIN1, CENTERPIECE1, PLACEMAT1]) :-
	type(FOODFOOD1, foodfood), type(TABLE1, tabl), type(PLATE1, plate), type(FOODTURKEY1, foodturkey), type(CLOTHNAPKIN1, clothnapkin), type(CENTERPIECE1, centerpiece), type(PLACEMAT1, placemat).
complete_task(thanksgiving, P) :-
	type(FOODFOOD1, foodfood), type(TABLE1, tabl), type(PLATE1, plate), type(FOODTURKEY1, foodturkey), type(CLOTHNAPKIN1, clothnapkin), type(CENTERPIECE1, centerpiece), type(PLACEMAT1, placemat),
	transform([close([FOODFOOD1, FOODTURKEY1, CENTERPIECE1]), holds([]), sat_on([]), on_top_of([[FOODFOOD1, TABLE1], [PLATE1, PLACEMAT1], [FOODTURKEY1, TABLE1], [CLOTHNAPKIN1, TABLE1], [CENTERPIECE1, TABLE1], [PLACEMAT1, TABLE1]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Throw shoes
get_relevant(throw_shoes, [SHOES1, SHOES2]) :-
	type(SHOES1, shoes), type(SHOES2, shoes).
complete_task(throw_shoes, P) :-
	type(SHOES1, shoes), type(SHOES2, shoes),
	transform([close([SHOES1]), holds([SHOES1, SHOES2]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), standup([character1]), throw([SHOES1, SHOES2])], P).

% Tidy
get_relevant(tidy, [TRASHCAN1, TOY2, TOY1, TABLE1, COUCH1, REMOTECONTROL1, PAPERTOWEL1, CABINET1]) :-
	type(TRASHCAN1, trashcan), type(TOY2, toy), type(TOY1, toy), type(TABLE1, tabl), type(COUCH1, couch), type(REMOTECONTROL1, remotecontrol), type(PAPERTOWEL1, papertowel), type(CABINET1, cabinet).
complete_task(tidy, P) :-
	type(TRASHCAN1, trashcan), type(TOY2, toy), type(TOY1, toy), type(TABLE1, tabl), type(COUCH1, couch), type(REMOTECONTROL1, remotecontrol), type(PAPERTOWEL1, papertowel), type(CABINET1, cabinet),
	transform([close([TOY2, TOY1, COUCH1, CABINET1]), holds([]), sat_on([]), on_top_of([[TOY2, CABINET1], [TOY1, CABINET1], [REMOTECONTROL1, TABLE1], [PAPERTOWEL1, TABLE1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), open([CABINET1])], P).

% Toilet
get_relevant(toilet, [SOAP1, FAUCET1, HANDSBOTH1, TOILET1, SINK1, CLOTHESPANTS1]) :-
	type(SOAP1, soap), type(FAUCET1, faucet), type(HANDSBOTH1, handsboth), type(TOILET1, toilet), type(SINK1, sink), type(CLOTHESPANTS1, clothespants).
complete_task(toilet, P) :-
	type(SOAP1, soap), type(FAUCET1, faucet), type(HANDSBOTH1, handsboth), type(TOILET1, toilet), type(SINK1, sink), type(CLOTHESPANTS1, clothespants),
	transform([close([TOILET1, SINK1, CLOTHESPANTS1]), holds([CLOTHESPANTS1]), sat_on([TOILET1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), drop([CLOTHESPANTS1]), flush([TOILET1]), off([FAUCET1]), puton([CLOTHESPANTS1]), rinse([HANDSBOTH1]), scrub([HANDSBOTH1]), standup([character1])], P).

% Transcribe what i say
get_relevant(transcribe_what_i_say, [KEYBOARD1]) :-
	type(KEYBOARD1, keyboard).
complete_task(transcribe_what_i_say, P) :-
	type(KEYBOARD1, keyboard),
	transform([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), plugin([KEYBOARD1]), touch([KEYBOARD1]), wipe([KEYBOARD1])], P).

% Try yourself off
get_relevant(try_yourself_off, [ARMSBOTH1, FACE1, CLOSET1, TOWEL1, LEGSBOTH1, FEETBOTH1, BASKETFORCLOTHES1]) :-
	type(ARMSBOTH1, armsboth), type(FACE1, face), type(CLOSET1, closet), type(TOWEL1, towel), type(LEGSBOTH1, legsboth), type(FEETBOTH1, feetboth), type(BASKETFORCLOTHES1, basketforclothes).
complete_task(try_yourself_off, P) :-
	type(ARMSBOTH1, armsboth), type(FACE1, face), type(CLOSET1, closet), type(TOWEL1, towel), type(LEGSBOTH1, legsboth), type(FEETBOTH1, feetboth), type(BASKETFORCLOTHES1, basketforclothes),
	transform([close([CLOSET1]), holds([]), sat_on([]), on_top_of([[TOWEL1, BASKETFORCLOTHES1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([CLOSET1]), wipe([ARMSBOTH1, FACE1, LEGSBOTH1, FEETBOTH1])], P).

% Tuck kids in bed
get_relevant(tuck_kids_in_bed, [LIGHTSWITCH1, BED1, CHILD1, CHILD2, BLANKET2, BLANKET1, BED2]) :-
	type(LIGHTSWITCH1, lightswitch), type(BED1, bed), type(CHILD1, child), type(CHILD2, child), type(BLANKET2, blanket), type(BLANKET1, blanket), type(BED2, bed).
complete_task(tuck_kids_in_bed, P) :-
	type(LIGHTSWITCH1, lightswitch), type(BED1, bed), type(CHILD1, child), type(CHILD2, child), type(BLANKET2, blanket), type(BLANKET1, blanket), type(BED2, bed),
	transform([close([]), holds([BLANKET2, BLANKET1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), cover([CHILD1, CHILD2]), greet([CHILD1, CHILD2]), off([LIGHTSWITCH1])], P).

% Tummy time
get_relevant(tummy_time, [BED1, MAT1, CHILD1, BOOK1, FLOOR1, CABINET1]) :-
	type(BED1, bed), type(MAT1, mat), type(CHILD1, child), type(BOOK1, book), type(FLOOR1, floor), type(CABINET1, cabinet).
complete_task(tummy_time, P) :-
	type(BED1, bed), type(MAT1, mat), type(CHILD1, child), type(BOOK1, book), type(FLOOR1, floor), type(CABINET1, cabinet),
	transform([close([BED1, MAT1, CABINET1]), holds([BOOK1]), sat_on([BED1]), on_top_of([[MAT1, FLOOR1], [CHILD1, MAT1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), read([BOOK1]), touch([CHILD1])], P).

% Turking
get_relevant(turking, [COMPUTER1, DESK1, CHAIR1]) :-
	type(COMPUTER1, computer), type(DESK1, desk), type(CHAIR1, chair).
complete_task(turking, P) :-
	type(COMPUTER1, computer), type(DESK1, desk), type(CHAIR1, chair),
	transform([close([DESK1]), holds([]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([COMPUTER1]), laid_on([]), used([]), eaten([])], P).

% Turn light off
get_relevant(turn_light_off, [LIGHTSWITCH1]) :-
	type(LIGHTSWITCH1, lightswitch).
complete_task(turn_light_off, P) :-
	type(LIGHTSWITCH1, lightswitch),
	transform([close([LIGHTSWITCH1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), off([LIGHTSWITCH1])], P).

% Turn night light on
get_relevant(turn_night_light_on, [LAMP1, DRESSER1]) :-
	type(LAMP1, lamp), type(DRESSER1, dresser).
complete_task(turn_night_light_on, P) :-
	type(LAMP1, lamp), type(DRESSER1, dresser),
	transform([close([DRESSER1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([LAMP1]), laid_on([]), used([]), eaten([])], P).

% Turn off light
get_relevant(turn_off_light, [LIGHTSWITCH1]) :-
	type(LIGHTSWITCH1, lightswitch).
complete_task(turn_off_light, P) :-
	type(LIGHTSWITCH1, lightswitch),
	transform([close([LIGHTSWITCH1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), off([LIGHTSWITCH1])], P).

% Turn on TV with remote
get_relevant(turn_on_tv_with_remote, [REMOTECONTROL1, TABLE1, TELEVISION1]) :-
	type(REMOTECONTROL1, remotecontrol), type(TABLE1, tabl), type(TELEVISION1, television).
complete_task(turn_on_tv_with_remote, P) :-
	type(REMOTECONTROL1, remotecontrol), type(TABLE1, tabl), type(TELEVISION1, television),
	transform([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([TELEVISION1]), laid_on([]), used([]), eaten([])], P).

% Turn on computer
get_relevant(turn_on_computer, [COMPUTER1]) :-
	type(COMPUTER1, computer).
complete_task(turn_on_computer, P) :-
	type(COMPUTER1, computer),
	transform([close([COMPUTER1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([COMPUTER1]), laid_on([]), used([]), eaten([])], P).

% Turn on light
get_relevant(turn_on_light, [LIGHTSWITCH1]) :-
	type(LIGHTSWITCH1, lightswitch).
complete_task(turn_on_light, P) :-
	type(LIGHTSWITCH1, lightswitch),
	transform([close([LIGHTSWITCH1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([LIGHTSWITCH1]), laid_on([]), used([]), eaten([])], P).

% Type up document
get_relevant(type_up_document, [COFFEECUP1, DOCUMENT1, KEYBOARD1, CHAIR1, COMPUTER1]) :-
	type(COFFEECUP1, coffeecup), type(DOCUMENT1, document), type(KEYBOARD1, keyboard), type(CHAIR1, chair), type(COMPUTER1, computer).
complete_task(type_up_document, P) :-
	type(COFFEECUP1, coffeecup), type(DOCUMENT1, document), type(KEYBOARD1, keyboard), type(CHAIR1, chair), type(COMPUTER1, computer),
	transform([close([CHAIR1]), holds([DOCUMENT1]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([COMPUTER1]), laid_on([]), used([]), eaten([]), drink([COFFEECUP1]), read([DOCUMENT1]), type([KEYBOARD1])], P).

% Unload dishwasher
get_relevant(unload_dishwasher, [PLATE1, BOWL1, KITCHENCABINET1, DISHWASHER1, SPOON1, FORK1]) :-
	type(PLATE1, plate), type(BOWL1, bowl), type(KITCHENCABINET1, kitchencabinet), type(DISHWASHER1, dishwasher), type(SPOON1, spoon), type(FORK1, fork).
complete_task(unload_dishwasher, P) :-
	type(PLATE1, plate), type(BOWL1, bowl), type(KITCHENCABINET1, kitchencabinet), type(DISHWASHER1, dishwasher), type(SPOON1, spoon), type(FORK1, fork),
	transform([close([PLATE1, BOWL1, KITCHENCABINET1, DISHWASHER1, SPOON1, FORK1]), holds([PLATE1, BOWL1, SPOON1, FORK1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([KITCHENCABINET1, DISHWASHER1]), putin([PLATE1, BOWL1, SPOON1, FORK1])], P).

% Unload various items from pockets and place them in bowl on table
get_relevant(unload_various_items_from_pockets_and_place_them_in_bowl_on_table, [TABLE1, BOWL1, CLOTHESPANTS1, CELLPHONE1, BILLS1]) :-
	type(TABLE1, tabl), type(BOWL1, bowl), type(CLOTHESPANTS1, clothespants), type(CELLPHONE1, cellphone), type(BILLS1, bills).
complete_task(unload_various_items_from_pockets_and_place_them_in_bowl_on_table, P) :-
	type(TABLE1, tabl), type(BOWL1, bowl), type(CLOTHESPANTS1, clothespants), type(CELLPHONE1, cellphone), type(BILLS1, bills),
	transform([close([]), holds([CELLPHONE1, BILLS1]), sat_on([]), on_top_of([[BOWL1, TABLE1]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Update address book
get_relevant(update_address_book, [PEN1, ADDRESSBOOK1, CHAIR1, DESK1]) :-
	type(PEN1, pen), type(ADDRESSBOOK1, addressbook), type(CHAIR1, chair), type(DESK1, desk).
complete_task(update_address_book, P) :-
	type(PEN1, pen), type(ADDRESSBOOK1, addressbook), type(CHAIR1, chair), type(DESK1, desk),
	transform([close([ADDRESSBOOK1, DESK1]), holds([ADDRESSBOOK1]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), open([DESK1]), read([ADDRESSBOOK1]), write([ADDRESSBOOK1])], P).

% Use bathroom
get_relevant(use_bathroom, [TOILET1]) :-
	type(TOILET1, toilet).
complete_task(use_bathroom, P) :-
	type(TOILET1, toilet),
	transform([close([TOILET1]), holds([]), sat_on([TOILET1]), on_top_of([]), inside([]), on([]), laid_on([]), used([TOILET1]), eaten([])], P).

% Use computer
get_relevant(use_computer, [COMPUTER1, KEYBOARD1, CHAIR1]) :-
	type(COMPUTER1, computer), type(KEYBOARD1, keyboard), type(CHAIR1, chair).
complete_task(use_computer, P) :-
	type(COMPUTER1, computer), type(KEYBOARD1, keyboard), type(CHAIR1, chair),
	transform([close([CHAIR1]), holds([]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([COMPUTER1]), laid_on([]), used([]), eaten([]), type([KEYBOARD1])], P).

% Use restroom
get_relevant(use_restroom, [FAUCET1, HANDSBOTH1, TOILETPAPER1, TOILET1, SINK1, CLOTHESDRESS1]) :-
	type(FAUCET1, faucet), type(HANDSBOTH1, handsboth), type(TOILETPAPER1, toiletpaper), type(TOILET1, toilet), type(SINK1, sink), type(CLOTHESDRESS1, clothesdress).
complete_task(use_restroom, P) :-
	type(FAUCET1, faucet), type(HANDSBOTH1, handsboth), type(TOILETPAPER1, toiletpaper), type(TOILET1, toilet), type(SINK1, sink), type(CLOTHESDRESS1, clothesdress),
	transform([close([TOILET1, SINK1]), holds([]), sat_on([TOILET1]), on_top_of([[TOILETPAPER1, TOILET1], [CLOTHESDRESS1, TOILET1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), flush([TOILET1]), off([FAUCET1]), standup([character1]), wash([HANDSBOTH1]), wipe([character1])], P).

% Use toilet
get_relevant(use_toilet, [TOILET1]) :-
	type(TOILET1, toilet).
complete_task(use_toilet, P) :-
	type(TOILET1, toilet),
	transform([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([TOILET1]), eaten([])], P).

% Vacuum
get_relevant(vacuum, [VACUUMCLEANER1]) :-
	type(VACUUMCLEANER1, vacuumcleaner).
complete_task(vacuum, P) :-
	type(VACUUMCLEANER1, vacuumcleaner),
	transform([close([VACUUMCLEANER1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), plugin([VACUUMCLEANER1]), push([VACUUMCLEANER1])], P).

% Visit
get_relevant(visit, [CHAIR3, WOMAN1, CHAIR1, CHAIR2, WOMAN2]) :-
	type(CHAIR3, chair), type(WOMAN1, woman), type(CHAIR1, chair), type(CHAIR2, chair), type(WOMAN2, woman).
complete_task(visit, P) :-
	type(CHAIR3, chair), type(WOMAN1, woman), type(CHAIR1, chair), type(CHAIR2, chair), type(WOMAN2, woman),
	transform([close([WOMAN1, CHAIR1]), holds([]), sat_on([CHAIR3]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), greet([WOMAN1, WOMAN2]), talk([WOMAN1, WOMAN2])], P).

% Visit neighbors
get_relevant(visit_neighbors, [WOMAN2, WOMAN1, COUCH1]) :-
	type(WOMAN2, woman), type(WOMAN1, woman), type(COUCH1, couch).
complete_task(visit_neighbors, P) :-
	type(WOMAN2, woman), type(WOMAN1, woman), type(COUCH1, couch),
	transform([close([WOMAN1]), holds([]), sat_on([COUCH1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), greet([WOMAN2, WOMAN1]), talk([WOMAN2, WOMAN1])], P).

% Visit with friends while engaging in games
get_relevant(visit_with_friends_while_engaging_in_games, [MAN2, TABLE1, BOARDGAME1, MAN1, COUCH1]) :-
	type(MAN2, man), type(TABLE1, tabl), type(BOARDGAME1, boardgame), type(MAN1, man), type(COUCH1, couch).
complete_task(visit_with_friends_while_engaging_in_games, P) :-
	type(MAN2, man), type(TABLE1, tabl), type(BOARDGAME1, boardgame), type(MAN1, man), type(COUCH1, couch),
	transform([close([BOARDGAME1, MAN1]), holds([]), sat_on([COUCH1]), on_top_of([[BOARDGAME1, TABLE1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), greet([MAN2, MAN1]), play([BOARDGAME1]), talk([MAN2, MAN1]), uncover([BOARDGAME1])], P).

% Wait
get_relevant(wait, [WALLCLOCK1, LEGSBOTH1, COUCH1]) :-
	type(WALLCLOCK1, wallclock), type(LEGSBOTH1, legsboth), type(COUCH1, couch).
complete_task(wait, P) :-
	type(WALLCLOCK1, wallclock), type(LEGSBOTH1, legsboth), type(COUCH1, couch),
	transform([close([COUCH1]), holds([]), sat_on([COUCH1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), stretch([LEGSBOTH1]), wait([character1])], P).

% Wake kids up
get_relevant(wake_kids_up, [CHILD1]) :-
	type(CHILD1, child).
complete_task(wake_kids_up, P) :-
	type(CHILD1, child),
	transform([close([CHILD1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), greet([CHILD1]), touch([CHILD1]), wash([CHILD1])], P).

% Wake me up
get_relevant(wake_me_up, [MAN1, WALLCLOCK1, BED1]) :-
	type(MAN1, man), type(WALLCLOCK1, wallclock), type(BED1, bed).
complete_task(wake_me_up, P) :-
	type(MAN1, man), type(WALLCLOCK1, wallclock), type(BED1, bed),
	transform([close([WALLCLOCK1, BED1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), squeeze([MAN1]), touch([MAN1])], P).

% Walk through


% Wash clothes
get_relevant(wash_clothes, [CLOTHESPANTS1, LAUNDRYDETERGENT1, WASHINGMACHINE1]) :-
	type(CLOTHESPANTS1, clothespants), type(LAUNDRYDETERGENT1, laundrydetergent), type(WASHINGMACHINE1, washingmachine).
complete_task(wash_clothes, P) :-
	type(CLOTHESPANTS1, clothespants), type(LAUNDRYDETERGENT1, laundrydetergent), type(WASHINGMACHINE1, washingmachine),
	transform([close([]), holds([LAUNDRYDETERGENT1]), sat_on([]), on_top_of([[CLOTHESPANTS1, WASHINGMACHINE1]]), inside([]), on([WASHINGMACHINE1]), laid_on([]), used([]), eaten([]), closed([WASHINGMACHINE1]), pour([LAUNDRYDETERGENT1])], P).

% Wash dirty dishes
get_relevant(wash_dirty_dishes, [DISHSOAP1, FAUCET1, PLATE1, DISHRACK1, SPONGE1, SINK1, PLATE2]) :-
	type(DISHSOAP1, dishsoap), type(FAUCET1, faucet), type(PLATE1, plate), type(DISHRACK1, dishrack), type(SPONGE1, sponge), type(SINK1, sink), type(PLATE2, plate).
complete_task(wash_dirty_dishes, P) :-
	type(DISHSOAP1, dishsoap), type(FAUCET1, faucet), type(PLATE1, plate), type(DISHRACK1, dishrack), type(SPONGE1, sponge), type(SINK1, sink), type(PLATE2, plate),
	transform([close([SINK1]), holds([]), sat_on([]), on_top_of([[PLATE1, DISHRACK1], [SPONGE1, DISHRACK1], [PLATE2, DISHRACK1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), off([FAUCET1]), pour([DISHSOAP1]), rinse([PLATE1, SPONGE1, PLATE2]), scrub([PLATE1, PLATE2])], P).

% Wash dishes
get_relevant(wash_dishes, [DISHSOAP1, FAUCET1, PLATE1, DISHRACK1, SPONGE1, SINK1, PLATE2]) :-
	type(DISHSOAP1, dishsoap), type(FAUCET1, faucet), type(PLATE1, plate), type(DISHRACK1, dishrack), type(SPONGE1, sponge), type(SINK1, sink), type(PLATE2, plate).
complete_task(wash_dishes, P) :-
	type(DISHSOAP1, dishsoap), type(FAUCET1, faucet), type(PLATE1, plate), type(DISHRACK1, dishrack), type(SPONGE1, sponge), type(SINK1, sink), type(PLATE2, plate),
	transform([close([PLATE1, SINK1, PLATE2]), holds([]), sat_on([]), on_top_of([[PLATE1, DISHRACK1], [SPONGE1, DISHRACK1], [PLATE2, DISHRACK1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), pour([DISHSOAP1]), rinse([PLATE1, PLATE2]), wash([PLATE1, PLATE2])], P).

% Wash face
get_relevant(wash_face, [SOAP1, FAUCET1, WATER1, FACE1, SINK1]) :-
	type(SOAP1, soap), type(FAUCET1, faucet), type(WATER1, water), type(FACE1, face), type(SINK1, sink).
complete_task(wash_face, P) :-
	type(SOAP1, soap), type(FAUCET1, faucet), type(WATER1, water), type(FACE1, face), type(SINK1, sink),
	transform([close([SINK1]), holds([WATER1]), sat_on([]), on_top_of([]), inside([]), on([FAUCET1]), laid_on([]), used([SOAP1]), eaten([]), wash([FACE1])], P).

% Wash hair
get_relevant(wash_hair, [SOAP1, SHOWER1, WATER1]) :-
	type(SOAP1, soap), type(SHOWER1, shower), type(WATER1, water).
complete_task(wash_hair, P) :-
	type(SOAP1, soap), type(SHOWER1, shower), type(WATER1, water),
	transform([close([SHOWER1]), holds([SOAP1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), enter([SHOWER1]), leave([SHOWER1]), rinse([WATER1])], P).

% Wash hands
get_relevant(wash_hands, [HANDSBOTH2, FAUCET1, SINK1]) :-
	type(HANDSBOTH2, handsboth), type(FAUCET1, faucet), type(SINK1, sink).
complete_task(wash_hands, P) :-
	type(HANDSBOTH2, handsboth), type(FAUCET1, faucet), type(SINK1, sink),
	transform([close([SINK1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([FAUCET1]), laid_on([]), used([]), eaten([]), wash([HANDSBOTH2])], P).

% Wash sink
get_relevant(wash_sink, [CLEANINGSOLUTION1, FAUCET1, SINK1]) :-
	type(CLEANINGSOLUTION1, cleaningsolution), type(FAUCET1, faucet), type(SINK1, sink).
complete_task(wash_sink, P) :-
	type(CLEANINGSOLUTION1, cleaningsolution), type(FAUCET1, faucet), type(SINK1, sink),
	transform([close([CLEANINGSOLUTION1]), holds([CLEANINGSOLUTION1]), sat_on([]), on_top_of([]), inside([]), on([FAUCET1]), laid_on([]), used([]), eaten([]), pour([CLEANINGSOLUTION1]), wash([SINK1])], P).

% Wash teeth
get_relevant(wash_teeth, [Toothbrush, Toothpaste, Faucet]) :-
    type(Toothbrush, toothbrush), type(Toothpaste, toothpaste), type(Faucet, faucet).
complete_task(wash_teeth, P) :-
    type(Toothbrush, toothbrush), type(Toothpaste, toothpaste), type(Faucet, faucet),
    transform([close([Faucet]), holds([Toothbrush, Toothpaste]), sat_on([]), on_top_of([]), inside([]), on([Faucet]), laid_on([]), used([Toothpaste, Toothbrush]), eaten([])], P).

% Watch TV
get_relevant(watch_tv, [REMOTECONTROL1, COUCH1, TELEVISION1]) :-
	type(REMOTECONTROL1, remotecontrol), type(COUCH1, couch), type(TELEVISION1, television).
complete_task(watch_tv, P) :-
	type(REMOTECONTROL1, remotecontrol), type(COUCH1, couch), type(TELEVISION1, television),
	transform([close([COUCH1]), holds([REMOTECONTROL1]), sat_on([COUCH1]), on_top_of([]), inside([]), on([TELEVISION1]), laid_on([]), used([]), eaten([]), watch([TELEVISION1])], P).

% Watch fly
get_relevant(watch_fly, [FLY1]) :-
	type(FLY1, fly).
complete_task(watch_fly, P) :-
	type(FLY1, fly),
	transform([close([FLY1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Watch movie
get_relevant(watch_movie, [REMOTECONTROL1, COUCH1, TELEVISION1]) :-
	type(REMOTECONTROL1, remotecontrol), type(COUCH1, couch), type(TELEVISION1, television).
complete_task(watch_movie, P) :-
	type(REMOTECONTROL1, remotecontrol), type(COUCH1, couch), type(TELEVISION1, television),
	transform([close([COUCH1]), holds([REMOTECONTROL1]), sat_on([COUCH1]), on_top_of([]), inside([]), on([TELEVISION1]), laid_on([]), used([]), eaten([]), watch([TELEVISION1])], P).

% Watch youtube
get_relevant(watch_youtube, [CELLPHONE1]) :-
	type(CELLPHONE1, cellphone).
complete_task(watch_youtube, P) :-
	type(CELLPHONE1, cellphone),
	transform([close([]), holds([CELLPHONE1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

% Wave at people walking by through window
get_relevant(wave_at_people_walking_by_through_window, [MAN1, WOMAN1, CURTAIN1]) :-
	type(MAN1, man), type(WOMAN1, woman), type(CURTAIN1, curtain).
complete_task(wave_at_people_walking_by_through_window, P) :-
	type(MAN1, man), type(WOMAN1, woman), type(CURTAIN1, curtain),
	transform([close([CURTAIN1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([CURTAIN1]), crawl([CURTAIN1]), greet([MAN1, woMAN1]), jump([character1])], P).

% Whine
get_relevant(whine, [WOMAN1, FOODDONUT1]) :-
	type(WOMAN1, woman), type(FOODDONUT1, fooddonut).
complete_task(whine, P) :-
	type(WOMAN1, woman), type(FOODDONUT1, fooddonut),
	transform([close([WOMAN1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), greet([WOMAN1]), talk([WOMAN1])], P).

% Wipe down counter
get_relevant(wipe_down_counter, [KITCHENCOUNTER1, RAG1, FAUCET1, SINK1]) :-
	type(KITCHENCOUNTER1, kitchencounter), type(RAG1, rag), type(FAUCET1, faucet), type(SINK1, sink).
complete_task(wipe_down_counter, P) :-
	type(KITCHENCOUNTER1, kitchencounter), type(RAG1, rag), type(FAUCET1, faucet), type(SINK1, sink),
	transform([close([KITCHENCOUNTER1, RAG1, SINK1]), holds([RAG1]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), off([FAUCET1]), rinse([RAG1]), squeeze([RAG1]), wipe([KITCHENCOUNTER1])], P).

% Wipe feet
get_relevant(wipe_feet, [SHOES1, FEETBOTH1, CARPET1]) :-
	type(SHOES1, shoes), type(FEETBOTH1, feetboth), type(CARPET1, carpet).
complete_task(wipe_feet, P) :-
	type(SHOES1, shoes), type(FEETBOTH1, feetboth), type(CARPET1, carpet),
	transform([close([SHOES1, CARPET1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), wipe([FEETBOTH1])], P).

% Wipe off shoes
get_relevant(wipe_off_shoes, [MAT1, SHOES1]) :-
	type(MAT1, mat), type(SHOES1, shoes).
complete_task(wipe_off_shoes, P) :-
	type(MAT1, mat), type(SHOES1, shoes),
	transform([close([MAT1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), wipe([SHOES1])], P).

% Work
get_relevant(work, [KEYBOARD1, CHAIR1, MOUSE1, COMPUTER1]) :-
	type(KEYBOARD1, keyboard), type(CHAIR1, chair), type(MOUSE1, mouse), type(COMPUTER1, computer).
complete_task(work, P) :-
	type(KEYBOARD1, keyboard), type(CHAIR1, chair), type(MOUSE1, mouse), type(COMPUTER1, computer),
	transform([close([CHAIR1]), holds([KEYBOARD1, MOUSE1]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([COMPUTER1]), laid_on([]), used([]), eaten([])], P).

% Workout
get_relevant(workout, [TELEVISION1, LEGSBOTH1, ARMSBOTH1]) :-
	type(TELEVISION1, television), type(LEGSBOTH1, legsboth), type(ARMSBOTH1, armsboth).
complete_task(workout, P) :-
	type(TELEVISION1, television), type(LEGSBOTH1, legsboth), type(ARMSBOTH1, armsboth),
	transform([close([TELEVISION1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([TELEVISION1]), laid_on([]), used([]), eaten([]), jump([character1]), stretch([LEGSBOTH1, ARMSBOTH1])], P).

% Write  school paper
get_relevant(write__school_paper, [COMPUTER1]) :-
	type(COMPUTER1, computer).
complete_task(write__school_paper, P) :-
	type(COMPUTER1, computer),
	transform([close([COMPUTER1]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), off([COMPUTER1])], P).

% Write an email
get_relevant(write_an_email, [KEYBOARD1, CHAIR1, MOUSE1, COMPUTER1]) :-
	type(KEYBOARD1, keyboard), type(CHAIR1, chair), type(MOUSE1, mouse), type(COMPUTER1, computer).
complete_task(write_an_email, P) :-
	type(KEYBOARD1, keyboard), type(CHAIR1, chair), type(MOUSE1, mouse), type(COMPUTER1, computer),
	transform([close([COMPUTER1]), holds([KEYBOARD1, MOUSE1]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), type([KEYBOARD1])], P).

% Write book
get_relevant(write_book, [NOTEPAD1, PEN1, CHAIR1]) :-
	type(NOTEPAD1, notepad), type(PEN1, pen), type(CHAIR1, chair).
complete_task(write_book, P) :-
	type(NOTEPAD1, notepad), type(PEN1, pen), type(CHAIR1, chair),
	transform([close([CHAIR1]), holds([NOTEPAD1, PEN1]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), open([NOTEPAD1]), write([NOTEPAD1])], P).

% Write in your diary
get_relevant(write_in_your_diary, [PEN1, SOFA1, DIARY1]) :-
	type(PEN1, pen), type(SOFA1, sofa), type(DIARY1, diary).
complete_task(write_in_your_diary, P) :-
	type(PEN1, pen), type(SOFA1, sofa), type(DIARY1, diary),
	transform([close([DIARY1]), holds([PEN1, DIARY1]), sat_on([SOFA1]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), open([DIARY1]), write([DIARY1])], P).

% Write letter
get_relevant(write_letter, [PEN1, ADDRESSBOOK1, ENVELOPE1, STAMP1, CHAIR1, PAPER1, DESK1]) :-
	type(PEN1, pen), type(ADDRESSBOOK1, addressbook), type(ENVELOPE1, envelope), type(STAMP1, stamp), type(CHAIR1, chair), type(PAPER1, paper), type(DESK1, desk).
complete_task(write_letter, P) :-
	type(PEN1, pen), type(ADDRESSBOOK1, addressbook), type(ENVELOPE1, envelope), type(STAMP1, stamp), type(CHAIR1, chair), type(PAPER1, paper), type(DESK1, desk),
	transform([close([CHAIR1]), holds([]), sat_on([CHAIR1]), on_top_of([[ADDRESSBOOK1, DESK1], [ENVELOPE1, DESK1], [STAMP1, ENVELOPE1], [PAPER1, ENVELOPE1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), fold([PAPER1]), open([DESK1]), write([ENVELOPE1, PAPER1])], P).

% Write research paper
get_relevant(write_research_paper, [KEYBOARD1, CHAIR1, LAPTOP1, TEXTBOOK1, NOTES1, DESK1]) :-
	type(KEYBOARD1, keyboard), type(CHAIR1, chair), type(LAPTOP1, laptop), type(TEXTBOOK1, textbook), type(NOTES1, notes), type(DESK1, desk).
complete_task(write_research_paper, P) :-
	type(KEYBOARD1, keyboard), type(CHAIR1, chair), type(LAPTOP1, laptop), type(TEXTBOOK1, textbook), type(NOTES1, notes), type(DESK1, desk),
	transform([close([DESK1]), holds([]), sat_on([CHAIR1]), on_top_of([[TEXTBOOK1, DESK1], [NOTES1, DESK1]]), inside([]), on([LAPTOP1]), laid_on([]), used([]), eaten([]), read([TEXTBOOK1, NOTES1]), type([KEYBOARD1])], P).

% Write story
get_relevant(write_story, [LAPTOP1, KEYBOARD1, CHAIR1]) :-
	type(LAPTOP1, laptop), type(KEYBOARD1, keyboard), type(CHAIR1, chair).
complete_task(write_story, P) :-
	type(LAPTOP1, laptop), type(KEYBOARD1, keyboard), type(CHAIR1, chair),
	transform([close([CHAIR1]), holds([]), sat_on([CHAIR1]), on_top_of([]), inside([]), on([LAPTOP1]), laid_on([]), used([]), eaten([]), pull([LAPTOP1]), type([KEYBOARD1])], P).

% Write thank you notes
get_relevant(write_thank_you_notes, [PEN1, ADDRESSBOOK1, ENVELOPE1, CHAIR1, PAPER1, DESK1]) :-
	type(PEN1, pen), type(ADDRESSBOOK1, addressbook), type(ENVELOPE1, envelope), type(CHAIR1, chair), type(PAPER1, paper), type(DESK1, desk).
complete_task(write_thank_you_notes, P) :-
	type(PEN1, pen), type(ADDRESSBOOK1, addressbook), type(ENVELOPE1, envelope), type(CHAIR1, chair), type(PAPER1, paper), type(DESK1, desk),
	transform([close([CHAIR1]), holds([]), sat_on([CHAIR1]), on_top_of([[ENVELOPE1, DESK1], [PAPER1, ENVELOPE1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), closed([ENVELOPE1]), fold([PAPER1]), open([DESK1]), write([ENVELOPE1, PAPER1])], P).

% Yoga
get_relevant(yoga, [CLOTHESSHIRT1, ARMSBOTH1, CLOSET1, MAT1, CLOTHESPANTS1, FLOOR1]) :-
	type(CLOTHESSHIRT1, clothesshirt), type(ARMSBOTH1, armsboth), type(CLOSET1, closet), type(MAT1, mat), type(CLOTHESPANTS1, clothespants), type(FLOOR1, floor).
complete_task(yoga, P) :-
	type(CLOTHESSHIRT1, clothesshirt), type(ARMSBOTH1, armsboth), type(CLOSET1, closet), type(MAT1, mat), type(CLOTHESPANTS1, clothespants), type(FLOOR1, floor),
	transform([close([CLOSET1]), holds([]), sat_on([]), on_top_of([[CLOTHESSHIRT1, FLOOR1], [CLOTHESPANTS1, FLOOR1]]), inside([]), on([]), laid_on([MAT1]), used([]), eaten([]), closed([CLOSET1]), puton([CLOTHESSHIRT1, CLOTHESPANTS1]), standup([character1]), stretch([ARMSBOTH1])], P).

% complete school work
get_relevant(complete_school_work, [CHAIR1, NOTEBOOK1, TEXTBOOK1, PENCIL1, NOTES1, DESK1]) :-
	type(CHAIR1, chair), type(NOTEBOOK1, notebook), type(TEXTBOOK1, textbook), type(PENCIL1, pencil), type(NOTES1, notes), type(DESK1, desk).
complete_task(complete_school_work, P) :-
	type(CHAIR1, chair), type(NOTEBOOK1, notebook), type(TEXTBOOK1, textbook), type(PENCIL1, pencil), type(NOTES1, notes), type(DESK1, desk),
	transform([close([CHAIR1]), holds([NOTEBOOK1, PENCIL1, NOTES1]), sat_on([CHAIR1]), on_top_of([[TEXTBOOK1, DESK1]]), inside([]), on([]), laid_on([]), used([]), eaten([]), open([DESK1]), read([TEXTBOOK1, NOTES1]), write([NOTEBOOK1])], P).

