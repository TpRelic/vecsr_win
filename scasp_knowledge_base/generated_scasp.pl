time(1).
time(2).
time(3).
time(4).
time(5).
time(6).
time(7).
time(8).
time(9).
time(10).
time(11).
time(12).
time(13).
time(14).
time(15).
time(16).
time(17).
time(18).
type(character1, character).
characters(character1).
inside(character1, kitchen1, 0).
inside(character1, kitchen1, 1).
close(character1, homeoffice1, 1).
inside(character1, kitchen1, 2).
close(character1, desk1, 2).
inside(character1, kitchen1, 3).
close(character1, desk1, 3).
sitting(character1, 4).
inside(character1, kitchen1, 4).
close(character1, desk1, 4).
sitting(character1, 5).
inside(character1, kitchen1, 5).
close(character1, desk1, 5).
sitting(character1, 6).
inside(character1, kitchen1, 6).
close(character1, desk1, 6).
sitting(character1, 7).
inside(character1, kitchen1, 7).
close(character1, desk1, 7).
sitting(character1, 8).
inside(character1, kitchen1, 8).
close(character1, desk1, 8).
sitting(character1, 9).
inside(character1, kitchen1, 9).
close(character1, desk1, 9).
sitting(character1, 10).
inside(character1, kitchen1, 10).
close(character1, desk1, 10).
sitting(character1, 11).
inside(character1, kitchen1, 11).
close(character1, desk1, 11).
sitting(character1, 12).
inside(character1, kitchen1, 12).
close(character1, desk1, 12).
sitting(character1, 13).
inside(character1, kitchen1, 13).
close(character1, desk1, 13).
sitting(character1, 14).
inside(character1, kitchen1, 14).
close(character1, desk1, 14).
sitting(character1, 15).
inside(character1, kitchen1, 15).
close(character1, desk1, 15).
sitting(character1, 16).
inside(character1, kitchen1, 16).
close(character1, desk1, 16).
sitting(character1, 17).
inside(character1, kitchen1, 17).
close(character1, desk1, 17).
sitting(character1, 18).
inside(character1, kitchen1, 18).
close(character1, desk1, 18).
type(chair1, chair).
grabbable(chair1).
sittable(chair1).
movable(chair1).
surfaces(chair1).
furniture(chair1).
sat_on(chair1, 4).
sat_on(chair1, 5).
sat_on(chair1, 6).
sat_on(chair1, 7).
sat_on(chair1, 8).
sat_on(chair1, 9).
sat_on(chair1, 10).
sat_on(chair1, 11).
sat_on(chair1, 12).
sat_on(chair1, 13).
sat_on(chair1, 14).
sat_on(chair1, 15).
sat_on(chair1, 16).
sat_on(chair1, 17).
sat_on(chair1, 18).
type(desk1, desk).
can_open(desk1).
movable(desk1).
surfaces(desk1).
furniture(desk1).
type(homeoffice1, homeoffice).
type(mouse1, mouse).
grabbable(mouse1).
movable(mouse1).
has_plug(mouse1).
electronics(mouse1).
held(mouse1, 8).
held(mouse1, 9).
held(mouse1, 10).
held(mouse1, 11).
held(mouse1, 12).
held(mouse1, 13).
held(mouse1, 14).
held(mouse1, 15).
held(mouse1, 16).
held(mouse1, 17).
held(mouse1, 18).
type(keyboard1, keyboard).
grabbable(keyboard1).
movable(keyboard1).
has_plug(keyboard1).
electronics(keyboard1).
type(mail1, mail).
held(mail1, 14).
held(mail1, 15).
held(mail1, 16).
held(mail1, 17).
held(mail1, 18).
type(computer1, computer).
has_switch(computer1).
electronics(computer1).
lookable(computer1).
% General Rules
time(0).
:- held(X, T), held(Y, T), held(Z, T), X \= Y, X \= Z, Y \= Z.
-rooms(X) :- not rooms(X).
#abducible open.
#abducible closed.
#abducible off.
#abducible on.
open(X, _) :- rooms(X).

reachable(X, T) :- not -reachable(X, T).
-reachable(X, T) :- inside(X, Obj1, T), closed(Obj1, T).
%inherited_inside(X, Y, T) :- inside(X, Y, T).
%inherited_inside(X, Y, T) :- inside(X, Z, T), inherited_inside(Z, Y, T).

close(X, Y, T) :- close(Y, X, T).
close(character1, X, T) :- held(X, T).
has_free_hand(T) :- not holding_two_items(T).
holding_two_items(T) :- held(X, T), held(Y, T), X \= Y.

