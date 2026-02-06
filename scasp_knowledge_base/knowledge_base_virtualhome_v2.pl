% Extra "facts" about objects that exist in the dataset but not the simulation
% This is required because the VirtualHome simulation does not include everything
% needed to complete every task in their database. As an example, although the
% task "Vacuum" exists in the database, there is not object "vacuum" in the
% simulation. Therefore we add state facts for those objects to
% demonstrate the s(CASP) harness' ability on randomly selected tasks from the
% database rather than on carefully selected tasks which are fully embodied in
% the simulation

% For the task: "Vacuum"
type(vacuum0, vacuum).
has_switch(vacuum0).
grabbable(vacuum0).
has_plug(vacuum0).
movable(vacuum0).
% For the task: "Change Sheets and Pillows
type(sheets01, sheets).
grabbable(sheets01).
movable(sheets01).
type(pillowcase011, pillowcase).
type(pillowcase012, pillowcase).
grabbable(pillowcase011).
grabbable(pillowcase012).

type(sheets02, sheets).
grabbable(sheets02).
movable(sheets02).
type(pillowcase021, pillowcase).
type(pillowcase022, pillowcase).
grabbable(pillowcase021).
grabbable(pillowcase022).

% For the task: "Wash Dirty Dishes"
dirty([plate195, wineglass199]).
dish(X) :- type(X, plate).
dish(X) :- type(X, wineglass).
dish(X) :- type(X, mug).
dish(X) :- type(X, dishbowl).
dirty_in_sink(Sink, List) :- dirty(Dishes), dirty_in_sink(Sink, Dishes, [], List).
dirty_in_sink(Sink, [], List, List).
dirty_in_sink(Sink, [Dish | T], PrevList, List) :- dish(Dish), dirty_in_sink(Sink, T, [[Dish, Sink] | PrevList], List).
dirty_in_sink(Sink, [_ | T], PrevList, List) :- dirty_in_sink(Sink, T, PrevList, List).

% For the task "Feed Me"
needs_cooking(X) :- food(X), not eatable(X), not dish(X).
eatable(X) :- fruit(X).
eatable(X) :- vegetable(X).
fruit(X) :- type(X, bananas).
vegetable(X) :- type(X, bellpepper).
eatable(X) :- type(X, chips).
eatable(X) :- type(X, crackers).
can_cook(X) :- type(X, stove).

% For the task "Breakfast"
can_cook(X) :- type(X, toaster).
breakfast(X) :- type(X, breadslice).
easy_cooking(Toaster, Bread) :- type(Toaster, toaster), type(Bread, breadslice).

%% Unseen Data: Commented out so it doesn't clog up the knowledge base
%% For the task "Tabletop Game"
%type(tabletopgame3200, tabletopgame).
%grabbable(tabletopgame3200).
%movable(tabletopgame3200).
%
%% For the task "Pick up spare change on dresser"
%type(dresser3201, dresser).
%surfaces(dresser3201).
%movable(dresser3201).
%type(change3202, change).
%grabbable(change3202).
%
% For the task "Put shoes and coats"
type(shoe3203, shoe).
clothes(shoe3203).
grabbable(shoe3203).
movable(shoe3203).
type(shoe3204, shoe).
clothes(shoe3204).
grabbable(shoe3204).
movable(shoe3204).
type(coat3205, coat).
clothes(coat3205).
grabbable(coat3205).
movable(coat3205).
%
%% For the task "Hair"
%type(comb3206, comb).
%grabbable(comb3206).
%movable(comb3206).
%
%% For the task "Cutting"
%type(cuttingboard3207, cuttingboard).
%grabbable(cuttingboard3207).
%movable(cuttingboard3207).
%
%% For the task "Put out flowers"
%type(flowers3208, flowers).
%grabbable(flowers3208).
%movable(flowers3208).
%type(vase3209, vase).
%grabbable(vase3209).
%movable(vase3209).
%surface(vase3209).
%
%% For the task "Put down bags"
%type(bag3210, bag).
%grabbable(bag3210).
%movable(bag3210).
%type(bag3211, bag).
%grabbable(bag3211).
%movable(bag3211).
%
%% holds_character([bag3210, bag3211]).
%
%% For the task "Curled hair"
%type(curlingiron3212, curlingiron).
%grabbable(curlingiron3212).
%movable(curlingiron3212).
%has_switch(curlingiron3212).
%
%% For the task "Place centerpiece"
%type(centerpiece3213, centerpiece).
%grabbable(centerpiece3213).
%movable(centerpiece3213).
%
%% For the task "Practice Violin"
%type(violin3214, violin).
%grabbable(violin3214).
%movable(violin3214).
%
%% For the task "Wipe room down with lysol"
%type(lysol3215, lysol).
%grabbable(lysol3215).
%movable(lysol3215).
%
%% For the task "Replace toothpaste"
%type(toothpaste1163, toothpaste).
%closed(toothpaste1163).
%grabbable(toothpaste1163).
%pourable(toothpaste1163).
%can_open(toothpaste1163).
%movable(toothpaste1163).
%cream(toothpaste1163).
%new(toothpaste1163).
%
%% For the task "Shampoo hair"
%type(shampoo3216, shampoo).
%grabbable(shampoo3216).
%pourable(shampoo3216).
%can_open(shampoo3216).
%movable(shampoo3216).

