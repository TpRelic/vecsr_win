% General Rules
time(0).
:- held(X, T), held(Y, T), held(Z, T), X \= Y, X \= Z, Y \= Z.
-rooms(X) :- not rooms(X).
open(X, T) :- not closed(X, T).
closed(X, T) :- not open(X, T).
open(X, _) :- rooms(X).
off(X, T) :- not on(X, T).
on(X, T) :- not off(X, T).

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
