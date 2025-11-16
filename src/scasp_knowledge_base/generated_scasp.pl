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
type(bathroom11, bathroom).
rooms(bathroom11).
type(bedroom74, bedroom).
rooms(bedroom74).
type(kitchen207, kitchen).
rooms(kitchen207).
type(livingroom336, livingroom).
rooms(livingroom336).
type(character1, character).
characters(character1).
inside(character1, kitchen207, 0).
inside(character1, kitchen207, 1).
close(character1, paper303, 1).
inside(character1, kitchen207, 2).
close(character1, paper303, 2).
inside(character1, bedroom74, 3).
close(character1, paper303, 3).
inside(character1, bedroom74, 4).
close(character1, envelope3218, 4).
inside(character1, bedroom74, 5).
close(character1, envelope3218, 5).
inside(character1, bedroom74, 6).
close(character1, envelope3218, 6).
inside(character1, kitchen207, 7).
close(character1, envelope3218, 7).
inside(character1, bedroom74, 8).
close(character1, envelope3218, 8).
inside(character1, kitchen207, 9).
close(character1, envelope3218, 9).
inside(character1, kitchen207, 10).
close(character1, mailbox3219, 10).
inside(character1, kitchen207, 11).
close(character1, mailbox3219, 11).
type(paper303, paper).
grabbable(paper303).
movable(paper303).
props(paper303).
has_paper(paper303).
readable(paper303).
inside(paper303, kitchen207, 0).
ontopof(paper303, bookshelf250, 0).
inside(paper303, kitchen207, 1).
ontopof(paper303, bookshelf250, 1).
held(paper303, 2).
inside(paper303, kitchen207, 2).
held(paper303, 3).
inside(paper303, bedroom74, 3).
inside(paper303, character1, 3).
held(paper303, 4).
inside(paper303, bedroom74, 4).
inside(paper303, character1, 4).
close(paper303, envelope3218, 4).
close(paper303, character1, 4).
held(paper303, 5).
inside(paper303, bedroom74, 5).
inside(paper303, character1, 5).
close(paper303, envelope3218, 5).
close(paper303, character1, 5).
inside(paper303, bedroom74, 6).
inside(paper303, character1, 6).
ontopof(paper303, envelope3218, 6).
close(paper303, envelope3218, 6).
close(paper303, character1, 6).
inside(paper303, bedroom74, 7).
inside(paper303, character1, 7).
ontopof(paper303, envelope3218, 7).
close(paper303, envelope3218, 7).
close(paper303, character1, 7).
inside(paper303, bedroom74, 8).
inside(paper303, character1, 8).
ontopof(paper303, envelope3218, 8).
close(paper303, envelope3218, 8).
close(paper303, character1, 8).
inside(paper303, bedroom74, 9).
inside(paper303, character1, 9).
ontopof(paper303, envelope3218, 9).
close(paper303, envelope3218, 9).
close(paper303, character1, 9).
inside(paper303, bedroom74, 10).
inside(paper303, character1, 10).
ontopof(paper303, envelope3218, 10).
close(paper303, envelope3218, 10).
close(paper303, character1, 10).
inside(paper303, bedroom74, 11).
inside(paper303, character1, 11).
ontopof(paper303, envelope3218, 11).
close(paper303, envelope3218, 11).
close(paper303, character1, 11).
type(envelope3218, envelope).
grabbable(envelope3218).
movable(envelope3218).
recipient(envelope3218).
inside(envelope3218, bedroom74, 0).
inside(envelope3218, bedroom74, 1).
inside(envelope3218, bedroom74, 2).
inside(envelope3218, bedroom74, 3).
inside(envelope3218, bedroom74, 4).
held(envelope3218, 5).
inside(envelope3218, bedroom74, 5).
held(envelope3218, 6).
inside(envelope3218, bedroom74, 6).
held(envelope3218, 7).
inside(envelope3218, kitchen207, 7).
inside(envelope3218, character1, 7).
held(envelope3218, 8).
inside(envelope3218, bedroom74, 8).
inside(envelope3218, character1, 8).
held(envelope3218, 9).
inside(envelope3218, kitchen207, 9).
inside(envelope3218, character1, 9).
held(envelope3218, 10).
inside(envelope3218, kitchen207, 10).
inside(envelope3218, character1, 10).
close(envelope3218, mailbox3219, 10).
close(envelope3218, character1, 10).
inside(envelope3218, kitchen207, 11).
inside(envelope3218, character1, 11).
ontopof(envelope3218, mailbox3219, 11).
close(envelope3218, mailbox3219, 11).
close(envelope3218, character1, 11).
type(mailbox3219, mailbox).
recipient(mailbox3219).
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