% For the task "Drink Iced Coffee"
type(icedcoffee3217, icedcoffee).
drinkable(icedcoffee3217).
pourable(icedcoffee3217).

% For the task "Prepare letter for mailing"
type(envelope3218, envelope).
recipient(envelope3218).
grabbable(envelope3218).
movable(envelope3218).
type(mailbox3219, mailbox).
recipient(mailbox3219).

% Inside and ontopof for added predicates
extra_inside([[vacuum0, bedroom74],
[sheets01, bedroom74], [pillowcase011, bedroom74], [pillowcase012, bedroom74], [sheets02, livingroom336], [pillowcase021, livingroom336], [pillowcase022, livingroom336],
%[tabletopgame3200, livingroom336],
%[dresser3201, bedroom74], [change3202, bedroom74],
[shoe3203, bedroom74], [shoe3204, bedroom74], [coat3205, bedroom74],
%[comb3206, bathroom11],
%[cuttingboard3207, kitchen207],
%[vase3209, kitchen207], [flowers3208, kitchen207],
%[bag3210, kitchen207], [bag3211, kitchen207],
%[curlingiron3212, bathroom11],
%[centerpiece3213, kitchen207],
%[violin3214, bedroom74],
%[lysol3215, bathroom11],
%[toothpaste1163, bedroom74],
%[shampoo3216, bathroom11],
%[icedcoffee3217, mug196],
[envelope3218, bedroom74]
]).

extra_ontopof([[vacuum, floor75],
[sheets01, bed111], [pillowcase011, bed111], [pillowcase012, bed111], [sheets02, coffeetable372], [pillowcase021, coffeetable372], [pillowcase022, coffeetable372],
%[tabletopgame3200, bookshelf371],
%[change3202, dresser3201], [dresser3201, floor75],
[shoe3203, floor75], [shoe3204, floor75], [coat3205, closetdrawer122],
%[comb3206, bathroomcounter50],
%[cuttingboard3207, kitchencounter238],
%[vase3209, kitchencounter238], [flowers3208, kitchencounter238],
%[curlingiron3212, bathroomcounter50],
%[centerpiece3213, kitchencounter238],
%[violin3214, coffeetable113]
%[lysol3215, bathroomcounter50],
%[toothpaste1163, coffeetable113],
%[curtains187, window92],
%[shampoo3216, bathroomcounter50],
[envelope3218, desk110]
]).

% Constraints
% Abducibles
movable(X) :- grabbable(X), not -movable(X).

% Helper functions
member(X,[X|_]).
member(X,[Y|T]) :- member(X,T).

not_member(_, []).
not_member(X, [Y | T]) :- X \= Y, not_member(X, T).

list_empty([]).
-list_empty([_|_]).

hands_full([_,_]).
not_hands_full([]).
not_hands_full([_]).

subset([], _).
subset([X | T], List) :- member(X, List), subset(T, List).

remove(X, List, NewList) :- remove(X, List, [], NewList).
remove(_, [], NewList, NewList).
remove(X, [X | T], List, NewList) :- remove(X, T, List, NewList).
remove(X, [Y | T], List, NewList) :- X \= Y, remove(X, T, [Y | List], NewList).