needs_cooking(X) :- food(X), not eatable(X), not dish(X).
eatable(X) :- fruit(X).
eatable(X) :- vegetable(X).
fruit(X) :- type(X, bananas).
vegetable(X) :- type(X, bellpepper).
eatable(X) :- type(X, chips).
eatable(X) :- type(X, crackers).

exists(X) :- type(X, _).

%% Execute with --no_nmr
action_possible(Action, Item, T) :-
    time(T),
    action(Action),
    action_valid(Action, Item,T).
%    not other_action(Action, Item, T).
%other_action(Action, Item, T) :-
%    time(T),
%    action(Action),
%    action(B),
%    Action \= B,
%    Item \= Item2,
%    action_done(B, Item2, T).

action_valid(walk,X,T) :- X \= character1, rooms(X), not inside(character1, X, T), not action_invalid(walk, X, T).
action_valid(walk,X,T) :- X \= character1, -rooms(X), not sitting(character1, T), not held(X, T), reachable(X, T),
                        not close(character1, X, T),
                        inside(character1, Room, T), inside(X, Room, T),
                        not action_invalid(walk, X, T).
action_valid(grab,X,T) :- grabbable(X), close(character1, X, T), reachable(X, T), has_free_hand(T), not action_invalid(grab, X, T).
action_valid(put,X,T) :- held(_, T), close(character1, X, T), not action_invalid(put, X, T).
action_valid(find, X, T) :- not action_invalid(find, X, T).
action_valid(drink, X, T) :- recipient(X), drinkable(Y), inside(Y, X, T), close(character1, X, T), not action_invalid(drink, X, T).
action_valid(eat, X, T) :- recipient(Y), eatable(X), inside(X, Y, T), close(character1, X, T), not action_invalid(eat, X, T).
action_valid(eat, X, T) :- recipient(Y), eatable(X), ontopof(X, Y, T), close(character1, X, T), not action_invalid(eat, X, T).
action_valid(switch_on, X, T) :- has_switch(X), off(X, T), close(character1, X, T), not action_invalid(switch_on, X, T).
action_valid(switch_off, X, T) :- has_switch(X), on(X, T), close(character1, X, T), not action_invalid(switch_off, X, T).
action_valid(use, X, T) :- has_switch(X), on(X, T), close(character1, X, T), not action_invalid(use, X, T).
action_valid(use, X, T) :- not has_switch(X), close(character1, X, T), not action_invalid(use, X, T).
action_valid(sit, X, T) :- not sitting(character1, T), not laying(character1, T), close(character1, X, T), sittable(X), not action_invalid(sit, X, T).
action_valid(lie, X, T) :- not sitting(character1, T), not laying(character1, T), close(character1, X, T), lieable(X), not action_invalid(lie, X, T).
action_valid(open, X, T) :- can_open(X), closed(X, T), close(character1, X, T), reachable(X, T), not action_invalid(open, X, T).
action_valid(close, X, T) :- can_open(X), open(X, T), close(character1, X, T), reachable(X, T), not action_invalid(close, X, T).
action_valid(move, X, T) :- movable(X), close(character1, X, T), reachable(X, T), not action_invalid(move, X, T).
action_valid(turn_to, X, T) :- reachable(X, T), not action_invalid(turn_to, X, T).
action_valid(point, X, T) :- not action_invalid(point, X, T).


action_invalid(find, X, T) :- T2 .<. T, action_done(walk, X, T2).
action_invalid(find, X, T) :- T2 .<. T, action_done(grab, X, T2).
action_invalid(find, X, T) :- T2 .<. T, action_done(put, X, T2).
action_invalid(find, X, T) :- T2 .<. T, action_done(drink, X, T2).
action_invalid(find, X, T) :- T2 .<. T, action_done(eat, X, T2).
action_invalid(find, X, T) :- T2 .<. T, action_done(switch_on, X, T2).
action_invalid(find, X, T) :- T2 .<. T, action_done(switch_off, X, T2).
action_invalid(find, X, T) :- T2 .<. T, action_done(use, X, T2).
action_invalid(find, X, T) :- T2 .<. T, action_done(sit, X, T2).
action_invalid(find, X, T) :- T2 .<. T, action_done(lie, X, T2).
action_invalid(find, X, T) :- T2 .<. T, action_done(open, X, T2).
action_invalid(find, X, T) :- T2 .<. T, action_done(close, X, T2).
action_invalid(_, X, _) :- not exists(X).

action(walk).
action(grab).
action(put).
action(find).
action(drink).
action(eat).
action(switch_on).
action(switch_off).
action(use).
action(sit).
action(lie).
action(open).
action(close).
action(move).
action(turn_to).
action(point).

#show action_done/3, not action_valid/3.


?- action_possible(walk,homeoffice1,0).