action_valid(walk,X,T) :- X \= character1, rooms(X), not inside(character1, X, T), not -action_valid(walk, X, T).
action_valid(walk,X,T) :- X \= character1, -rooms(X), not sitting(character1, T), not held(X, T), reachable(X, T),
                        not close(character1, X, T),
                        inside(character1, Room, T), inside(X, Room, T),
                        not -action_valid(walk, X, T).
action_valid(grab,X,T) :- grabbable(X), close(character1, X, T), reachable(X, T), has_free_hand(T), not -action_valid(grab, X, T).
action_valid(put,X,T) :- held(_, T), close(character1, X, T), not -action_valid(put, X, T).
action_valid(find, X, T) :- not -action_valid(find, X, T).
action_valid(drink, X, T) :- recipient(X), drinkable(Y), inside(Y, X, T), close(character1, X, T), not -action_valid(drink, X, T).
action_valid(eat, X, T) :- recipient(Y), eatable(X), inside(X, Y, T), close(character1, X, T), not -action_valid(eat, X, T).
action_valid(eat, X, T) :- recipient(Y), eatable(X), ontopof(X, Y, T), close(character1, X, T), not -action_valid(eat, X, T).
action_valid(switch_on, X, T) :- has_switch(X), off(X, T), close(character1, X, T), not -action_valid(switch_on, X, T).
action_valid(switch_off, X, T) :- has_switch(X), on(X, T), close(character1, X, T), not -action_valid(switch_off, X, T).
action_valid(use, X, T) :- has_switch(X), on(X, T), close(character1, X, T), not -action_valid(use, X, T).
action_valid(use, X, T) :- not has_switch(X), close(character1, X, T), not -action_valid(use, X, T).
action_valid(sit, X, T) :- not sitting(character1, T), not laying(character1, T), close(character1, X, T), sittable(X), not -action_valid(sit, X, T).
action_valid(lie, X, T) :- not sitting(character1, T), not laying(character1, T), close(character1, X, T), lieable(X), not -action_valid(lie, X, T).
action_valid(open, X, T) :- can_open(X), closed(X, T), close(character1, X, T), reachable(X, T), not -action_valid(open, X, T).
action_valid(close, X, T) :- can_open(X), open(X, T), close(character1, X, T), reachable(X, T), not -action_valid(close, X, T).
action_valid(move, X, T) :- movable(X), close(character1, X, T), reachable(X, T), not -action_valid(move, X, T).
action_valid(turn_to, X, T) :- reachable(X, T), not -action_valid(turn_to, X, T).
action_valid(point, X, T) :- not -action_valid(point, X, T).


-action_valid(find, X, T) :- T2 .<. T, action_done(walk, X, T2).
-action_valid(find, X, T) :- T2 .<. T, action_done(grab, X, T2).
-action_valid(find, X, T) :- T2 .<. T, action_done(put, X, T2).
-action_valid(find, X, T) :- T2 .<. T, action_done(drink, X, T2).
-action_valid(find, X, T) :- T2 .<. T, action_done(eat, X, T2).
-action_valid(find, X, T) :- T2 .<. T, action_done(switch_on, X, T2).
-action_valid(find, X, T) :- T2 .<. T, action_done(switch_off, X, T2).
-action_valid(find, X, T) :- T2 .<. T, action_done(use, X, T2).
-action_valid(find, X, T) :- T2 .<. T, action_done(sit, X, T2).
-action_valid(find, X, T) :- T2 .<. T, action_done(lie, X, T2).
-action_valid(find, X, T) :- T2 .<. T, action_done(open, X, T2).
-action_valid(find, X, T) :- T2 .<. T, action_done(close, X, T2).
-action_valid(_, X, _) :- not exists(X).

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

action_done(walk,paper303,0).
action_done(grab,paper303,1).
action_done(walk,bedroom74,2).
action_done(walk,envelope3218,3).
action_done(grab,envelope3218,4).
action_done(put,envelope3218,5).
action_done(walk,kitchen207,6).
action_done(walk,bedroom74,7).
action_done(walk,kitchen207,8).

?- not action_possible(walk,mailbox3219,9).