append([ ], Y, Y).
append([X|L1],L2,[X|L3]) :- append(L1,L2,L3).

rev(L, R) :- trev(L, [], R). % O(n) time
trev([], P, P).
trev([H|T], P, R) :- trev(T, [H|P], R).

inside_same_room(Item1, Item2) :- Item1 \= Item2, rooms(Room), inside(Inside), member([Item1, Room], Inside),
    member([Item2, Room], Inside).
inside_same_room(Item1, Item2) :- Item1 \= Item2, rooms(Room), inside(Inside1), extra_inside(Inside2),
    append(Inside1, Inside2, Inside), member([Item1, Room], Inside), member([Item2, Room], Inside).
-rooms(X) :- not rooms(X).

% Test queries
% ontopof_inherited(X, computer176, [[computer176, desk110], [desk110, floor81]]).
ontopof_inherited(ItemBelow, ItemOntop, OntopofList) :- member([ItemOntop, ItemBelow], OntopofList).
ontopof_inherited(ItemBelow, ItemOntop, OntopofList) :- member([ItemOntop, ItemInBetween], OntopofList),
    ontopof_inherited(ItemBelow, ItemInBetween, OntopofList).
ontopof_inherited(ItemBelow, ItemOntop, OntopofList) :- member([ItemInBetween, ItemBelow], OntopofList),
    ontopof_inherited(ItemInBetween, ItemOntop, OntopofList).

% Planning
close_state(close([character1 | Close])) :- close_character(Close).
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

% Get the initial state
% STATEX
initial_state([Close, Held, Sat, OnTopOf, Inside, On, laid_on([]), used([]), eaten([]) | _]) :-
    close_state(Close), held_state(Held), sitting_state(Sat), ontopof_state(OnTopOf), inside_state(Inside), on_state(On).

% Check for final state accomplished
% STATEX
state_subset([close(CloseFinal), holds(HoldsFinal), sat_on(SatFinal), on_top_of(OtoFinal), inside(InsideFinal), on(OnFinal), laid_on(LaidFinal), used(UsedFinal), eaten(EatenFinal) | _],
             [close(Close), holds(Holds), sat_on(Sat), on_top_of(Oto), inside(Inside), on(On), laid_on(Laid), used(Used), eaten(Eaten) | _]) :-
                    subset(CloseFinal, Close), subset(HoldsFinal, Holds), subset(SatFinal, Sat),
                    subset(OtoFinal, Oto), subset(InsideFinal, Inside), subset(OnFinal, On),
                    subset(LaidFinal, Laid), subset(UsedFinal, Used), subset(EatenFinal, Eaten).

% We want to go from the current state to the final state
transform(FinalState, Plan) :- initial_state(State1), perturb(FinalState, PerturbedFinalState),
                               transform(State1, PerturbedFinalState, [State1], PerturbedPlan, 0),
                               unperturb_actions(FinalState, PerturbedPlan, Plan).
transform(State1, PerturbedFinalState,_,[], _) :- state_subset(PerturbedFinalState, State1).
transform(_, _, _, _, 30).
transform(State1, State2, Visited, [Action|Actions], StepCount) :-
    choose_action(Action, State1, State2),
    update(Action, State1, State),
    not_member(State, Visited),
    SC #= StepCount+1,
    transform(State, State2, [State|Visited], Actions, SC).

% We choose an action to take
% choose_action(action generated, current state, final state)
choose_action(Action, State1, State2) :- suggest(Action, State1, State2), legal_action(Action, State1).
% Dangerous: Allows illegal actions to be added to plan
%dangerxchoose_action(Action, State1, State2) :- suggest(Action, State1, State2).
choose_action(Action, State1, _) :- legal_action(Action, State1).

% Insert new suggestions here
%new_suggestrx

% Suggested actions in priority order
% STATEX
suggest(open(X), [close(Close), _, _, _, _, _, _, _, _, opened(OpenedI) | _],
                 [_, _, _, _, _, _, _, _, _, opened(OpenedF) | _])
                        :- member(X, OpenedF), not_member(X, OpenedI), member(X, Close).
