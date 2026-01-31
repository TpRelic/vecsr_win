type(lightswitch175, lightswitch).
has_switch(lightswitch175).
type(book192, book).
grabbable(book192).
readable(book192).
type(sofa369, sofa).
sittable(sofa369).
lieable(sofa369).
on_list([lightswitch175]).
inside([[book192, bedroom74], [sofa369, livingroom336], [lightswitch175, bedroom74], [book192, bookshelf107]]).
ontopof([[pillow423, sofa369], [tv427, sofa369], [sofa369, rug418], [pillow422, sofa369], [book192, bookshelf107]]).
rooms(bedroom74).
rooms(livingroom336).
type(vacuum0, vacuum).
has_switch(vacuum0).
grabbable(vacuum0).
type(sheets01, sheets).
grabbable(sheets01).
type(pillowcase011, pillowcase).
type(pillowcase012, pillowcase).
grabbable(pillowcase011).
grabbable(pillowcase012).
type(sheets02, sheets).
grabbable(sheets02).
type(pillowcase021, pillowcase).
type(pillowcase022, pillowcase).
grabbable(pillowcase021).
grabbable(pillowcase022).
dirty([plate195, wineglass199]).
dish(X) :- type(X, plate).
dish(X) :- type(X, wineglass).
dish(X) :- type(X, mug).
dish(X) :- type(X, dishbowl).
dirty_in_sink(Sink, List) :- dirty(Dishes), dirty_in_sink(Sink, Dishes, [], List).
dirty_in_sink(Sink, [], List, List).
dirty_in_sink(Sink, [Dish|T], PrevList, List) :- dish(Dish), dirty_in_sink(Sink, T, [[Dish, Sink]|PrevList], List).
dirty_in_sink(Sink, [_|T], PrevList, List) :- dirty_in_sink(Sink, T, PrevList, List).
needs_cooking(X) :- food(X), not eatable(X), not dish(X).
eatable(X) :- fruit(X).
eatable(X) :- vegetable(X).
fruit(X) :- type(X, bananas).
vegetable(X) :- type(X, bellpepper).
eatable(X) :- type(X, chips).
eatable(X) :- type(X, crackers).
can_cook(X) :- type(X, stove).
can_cook(X) :- type(X, toaster).
breakfast(X) :- type(X, breadslice).
easy_cooking(Toaster, Bread) :- type(Toaster, toaster), type(Bread, breadslice).
type(shoe3203, shoe).
grabbable(shoe3203).
type(shoe3204, shoe).
grabbable(shoe3204).
type(coat3205, coat).
grabbable(coat3205).
type(icedcoffee3217, icedcoffee).
type(envelope3218, envelope).
grabbable(envelope3218).
type(mailbox3219, mailbox).
extra_inside([[vacuum0, bedroom74], [sheets01, bedroom74], [pillowcase011, bedroom74], [pillowcase012, bedroom74], [sheets02, livingroom336], [pillowcase021, livingroom336], [pillowcase022, livingroom336], [shoe3203, bedroom74], [shoe3204, bedroom74], [coat3205, bedroom74], [envelope3218, bedroom74]]).
extra_ontopof([[vacuum, floor75], [sheets01, bed111], [pillowcase011, bed111], [pillowcase012, bed111], [sheets02, coffeetable372], [pillowcase021, coffeetable372], [pillowcase022, coffeetable372], [shoe3203, floor75], [shoe3204, floor75], [coat3205, closetdrawer122], [envelope3218, desk110]]).
member(X, [X|_]).
member(X, [Y|T]) :- member(X, T).
not_member(_, []).
not_member(X, [Y|T]) :- X\=Y, not_member(X, T).
-list_empty([_|_]).
not_hands_full([]).
not_hands_full([_]).
subset([], _).
subset([X|T], List) :- member(X, List), subset(T, List).
remove(X, List, NewList) :- remove(X, List, [], NewList).
remove(_, [], NewList, NewList).
remove(X, [X|T], List, NewList) :- remove(X, T, List, NewList).
remove(X, [Y|T], List, NewList) :- X\=Y, remove(X, T, [Y|List], NewList).
append([], Y, Y).
append([X|L1], L2, [X|L3]) :- append(L1, L2, L3).
inside_same_room(Item1, Item2) :- Item1\=Item2, rooms(Room), inside(Inside), member([Item1, Room], Inside), member([Item2, Room], Inside).
inside_same_room(Item1, Item2) :- Item1\=Item2, rooms(Room), inside(Inside1), extra_inside(Inside2), append(Inside1, Inside2, Inside), member([Item1, Room], Inside), member([Item2, Room], Inside).
-rooms(X) :- not rooms(X).
ontopof_inherited(ItemBelow, ItemOntop, OntopofList) :- member([ItemOntop, ItemBelow], OntopofList).
ontopof_inherited(ItemBelow, ItemOntop, OntopofList) :- member([ItemOntop, ItemInBetween], OntopofList), ontopof_inherited(ItemBelow, ItemInBetween, OntopofList).
ontopof_inherited(ItemBelow, ItemOntop, OntopofList) :- member([ItemInBetween, ItemBelow], OntopofList), ontopof_inherited(ItemInBetween, ItemOntop, OntopofList).
close_state(close([character1|Close])) :- close_character(Close).
close_state(close([])).
held_state(holds(Held)) :- holds_character(Held).
held_state(holds([])).
sitting_state(sat_on(Sat)) :- sitting_character(Sat).
sitting_state(sat_on([])).
ontopof_state(on_top_of(OnTopOf)) :- ontopof(OnTopOf1), extra_ontopof(OnTopOf2), append(OnTopOf1, OnTopOf2, OnTopOf).
ontopof_state(on_top_of(OnTopOf)) :- ontopof(OnTopOf).
ontopof_state(on_top_of(OnTopOf)) :- extra_ontopof(OnTopOf).
ontopof_state(on_top_of([])).
inside_state(inside(Inside)) :- inside(Inside1), extra_inside(Inside2), append(Inside1, Inside2, Inside).
inside_state(inside(Inside)) :- inside(Inside).
inside_state(inside(Inside)) :- extra_inside(Inside).
inside_state(inside([])).
on_state(on(On)) :- on_list(On).
on_state(on([])).
initial_state([Close, Held, Sat, OnTopOf, Inside, On, laid_on([]), used([]), eaten([])|_]) :- close_state(Close), held_state(Held), sitting_state(Sat), ontopof_state(OnTopOf), inside_state(Inside), on_state(On).
state_subset([close(CloseFinal), holds(HoldsFinal), sat_on(SatFinal), on_top_of(OtoFinal), inside(InsideFinal), on(OnFinal), laid_on(LaidFinal), used(UsedFinal), eaten(EatenFinal)|_], [close(Close), holds(Holds), sat_on(Sat), on_top_of(Oto), inside(Inside), on(On), laid_on(Laid), used(Used), eaten(Eaten)|_]) :- subset(CloseFinal, Close), subset(HoldsFinal, Holds), subset(SatFinal, Sat), subset(OtoFinal, Oto), subset(InsideFinal, Inside), subset(OnFinal, On), subset(LaidFinal, Laid), subset(UsedFinal, Used), subset(EatenFinal, Eaten).
transform(FinalState, Plan) :- initial_state(State1), transform(State1, FinalState, [State1], Plan, 0).
transform(State1, FinalState, _, [], _) :- state_subset(FinalState, State1).
transform(_, _, _, _, 30).
transform(State1, State2, Visited, [Action|Actions], StepCount) :- choose_action(Action, State1, State2), update(Action, State1, State), not_member(State, Visited), SC#=StepCount+1, transform(State, State2, [State|Visited], Actions, SC).
choose_action(Action, State1, State2) :- suggest(Action, State1, State2), legal_action(Action, State1).
choose_action(Action, State1, _) :- legal_action(Action, State1).
suggest(open(X), [close(Close), _, _, _, _, _, _, _, _, opened(OpenedI)|_], [_, _, _, _, _, _, _, _, _, opened(OpenedF)|_]) :- member(X, OpenedF), not_member(X, OpenedI), member(X, Close).
suggest(grab(X), [close(Close), holds(Holds), _, on_top_of(OtoI), _, _, _, _, _|_], [_, _, _, on_top_of(OtoN), _, _, _, _, _|_]) :- member([X, Y], OtoN), not_member([X, Y], OtoI), member(X, Close), not_member(X, Holds).
suggest(put(X, Y), [close(Close), holds(Held), _, on_top_of(OtoI), _, _, _, _, _|_], [_, _, _, on_top_of(OtoN), _, _, _, _, _|_]) :- member([X, Y], OtoN), not_member([X, Y], OtoI), member(Y, Close), member(X, Held).
suggest(walk(X), [_, _, _, _, _, on(OnI), _, _, _|_], [_, _, _, _, _, on(OnF), _, _, _|_]) :- not_member(X, OnI), member(X, OnF).
suggest(switchon(X), _, [_, _, _, _, _, on(On), _, _, _|_]) :- member(X, On).
suggest(walk(Y), [_, holds(Held), _, _, _, _, _, _, _|_], [_, _, _, on_top_of(Oto), _, _, _, _, _|_]) :- member([X, Y], Oto), member(X, Held).
suggest(put(X, Y), _, [_, _, _, on_top_of(Oto), _, _, _, _, _|_]) :- member([X, Y], Oto).
suggest(put(X, Y), [close(CloseI), holds(Held), _, on_top_of(Oto), _, _, _, _, _|_], [close(CloseF), _, sat_on(Sat), _, _, _, _, _, _|_]) :- type(Y, floor), member(X, Sat), member(X, Held), member(Z, CloseI), member(Z, CloseF), ontopof_inherited(Y, Z, Oto).
suggest(walk(X), [_, holds(Held), _, on_top_of(OtoI), _, _, _, _, _|_], [_, _, _, on_top_of(OtoF), _, _, _, _, _|_]) :- not_hands_full(Held), member([X, Y], OtoF), not_member([X, Y], OtoI), Held\=[_, _].suggest(grab(X), _, [_, holds(Held), _, _, _, _, _, _, _|_]) :- member(X, Held).
suggest(lie(X), _, [_, _, _, _, _, _, laid_on(Lie), _, _|_]) :- member(X, Lie).
suggest(walk(X), [_, holds(HeldI), _, _, _, _, _, _, _|_], [close(Close), holds(HeldF), _, _, _, _, _, _, _|_]) :- not_hands_full(HeldI), member(X, HeldF), not_member(X, Close).
suggest(walk(X), _, [close(Close), _, _, _, _, _, laid_on(Laid), _, _|_]) :- member(X, Laid), not_member(X, Close).
suggest(walk(X), _, [close(Close), _, sat_on(Sat), _, _, _, _, _, _|_]) :- member(X, Sat), not_member(X, Close).
suggest(grab(X), [close(CloseI), _, _, _, _, _, _, _, _|_], [close(CloseF), _, sat_on(Sat), _, _, _, _, _, _|_]) :- not_member(Y, CloseI), member(Y, CloseF), member(X, Sat), -list_empty(CloseF).
suggest(walk(X), [_, holds(Held), _, _, _, _, _, _, _|_], [close(Close), _, sat_on(Sat), _, _, _, _, _, _|_]) :- member(X, Close), sittable(Y), X\=Y, member(Y, Sat), member(Y, Held).
suggest(sit(X), _, [_, _, sat_on(Sat), _, _, _, _, _, _|_]) :- member(X, Sat).
suggest(walk(Room), [close(Close), holds(Holds), sat_on(Sat), on_top_of(Oto), inside(Inside), on(On), laid_on(Laid), used(Used), eaten(Eaten)|_], State2) :- item_of_interest([close(Close), holds(Holds), sat_on(Sat), on_top_of(Oto), inside(Inside), on(On), laid_on(Laid), used(Used), eaten(Eaten)|_], State2, Item), state_inside([close(Close), holds(Holds), sat_on(Sat), on_top_of(Oto), inside(Inside), on(On), laid_on(Laid), used(Used), eaten(Eaten)|_], Item, Room), not_member([character1, Room], Inside).
suggest(walk(X), _, [close(Close), _, _, _, _, _, _, _, _|_]) :- member(X, Close).
suggest(walk(X), [_, _, _, _, _, _, _, used(UseI), _|_], [_, _, _, _, _, _, _, used(UseF), _|_]) :- member(X, UseF), not_member(X, UseI).
suggest(use(X), _, [_, _, _, _, _, _, _, used(Use), _|_]) :- member(X, Use).
suggest(eat(X), _, [_, _, _, _, _, _, _, _, eaten(Eaten)|_]) :- member(X, Eaten).
suggest(walk(X), [_, _, _, _, _, _, _, _, eaten(EatenI)|_], [_, _, _, _, _, _, _, _, eaten(EatenF)|_]) :- member(X, EatenF), not_member(X, EatenI).
suggest(standup, [_, _, sat_on([_]), _, _, _, _, _, _|_], _).
suggest(standup, [_, _, _, _, _, _, laid_on([_]), _, _|_], _).
state_inside([_, _, _, _, inside(Inside), _, _, _, _|_], Item, Room) :- member([Item, Room], Inside).
item_of_interest([_, holds(HeldI), _, _, _, _, _, _, _|_], [_, holds(HeldF), _, _, _, _, _, _, _|_], Item) :- member(Item, HeldF), not_member(Item, HeldI).
item_of_interest([_, _, sat_on(SatI), _, _, _, _, _, _|_], [_, _, sat_on(SatF), _, _, _, _, _, _|_], Item) :- member(Item, SatF), not_member(Item, SatI).
item_of_interest([_, _, _, on_top_of(OtoI), _, _, _, _, _|_], [_, _, _, on_top_of(OtoF), _, _, _, _, _|_], Item) :- member([Item, _], OtoF), not_member([Item, _], OtoI).
item_of_interest([_, holds(HeldI), _, on_top_of(OtoI), _, _, _, _, _|_], [_, _, _, on_top_of(OtoF), _, _, _, _, _|_], Item) :- member([HeldItem, Item], OtoF), not_member(HeldItem, HeldI), not_member([HeldItem, Item], OtoI).
item_of_interest([_, _, _, _, _, on(OnI), _, _, _|_], [_, _, _, _, _, on(OnF), _, _, _|_], Item) :- member(Item, OnF), not_member(Item, OnI).
item_of_interest([_, _, _, _, _, _, laid_on(LaidI), _, _|_], [_, _, _, _, _, _, laid_on(LaidF), _, _|_], Item) :- member(Item, LaidF), not_member(Item, LaidI).
item_of_interest([_, _, _, _, _, _, _, used(UsedI), _|_], [_, _, _, _, _, _, _, used(UsedF), _|_], Item) :- member(Item, UsedF), not_member(Item, UsedI).
item_of_interest([_, _, _, _, _, _, _, _, eaten(EatenI)|_], [_, _, _, _, _, _, _, _, eaten(EatenF)|_], Item) :- member(Item, EatenF), not_member(Item, EatenI).
item_of_interest([close(CloseI), _, _, _, _, _, _, _, _|_], [close(CloseF), _, _, _, _, _, _, _, _|_], Item) :- member(Item, CloseF), not_member(Item, CloseI).
legal_action(walk(X), [_, _, sat_on([]), _, inside(Inside), _, _, _, _|_]) :- rooms(X), not_member([character1, X], Inside).
legal_action(walk(X), [close(Close), _, sat_on([]), _, inside(Inside), _, _, _, _|_]) :- type(X, Y), -rooms(X), Y\=character, member([X, Room], Inside), member([character1, Room], Inside), not_member(X, Close).
legal_action(grab(X), [close(Close), holds([]), _, _, inside(Inside), _, _, _, _|_]) :- type(X, Y), Y\=character, member(X, Close).
legal_action(grab(X), [close(Close), holds([HeldItem]), _, _, inside(Inside), _, _, _, _|_]) :- type(X, Y), Y\=character, member(X, Close), X\=HeldItem.legal_action(sit(X), [close(Close), holds(Held), sat_on([]), _, inside(Inside), _, _, _, _|_]) :- sittable(X), member(X, Close), not_member(X, Held).
legal_action(lie(X), [close(Close), holds(Held), _, _, inside(Inside), _, laid_on([]), _, _|_]) :- lieable(X), member(X, Close), not_member(X, Held).
legal_action(standup, [_, _, sat_on([_]), _, _, _, _, _, _|_]).
legal_action(standup, [_, _, _, _, _, _, laid_on([_]), _, _|_]).
legal_action(put(X, Y), [close(Close), holds(Held), _, on_top_of(Oto), inside(Inside), _, _, _, _|_]) :- member(Y, Close), member(X, Held), not_member([X, Y], Oto).
legal_action(put(X, Y), [close(Close), holds(Held), _, on_top_of(Oto), inside(Inside), _, _, _, _|_]) :- type(Y, floor), ontopof_inherited(Y, Z, Oto), member(Z, Close), member(X, Held), not_member([X, Y], Oto).
legal_action(switchon(X), [close(Close), _, _, _, inside(Inside), on(On), _, _, _|_]) :- member(X, Close), not_member(X, On), has_switch(X).
legal_action(use(X), [close(Close), _, _, _, _, _, _, used(Used), _|_]) :- member(X, Close), not_member(X, Used).
legal_action(eat(X), [close(Close), _, _, _, _, _, _, _, eaten(Eaten)|_]) :- member(X, Close), not_member(X, Eaten), notgrabbable(X), eatable(X).
legal_action(eat(X), [_, holds(Held), _, _, _, _, _, _, eaten(Eaten)|_]) :- member(X, Held), not_member(X, Eaten), eatable(X).
legal_action(eat(X), [close(Close), _, _, on_top_of(Oto), _, on(On), _, _, eaten(Eaten)|_]) :- member(X, Close), not_member(X, Eaten), can_cook(Heat), ontopof_inherited(Heat, X, Oto), member(Heat, On).
update(walk(X), [close(Close), holds(Held), sat_on(Sat), on_top_of(Oto), inside(In), on(On), laid_on(Laid), used(Used), eaten(Eaten)|_], [close(Closen), holds(Held), sat_on(Sat), on_top_of(Oto), inside(Inf), on(On), laid_on(Laid), used(Used), eaten(Eaten)|_]) :- update_walking(X, [Close, Held, Oto], [], Closen), update_room(X, In, [], Inf).
update(grab(X), [close(Close), holds(Held), sat_on(Sat), on_top_of(Oto), inside(In), on(On), laid_on(Laid), used(Used), eaten(Eaten)|_], [close(Close), holds([X|Held]), sat_on(Sat), on_top_of(OtoN), inside(In), on(On), laid_on(Laid), used(Used), eaten(Eaten)|_]) :- update_grabbing(X, Oto, [], OtoN).
update(sit(X), [close(Close), holds(Held), sat_on(Sat), on_top_of(Oto), inside(In), on(On), laid_on(Laid), used(Used), eaten(Eaten)|_], [close(Close), holds(Held), sat_on([X|Sat]), on_top_of(Oto), inside(In), on(On), laid_on(Laid), used(Used), eaten(Eaten)|_]).
update(lie(X), [close(Close), holds(Held), sat_on(Sat), on_top_of(Oto), inside(In), on(On), laid_on(Laid), used(Used), eaten(Eaten)|_], [close(Close), holds(Held), sat_on(Sat), on_top_of(Oto), inside(In), on(On), laid_on([X|Laid]), used(Used), eaten(Eaten)|_]).
update(standup, [close(Close), holds(Held), sat_on([X]), on_top_of(Oto), inside(In), on(On), laid_on(Laid), used(Used), eaten(Eaten)|_], [close(Close), holds(Held), sat_on([]), on_top_of(Oto), inside(In), on(On), laid_on(Laid), used(Used), eaten(Eaten)|_]).
update(standup, [close(Close), holds(Held), sat_on(Sat), on_top_of(Oto), inside(In), on(On), laid_on([X]), used(Used), eaten(Eaten)|_], [close(Close), holds(Held), sat_on(Sat), on_top_of(Oto), inside(In), on(On), laid_on([]), used(Used), eaten(Eaten)|_]).
update(put(X, Y), [close(Close), holds(Held), sat_on(Sat), on_top_of(Oto), inside(In), on(On), laid_on(Laid), used(Used), eaten(Eaten)|_], [close(Close), holds(Heldn), sat_on(Sat), on_top_of([[X, Y]|Oto]), inside(In), on(On), laid_on(Laid), used(Used), eaten(Eaten)|_]) :- remove(X, Held, Heldn).
update(switchon(X), [close(Close), holds(Held), sat_on(Sat), on_top_of(Oto), inside(In), on(On), laid_on(Laid), used(Used), eaten(Eaten)|_], [close(Close), holds(Held), sat_on(Sat), on_top_of(Oto), inside(In), on([X|On]), laid_on(Laid), used(Used), eaten(Eaten)|_]).
update(use(X), [close(Close), holds(Held), sat_on(Sat), on_top_of(Oto), inside(In), on(On), laid_on(Laid), used(Used), eaten(Eaten)|_], [close(Close), holds(Held), sat_on(Sat), on_top_of(Oto), inside(In), on(On), laid_on(Laid), used([X|Used]), eaten(Eaten)|_]).
update(eat(X), [close(Close), holds(Held), sat_on(Sat), on_top_of(Oto), inside(In), on(On), laid_on(Laid), used(Used), eaten(Eaten)|_], [close(Close), holds(Held), sat_on(Sat), on_top_of(Oto), inside(In), on(On), laid_on(Laid), used(Used), eaten([X|Eaten])|_]).
update(_, X, X).
update_walking(X, [[], _, _], State1, [X|State1]).
update_walking(X, [[Y|T], Held, Oto], State, State1) :- X\=Y, not_member(Y, Held), not_member([X, Y], Oto), not_member([Y, X], Oto), update_walking(X, [T, Held, Oto], State, State1).
update_walking(X, [[Y|T], Held, Oto], State, State1) :- update_walking(X, [T, Held, Oto], [Y|State], State1).
update_room(X, In, [], In) :- -rooms(X).
update_room(X, [], In1, [[character1, X]|In1]).
update_room(X, [[character1, Room]|T], State, State1) :- X\=Room, update_room(X, T, State, State1).
update_room(X, [[Item, Whatever]|T], State, State1) :- update_room(X, T, [[Item, Whatever]|State], State1).
update_grabbing(X, [], On, On).
update_grabbing(X, [[Y, Surface]|T], On, OnN) :- X\=Y, update_grabbing(X, T, [[Y, Surface]|On], OnN).
update_grabbing(X, [[X, Surface]|T], On, OnN) :- update_grabbing(X, T, On, OnN).
complete_task(grab_remote, P) :- type(Remote, remotecontrol), transform([close([]), holds([Remote]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).
complete_task(grab_remote_and_clothes, P) :- type(Remote, remotecontrol), type(Clothes, clothesshirt), transform([close([]), holds([Remote, Clothes]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).
complete_task(use_phone_on_couch, P) :- type(Cell, cellphone), type(Sofa, sofa), transform([close([]), holds([Cell]), sat_on([Sofa]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).
complete_task(set_remote_on_coffee_table, P) :- type(Remote, remotecontrol), type(Ct, coffeetable), transform([close([]), holds([]), sat_on([]), on_top_of([[Remote, Ct]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).
complete_task(turn_on_tv, P) :- type(Tv, tv), transform([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([Tv]), laid_on([]), used([]), eaten([])], P).
complete_task(go_to_sleep, P) :- type(Bed, bed), transform([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([Bed]), used([]), eaten([])], P).
complete_task(browse_internet, P) :- type(Computer, computer), type(Chair, chair), type(Cpuscreen, cpuscreen), inside_same_room(Computer, Chair), transform([close([Cpuscreen]), holds([]), sat_on([Chair]), on_top_of([]), inside([]), on([Computer]), laid_on([]), used([]), eaten([])], P).
complete_task(wash_teeth, P) :- type(Toothbrush, toothbrush), type(Toothpaste, toothpaste), type(Faucet, faucet), transform([close([Faucet]), holds([Toothbrush, Toothpaste]), sat_on([]), on_top_of([]), inside([]), on([Faucet]), laid_on([]), used([Toothpaste, Toothbrush]), eaten([])], P).
complete_task(brush_teeth, P) :- type(Toothbrush, toothbrush), type(Toothpaste, toothpaste), type(Faucet, faucet), transform([close([Faucet]), holds([Toothbrush, Toothpaste]), sat_on([]), on_top_of([]), inside([]), on([Faucet]), laid_on([]), used([Toothpaste, Toothbrush]), eaten([])], P).
complete_task(vacuum, P) :- type(Vacuum, vacuum), transform([close([]), holds([Vacuum]), sat_on([]), on_top_of([]), inside([]), on([Vacuum]), laid_on([]), used([Vacuum]), eaten([])], P).
complete_task(change_sheets_and_pillow_cases, P) :- type(Bed, bed), type(Pillow1, pillow), type(Pillow2, pillow), Pillow1\=Pillow2, inside_same_room(Pillow1, Bed), inside_same_room(Pillow2, Bed), type(Pillowcase1, pillowcase), type(Pillowcase2, pillowcase), Pillowcase1\=Pillowcase2, inside_same_room(Pillowcase1, Pillow1), inside_same_room(Pillowcase2, Pillow2), type(Sheets, sheets), inside_same_room(Sheets, Bed), type(ReplacementPillowcase1, pillowcase), type(ReplacementPillowcase2, pillowcase), type(ReplacementSheets, sheets), ReplacementPillowcase1\=Pillowcase1, ReplacementPillowcase1\=Pillowcase2, ReplacementPillowcase2\=Pillowcase1, ReplacementPillowcase2\=Pillowcase2, ReplacementSheets\=Sheets, type(Clothespile, clothespile), transform([close([]), holds([]), sat_on([]), on_top_of([[Pillowcase1, Clothespile], [Pillowcase2, Clothespile], [Sheets, Clothespile], [ReplacementPillowcase1, Pillow1], [ReplacementPillowcase2, Pillow2], [ReplacementSheets, Bed]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).
complete_task(wash_dirty_dishes, P) :- type(Sink, sink), inside(Inside), member([Sink, Kitchen], Inside), dirty_in_sink(Sink, Dishes), type(Faucet, faucet), member([Faucet, Kitchen], Inside), transform([close([]), holds([]), sat_on([]), on_top_of(Dishes), inside([]), on([Faucet]), laid_on([]), used([Sink]), eaten([])], P).
complete_task(feed_me, P) :- needs_cooking(Food), vegetable(Veggie), type(Pan, fryingpan), type(Stove, stove), transform([close([]), holds([]), sat_on([]), on_top_of([[Food, Pan], [Veggie, Pan], [Pan, Stove]]), inside([]), on([Stove]), laid_on([]), used([]), eaten([Food])], P).
complete_task(breakfast, P) :- breakfast(Food), easy_cooking(Heatsource, Food), transform([close([]), holds([]), sat_on([]), on_top_of([[Food, Heatsource]]), inside([]), on([Heatsource]), laid_on([]), used([]), eaten([Food])], P).
complete_task(read, P) :- readable(Reading), sittable(Comfy), type(Comfy, sofa), type(Light, lightswitch), transform([close([]), holds([Reading]), sat_on([Comfy]), on_top_of([]), inside([]), on([Light]), laid_on([]), used([Reading]), eaten([])], P).
complete_task(watch_tv, P) :- sittable(Comfy), type(Comfy, sofa), type(Tv, tv), transform([close([]), holds([]), sat_on([Comfy]), on_top_of([]), inside([]), on([Tv]), laid_on([]), used([]), eaten([])], P).
complete_task(read_book, P) :- type(Book, book), readable(Book), sittable(Comfy), type(Comfy, sofa), type(Light, lightswitch), transform([close([]), holds([Book]), sat_on([Comfy]), on_top_of([]), inside([]), on([Light]), laid_on([]), used([Book]), eaten([])], P).
complete_task(relax_on_sofa, P) :- type(Comfy, sofa), transform([close([]), holds([]), sat_on([Comfy]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).
complete_task(listen_to_music, P) :- type(Radio, radio), transform([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([Radio]), laid_on([]), used([]), eaten([])], P).
complete_task(tabletop_game, P) :- type(Table, kitchentable), type(Game, tabletopgame), transform([close([]), holds([]), sat_on([]), on_top_of([[Game, Table]]), inside([]), on([]), laid_on([]), used([Game]), eaten([])], P).
complete_task(pee, P) :- type(Toilet, toilet), transform([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([Toilet]), eaten([])], P).
complete_task(go_to_bathroom, P) :- type(Toilet, toilet), transform([close([]), holds([]), sat_on([Toilet]), on_top_of([]), inside([]), on([]), laid_on([]), used([Toilet]), eaten([])], P).
complete_task(have_snack, P) :- type(Change, change), type(Dresser, dresser), transform([close([]), holds([Change]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).
complete_task(put_shoes_and_coat, P) :- type(Shoe1, shoe), type(Shoe2, shoe), Shoe1\=Shoe2, type(Coat, coat), transform([close([]), holds([]), sat_on([]), on_top_of([[Shoe1, character1], [Shoe2, character1], [Coat, character1]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).
complete_task(hair, P) :- type(HairProduct, hairproduct), type(Comb, comb), transform([close([]), holds([Comb, HairProduct]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([Comb, HairProduct]), eaten([])], P).
complete_task(put_out_flowers, P) :- type(Flowers, flowers), type(Vase, vase), type(Table, kitchentable), transform([close([]), holds([]), sat_on([]), on_top_of([[Vase, Table], [Flowers, Vase]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).
complete_task(put_down_bags, P) :- type(Bag1, bag), type(Bag2, bag), Bag1\=Bag2, type(Table, kitchentable), transform([close([]), holds([]), sat_on([]), on_top_of([[Bag1, Table], [Bag2, Table]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).
complete_task(dry_yourself_off, P) :- type(Towel, towel), transform([close([]), holds([Towel]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([Towel]), eaten([])], P).
complete_task(curled_hair, P) :- type(HairProduct, hairproduct), type(CurlingIron, curlingiron), transform([close([]), holds([CurlingIron, HairProduct]), sat_on([]), on_top_of([]), inside([]), on([CurlingIron]), laid_on([]), used([CurlingIron, HairProduct]), eaten([])], P).
complete_task(place_centerpiece, P) :- type(Centerpiece, centerpiece), type(Table, kitchentable), transform([close([]), holds([]), sat_on([]), on_top_of([[Centerpiece, Table]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).
complete_task(facial, P) :- type(Facecream, facecream), transform([close([]), holds([Facecream]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([Facecream]), eaten([])], P).
complete_task(practice_violin, P) :- type(Violin, violin), transform([close([]), holds([Violin]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([Violin]), eaten([])], P).
complete_task(wipe_room_with_lysol, P) :- type(Lysol, lysol), type(Towel, towel), type(Counter, bathroomcounter), transform([close([Counter]), holds([Lysol, Towel]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([Lysol, Towel]), eaten([])], P).
complete_task(replace_toothpaste, P) :- type(Oldtoothpaste, toothpaste), type(Newtoothpaste, toothpaste), new(Newtoothpaste), Oldtoothpaste\=Newtoothpaste, type(Trash, garbagecan), type(Counter, bathroomcounter), transform([close([]), holds([]), sat_on([]), on_top_of([[Oldtoothpaste, Trash], [Newtoothpaste, Counter]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).
complete_task(hang_up_jacket, P) :- type(Coat, coat), type(Hanger, hanger), transform([close([]), holds([]), sat_on([]), on_top_of([[Coat, Hanger]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).
complete_task(shampoo_hair, P) :- type(Shampoo, shampoo), type(Tub, bathtub), transform([close([]), holds([Shampoo]), sat_on([Tub]), on_top_of([]), inside([]), on([]), laid_on([]), used([Shampoo]), eaten([])], P).
complete_task(read_them_bedtime_story, P) :- readable(Book), type(Bed, bed), transform([close([]), holds([Book]), sat_on([Bed]), on_top_of([]), inside([]), on([]), laid_on([]), used([Book]), eaten([])], P).
complete_task(sit_quietly, P) :- type(Comfy, sofa), transform([close([]), holds([]), sat_on([Comfy]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).
complete_task(work, P) :- type(Computer, computer), type(Chair, chair), type(Cpuscreen, cpuscreen), inside_same_room(Computer, Chair), transform([close([Cpuscreen]), holds([]), sat_on([Chair]), on_top_of([]), inside([]), on([Computer]), laid_on([]), used([]), eaten([])], P).
complete_task(use_laptop, P) :- type(Computer, computer), type(Chair, chair), type(Cpuscreen, cpuscreen), inside_same_room(Computer, Chair), transform([close([Cpuscreen]), holds([]), sat_on([Chair]), on_top_of([]), inside([]), on([Computer]), laid_on([]), used([]), eaten([])], P).
complete_task(check_email, P) :- type(Computer, computer), type(Chair, chair), type(Cpuscreen, cpuscreen), inside_same_room(Computer, Chair), transform([close([Cpuscreen]), holds([]), sat_on([Chair]), on_top_of([]), inside([]), on([Computer]), laid_on([]), used([]), eaten([])], P).
complete_task(print_out_document, P) :- type(Computer, computer), type(Chair, chair), type(Cpuscreen, cpuscreen), inside_same_room(Computer, Chair), transform([close([Cpuscreen]), holds([]), sat_on([Chair]), on_top_of([]), inside([]), on([Computer]), laid_on([]), used([]), eaten([])], P).
complete_task(type_up_document, P) :- type(Computer, computer), type(Chair, chair), type(Cpuscreen, cpuscreen), inside_same_room(Computer, Chair), transform([close([Cpuscreen]), holds([]), sat_on([Chair]), on_top_of([]), inside([]), on([Computer]), laid_on([]), used([]), eaten([])], P).
complete_task(watch_youtube, P) :- type(Computer, computer), type(Chair, chair), type(Cpuscreen, cpuscreen), inside_same_room(Computer, Chair), transform([close([Cpuscreen]), holds([]), sat_on([Chair]), on_top_of([]), inside([]), on([Computer]), laid_on([]), used([]), eaten([])], P).
complete_task(do_homework, P) :- type(Computer, computer), type(Chair, chair), type(Cpuscreen, cpuscreen), inside_same_room(Computer, Chair), transform([close([Cpuscreen]), holds([]), sat_on([Chair]), on_top_of([]), inside([]), on([Computer]), laid_on([]), used([]), eaten([])], P).
complete_task(shop, P) :- type(Computer, computer), type(Chair, chair), type(Cpuscreen, cpuscreen), inside_same_room(Computer, Chair), transform([close([Cpuscreen]), holds([]), sat_on([Chair]), on_top_of([]), inside([]), on([Computer]), laid_on([]), used([]), eaten([])], P).
complete_task(change_curtains, P) :- type(OldCurtains, curtains), type(Window, window), extra_ontopof(Ontopof), member([OldCurtains, Window], Ontopof), type(NewCurtains, curtains), OldCurtains\=NewCurtains, type(Closet, closet), transform([close([]), holds([]), sat_on([]), on_top_of([[OldCurtains, Closet], [NewCurtains, Window]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).
complete_task(eat_family_meals, P) :- needs_cooking(Food), vegetable(Veggie), type(Pan, fryingpan), type(Stove, stove), transform([close([]), holds([]), sat_on([]), on_top_of([[Food, Pan], [Veggie, Pan], [Pan, Stove]]), inside([]), on([Stove]), laid_on([]), used([]), eaten([Food])], P).
complete_task(use_bathroom, P) :- type(Toilet, toilet), transform([close([]), holds([]), sat_on([Toilet]), on_top_of([]), inside([]), on([]), laid_on([]), used([Toilet]), eaten([])], P).
complete_task(do_dishes, P) :- type(Sink, sink), inside(Inside), member([Sink, Kitchen], Inside), dirty_in_sink(Sink, Dishes), type(Faucet, faucet), member([Faucet, Kitchen], Inside), transform([close([]), holds([]), sat_on([]), on_top_of(Dishes), inside([]), on([Faucet]), laid_on([]), used([Sink]), eaten([])], P).
complete_task(eat_family_meals, P) :- needs_cooking(Food), vegetable(Veggie), type(Pan, fryingpan), type(Stove, stove), transform([close([]), holds([]), sat_on([]), on_top_of([[Food, Pan], [Veggie, Pan], [Pan, Stove]]), inside([]), on([Stove]), laid_on([]), used([]), eaten([Food])], P).
complete_task(change_bedding, P) :- type(Bed, bed), type(Pillow1, pillow), type(Pillow2, pillow), Pillow1\=Pillow2, inside_same_room(Pillow1, Bed), inside_same_room(Pillow2, Bed), type(Pillowcase1, pillowcase), type(Pillowcase2, pillowcase), Pillowcase1\=Pillowcase2, inside_same_room(Pillowcase1, Pillow1), inside_same_room(Pillowcase2, Pillow2), type(Sheets, sheets), inside_same_room(Sheets, Bed), type(ReplacementPillowcase1, pillowcase), type(ReplacementPillowcase2, pillowcase), type(ReplacementSheets, sheets), ReplacementPillowcase1\=Pillowcase1, ReplacementPillowcase1\=Pillowcase2, ReplacementPillowcase2\=Pillowcase1, ReplacementPillowcase2\=Pillowcase2, ReplacementSheets\=Sheets, type(Clothespile, clothespile), transform([close([]), holds([]), sat_on([]), on_top_of([[Pillowcase1, Clothespile], [Pillowcase2, Clothespile], [Sheets, Clothespile], [ReplacementPillowcase1, Pillow1], [ReplacementPillowcase2, Pillow2], [ReplacementSheets, Bed]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).
complete_task(toast_bread, P) :- breakfast(Food), easy_cooking(Heatsource, Food), transform([close([]), holds([]), sat_on([]), on_top_of([[Food, Heatsource]]), inside([]), on([Heatsource]), laid_on([]), used([]), eaten([])], P).
complete_task(drink_iced_coffee, P) :- type(Mug, mug), type(IcedCoffee, icedcoffee), extra_inside(Inside), member([IcedCoffee, Mug], Inside), transform([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([Mug])], P).
complete_task(get_in_way_of_guests_trying_to_leave, P) :- transform([close([character2]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).
complete_task(prepare_letter_for_mailing, P) :- type(Paper, paper), type(Envelope, envelope), type(Mailbox, mailbox), transform([close([]), holds([]), sat_on([]), on_top_of([[Paper, Envelope], [Envelope, Mailbox]]), inside([]), on([]), laid_on([]), used([]), eaten([])], P).

?- complete_task(read, P).