suggest(grab(X), [close(Close), holds(Holds), _, on_top_of(OtoI), _, _, _, _, _ | _],
                 [_, _, _, on_top_of(OtoN), _, _, _, _, _ | _])
                        :- member([X, Y], OtoN), not_member([X, Y], OtoI), member(X, Close), not_member(X, Holds).
suggest(put(X,Y), [close(Close), holds(Held), _, on_top_of(OtoI), _, _, _, _, _ | _],
                  [_, _, _, on_top_of(OtoN), _, _, _, _, _ | _])
                        :- member([X, Y], OtoN), not_member([X, Y], OtoI), member(Y, Close), member(X, Held).
suggest(walk(X), [_, _, _, _, _, on(OnI), _, _, _ | _],
                 [_, _, _, _, _, on(OnF), _, _, _ | _])
                        :- not_member(X,OnI), member(X, OnF).
suggest(switchon(X), _,
                    [_, _, _, _, _, on(On), _, _, _ | _])
                        :- member(X, On).
suggest(walk(Y), [_, holds(Held), _, _, _, _, _, _, _ | _],
                 [_, _, _, on_top_of(Oto), _, _, _, _, _ | _])
                        :- member([X,Y], Oto), member(X, Held).
suggest(put(X, Y), _,
                  [_, _, _, on_top_of(Oto), _, _, _, _, _ | _])
                        :- member([X,Y], Oto).
suggest(put(X, Y), [close(CloseI), holds(Held), _, on_top_of(Oto), _, _, _, _, _ | _],
                   [close(CloseF), _, sat_on(Sat), _, _, _, _, _, _ | _])
                        :- type(Y, floor), member(X, Sat), member(X, Held), member(Z, CloseI), member(Z, CloseF),
                        ontopof_inherited(Y, Z, Oto).
suggest(walk(X), [_, holds(Held), _, on_top_of(OtoI), _, _, _, _, _ | _],
                 [_, _, _, on_top_of(OtoF), _, _, _, _, _ | _])
                        :- not_hands_full(Held), member([X, Y], OtoF), not_member([X, Y], OtoI), Held \= [_, _].
suggest(grab(X), _,
                [_, holds(Held), _, _, _, _, _, _, _ | _])
                        :- member(X, Held).
suggest(lie(X), _,
               [_, _, _, _, _, _, laid_on(Lie), _, _ | _])
                        :- member(X, Lie).
suggest(walk(X), [_, holds(HeldI), _, _, _, _, _, _, _ | _],
                 [close(Close), holds(HeldF), _, _, _, _, _, _, _ | _])
                        :- not_hands_full(HeldI), member(X, HeldF), not_member(X, Close).
suggest(walk(X), _,
                [close(Close), _, _, _, _, _, laid_on(Laid), _, _ | _])
                        :- member(X, Laid), not_member(X, Close).
suggest(walk(X), _,
                [close(Close), _, sat_on(Sat), _, _, _, _, _, _ | _])
                        :- member(X, Sat), not_member(X, Close).
suggest(grab(X), [close(CloseI), _, _, _, _, _, _, _, _ | _],
                 [close(CloseF), _, sat_on(Sat), _, _, _, _, _, _ | _])
                        :- not_member(Y, CloseI), member(Y, CloseF), member(X, Sat), -list_empty(CloseF).
suggest(walk(X), [_, holds(Held), _, _, _, _, _, _, _ | _],
                 [close(Close), _, sat_on(Sat), _, _, _, _, _, _ | _])
                        :- member(X, Close), sittable(Y), X\=Y, member(Y, Sat), member(Y, Held).
suggest(sit(X), _,
               [_, _, sat_on(Sat), _, _, _, _, _, _ | _])
                        :- member(X, Sat).
suggest(walk(Room), [close(Close), holds(Holds), sat_on(Sat), on_top_of(Oto), inside(Inside), on(On), laid_on(Laid), used(Used), eaten(Eaten) | _],
                    State2)
                        :- item_of_interest([close(Close), holds(Holds), sat_on(Sat), on_top_of(Oto), inside(Inside), on(On), laid_on(Laid), used(Used), eaten(Eaten) | _], State2, Item),
                        state_inside([close(Close), holds(Holds), sat_on(Sat), on_top_of(Oto), inside(Inside), on(On), laid_on(Laid), used(Used), eaten(Eaten) | _], Item, Room),
                        not_member([character1, Room], Inside).
suggest(walk(X), _,
                [close(Close), _, _, _, _, _, _, _, _ | _])
                        :- member(X, Close).
suggest(walk(X), [_, _, _, _, _, _, _, used(UseI), _ | _],
                 [_, _, _, _, _, _, _, used(UseF), _ | _])
                        :- member(X, UseF), not_member(X, UseI).
suggest(use(X), _,
                [_, _, _, _, _, _, _, used(Use), _ | _])
                        :- member(X, Use).
suggest(eat(X), _,
                [_, _, _, _, _, _, _, _, eaten(Eaten) | _])
                        :- member(X, Eaten).
suggest(walk(X), [_, _, _, _, _, _, _, _, eaten(EatenI) | _],
                 [_, _, _, _, _, _, _, _, eaten(EatenF) | _])
                        :- member(X, EatenF), not_member(X, EatenI).
suggest(standup, [_, _, sat_on([_]), _, _, _, _, _, _ | _],
                  _).
suggest(standup, [_, _, _, _, _, _, laid_on([_]), _, _ | _],
                  _).

% Test Queries
state_inside([_, _, _, _, inside(Inside), _, _, _, _ | _], Item, Room) :- member([Item, Room], Inside).

% Test Queries
item_of_interest([_, holds(HeldI), _, _, _, _, _, _, _ | _],
                [_, holds(HeldF), _, _, _, _, _, _, _ | _],
                Item) :- member(Item, HeldF), not_member(Item, HeldI).
item_of_interest([_, _, sat_on(SatI), _, _, _, _, _, _ | _],
                [_, _, sat_on(SatF), _, _, _, _, _, _ | _],
                Item) :- member(Item, SatF), not_member(Item, SatI).
item_of_interest([_, _, _, on_top_of(OtoI), _, _, _, _, _ | _],
                [_, _, _, on_top_of(OtoF), _, _, _, _, _ | _],
                Item) :- member([Item, _], OtoF), not_member([Item, _], OtoI).
item_of_interest([_, holds(HeldI), _, on_top_of(OtoI), _, _, _, _, _ | _],
                [_, _, _, on_top_of(OtoF), _, _, _, _, _ | _],
                Item) :- member([HeldItem, Item], OtoF), not_member(HeldItem, HeldI), not_member([HeldItem, Item], OtoI).
item_of_interest([_, _, _, _, _, on(OnI), _, _, _ | _],
                [_, _, _, _, _, on(OnF), _, _, _ | _],
                Item) :- member(Item, OnF), not_member(Item, OnI).
item_of_interest([_, _, _, _, _, _, laid_on(LaidI), _, _ | _],
                [_, _, _, _, _, _, laid_on(LaidF), _, _ | _],
                Item) :- member(Item, LaidF), not_member(Item, LaidI).
item_of_interest([_, _, _, _, _, _, _, used(UsedI), _ | _],
                [_, _, _, _, _, _, _, used(UsedF), _ | _],
                Item) :- member(Item, UsedF), not_member(Item, UsedI).
item_of_interest([_, _, _, _, _, _, _, _, eaten(EatenI) | _],
                [_, _, _, _, _, _, _, _, eaten(EatenF) | _],
                Item) :- member(Item, EatenF), not_member(Item, EatenI).
item_of_interest([close(CloseI), _, _, _, _, _, _, _, _ | _],
                [close(CloseF), _, _, _, _, _, _, _, _ | _],
                Item) :- member(Item, CloseF), not_member(Item, CloseI).

% Check if an action is legal given the state
% STATEX
legal_action(walk(X), [_, _, sat_on([]), _, inside(Inside), _, _, _, _ | _])
                :- rooms(X), not_member([character1, X], Inside).
legal_action(walk(X), [close(Close), _, sat_on([]), _, inside(Inside), _, _, _, _ | _])
                :- type(X, Y), -rooms(X), Y \= character, member([X, Room], Inside), member([character1, Room], Inside),
                not_member(X, Close).
legal_action(grab(X), [close(Close), holds([]), _, _, inside(Inside), _, _, _, _ | _])
                :- type(X, Y), Y \= character, member(X, Close).
legal_action(grab(X), [close(Close), holds([HeldItem]), _, _, inside(Inside), _, _, _, _ | _])
                :- type(X, Y), Y \= character, member(X, Close), X \= HeldItem.
legal_action(sit(X), [close(Close), holds(Held), sat_on([]), _, inside(Inside), _, _, _, _ | _])
                :- sittable(X), member(X, Close), not_member(X, Held).
legal_action(lie(X), [close(Close), holds(Held), _, _, inside(Inside), _, laid_on([]), _, _ | _])
                :- lieable(X), member(X, Close), not_member(X, Held).
legal_action(standup, [_, _, sat_on([_]), _, _, _, _, _, _ | _]).
legal_action(standup, [_, _, _, _, _, _, laid_on([_]), _, _ | _]).
legal_action(put(X,Y), [close(Close), holds(Held), _, on_top_of(Oto), inside(Inside), _, _, _, _ | _])
                :- member(Y, Close), member(X, Held), not_member([X,Y], Oto).
legal_action(put(X,Y), [close(Close), holds(Held), _, on_top_of(Oto), inside(Inside), _, _, _, _ | _])
                :- type(Y, floor), ontopof_inherited(Y, Z, Oto), member(Z, Close), member(X, Held), not_member([X,Y], Oto).
legal_action(switchon(X), [close(Close), _, _, _, inside(Inside), on(On), _, _, _ | _])
                :- member(X, Close), not_member(X, On), has_switch(X).
% We assume that something can only be used once for simplicity
legal_action(use(X), [close(Close), _, _, _, _, _, _, used(Used), _ | _])
                :- member(X, Close), not_member(X, Used).
legal_action(eat(X), [close(Close), _, _, _, _, _, _, _, eaten(Eaten) | _])
                :- member(X, Close), not_member(X, Eaten), not grabbable(X), eatable(X).
legal_action(eat(X), [_, holds(Held), _, _, _, _, _, _, eaten(Eaten) | _])
                :- member(X, Held), not_member(X, Eaten), eatable(X).
legal_action(eat(X), [close(Close), _, _, on_top_of(Oto), _, on(On), _, _, eaten(Eaten) | _])
                :- member(X, Close), not_member(X, Eaten), can_cook(Heat), ontopof_inherited(Heat, X, Oto), member(Heat, On).
legal_action(X, State) :- similar_action(X, Y), legal_action(Y, State).
legal_action(X, State) :- similar_action(Y, X), legal_action(Y, State).

% Insert new legal actions here:
%new_legal_actionrx

% Update state
% If we walk to something, anything we are not holding is no longer close
% STATEX
update(walk(X), [close(Close), holds(Held), sat_on(Sat), on_top_of(Oto), inside(In), on(On), laid_on(Laid), used(Used), eaten(Eaten) | _],
                [close(Closen), holds(Held), sat_on(Sat), on_top_of(Oto), inside(Inf), on(On), laid_on(Laid), used(Used), eaten(Eaten) | _]) :-
    update_walking(X, [Close, Held, Oto], [], Closen),
    update_room(X, In, [], Inf).
update(grab(X), [close(Close), holds(Held), sat_on(Sat), on_top_of(Oto), inside(In), on(On), laid_on(Laid), used(Used), eaten(Eaten) | _],
                [close(Close), holds([X | Held]), sat_on(Sat), on_top_of(OtoN), inside(In), on(On), laid_on(Laid), used(Used), eaten(Eaten) | _])
                    :- update_grabbing(X, Oto, [], OtoN).
update(sit(X), [close(Close), holds(Held), sat_on(Sat), on_top_of(Oto), inside(In), on(On), laid_on(Laid), used(Used), eaten(Eaten) | _],
               [close(Close), holds(Held), sat_on([X | Sat]), on_top_of(Oto), inside(In), on(On), laid_on(Laid), used(Used), eaten(Eaten) | _]).
update(lie(X), [close(Close), holds(Held), sat_on(Sat), on_top_of(Oto), inside(In), on(On), laid_on(Laid), used(Used), eaten(Eaten) | _],
               [close(Close), holds(Held), sat_on(Sat), on_top_of(Oto), inside(In), on(On), laid_on([X | Laid]), used(Used), eaten(Eaten) | _]).
update(standup, [close(Close), holds(Held), sat_on([X]), on_top_of(Oto), inside(In), on(On), laid_on(Laid), used(Used), eaten(Eaten) | _],
                [close(Close), holds(Held), sat_on([]), on_top_of(Oto), inside(In), on(On), laid_on(Laid), used(Used), eaten(Eaten) | _]).
update(standup, [close(Close), holds(Held), sat_on(Sat), on_top_of(Oto), inside(In), on(On), laid_on([X]), used(Used), eaten(Eaten) | _],
                [close(Close), holds(Held), sat_on(Sat), on_top_of(Oto), inside(In), on(On), laid_on([]), used(Used), eaten(Eaten) | _]).
update(put(X,Y), [close(Close), holds(Held), sat_on(Sat), on_top_of(Oto), inside(In), on(On), laid_on(Laid), used(Used), eaten(Eaten) | _],
                 [close(Close), holds(Heldn), sat_on(Sat), on_top_of([[X,Y] | Oto]), inside(In), on(On), laid_on(Laid), used(Used), eaten(Eaten) | _])
                    :- remove(X, Held, Heldn).
update(switchon(X), [close(Close), holds(Held), sat_on(Sat), on_top_of(Oto), inside(In), on(On), laid_on(Laid), used(Used), eaten(Eaten) | _],
                    [close(Close), holds(Held), sat_on(Sat), on_top_of(Oto), inside(In), on([X | On]), laid_on(Laid), used(Used), eaten(Eaten) | _]).
update(use(X), [close(Close), holds(Held), sat_on(Sat), on_top_of(Oto), inside(In), on(On), laid_on(Laid), used(Used), eaten(Eaten) | _],
               [close(Close), holds(Held), sat_on(Sat), on_top_of(Oto), inside(In), on(On), laid_on(Laid), used([X | Used]), eaten(Eaten) | _]).
update(eat(X), [close(Close), holds(Held), sat_on(Sat), on_top_of(Oto), inside(In), on(On), laid_on(Laid), used(Used), eaten(Eaten) | _],
               [close(Close), holds(Held), sat_on(Sat), on_top_of(Oto), inside(In), on(On), laid_on(Laid), used(Used), eaten([X | Eaten]) | _]).
%update(eat(X), [close(Close), holds(Held), sat_on(Sat), on_top_of(Oto), inside(In), on(On), laid_on(Laid), used(Used), eaten(Eaten)],
%               [close(CloseN), holds(HeldN), sat_on(Sat), on_top_of(OtoN), inside(InN), on(On), laid_on(Laid), used(Used), eaten([X | Eaten])]) :-
%    remove(X, Close, CloseN), remove(X, Held, HeldN), remove([X,_], Oto, OtoN), remove([X, _], In, InN).
update(_, X, X).


% Example test queries:
update_walking(X, [[], _, _], State1, [X | State1]).
update_walking(X, [[Y | T], Held, Oto], State, State1) :- X \= Y, not_member(Y, Held), not_member([X, Y], Oto), not_member([Y, X], Oto),
                                                                update_walking(X, [T, Held, Oto], State, State1).
update_walking(X, [[Y | T], Held, Oto], State, State1) :- update_walking(X, [T, Held, Oto], [Y | State], State1).

% Example test queries:
% update_room(plum445, [], [], In).
% update_room(bedroom74, [[character1, kitchen207], [plum445, kitchen207]], [], In).
update_room(X, In, [], In) :- -rooms(X).
update_room(X, [], In1, [[character1, X] | In1]).
update_room(X, [[character1, Room] | T], State, State1) :- X \= Room, update_room(X, T, State, State1).
update_room(X, [[Item, Whatever] | T], State, State1) :- update_room(X, T, [[Item, Whatever] | State], State1).

update_grabbing(X, [], On, On).
update_grabbing(X, [[Y, Surface] | T], On, OnN) :- X \= Y, update_grabbing(X, T, [[Y, Surface] | On], OnN).
update_grabbing(X, [[X, Surface] | T], On, OnN) :- update_grabbing(X, T, On, OnN).

