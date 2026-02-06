append([ ], Y, Y).
append([X|L1],L2,[X|L3]) :- append(L1,L2,L3).

remove_all([], _, []).
remove_all([H|T], Remove, Result) :-
    member(H, Remove),
    !,
    remove_all(T, Remove, Result).
remove_all([H|T], Remove, [H|Result]) :-
    remove_all(T, Remove, Result).

rev(L, R) :- trev(L, [], R).
trev([], P, P).
trev([H|T], P, R) :- trev(T, [H|P], R).

type(Lamp, lamp) :- type(Lamp, ceilinglamp).
type(Lamp, lamp) :- type(Lamp, walllamp).
type(Lamp, lamp) :- type(Lamp, tablelamp).

similar_action(X, Y) :- similar_action(Y, X).

get_data(use(X), X).
get_data(read(X), X).
get_action(read(_), X, read(X)).
similar_action(read(_), use(_)).

check_close(_, C, C).
check_holds(_, H, H).
check_sat_on(_, S, S).
check_on_top_of(_, O, O).
check_inside(_, I, I).
check_on(_, O, O).
check_laid_on(_, L, L).
check_used(Action, U, UF) :- similar_action(Action, use(_)), get_data(Action, X), remove_all(U, X, UF).
check_used(_, U, U).
check_eaten(_, E, E).

% These functions perturb and unperturb the final expected state, to accomodate
% unknown actions requiring analogy
% perturb(FinalStateOriginal, PerturbedFinalState) where PerturbedFinalState only has core state in it
% perturb([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([]), eaten([]), read([book])], PerturbedFinalState).
perturb([close(Close), holds(Holds), sat_on(Sat), on_top_of(Oto), inside(Inside), on(On), laid_on(Laid), used(Used), eaten(Eaten) | []],
    [close(Close), holds(Holds), sat_on(Sat), on_top_of(Oto), inside(Inside), on(On), laid_on(Laid), used(Used), eaten(Eaten)]).
perturb([close(Close), holds(Holds), sat_on(Sat), on_top_of(Oto), inside(Inside), on(On), laid_on(Laid), used(Used), eaten(Eaten) | T],
    PerturbedFinalState)
        :- perturb([close(Close), holds(Holds), sat_on(Sat), on_top_of(Oto), inside(Inside), on(On), laid_on(Laid), used(Used), eaten(Eaten)],
            T, PerturbedFinalState).
perturb(State, [], FinalState).
perturb([close(Close), holds(Holds), sat_on(Sat), on_top_of(Oto), inside(Inside), on(On), laid_on(Laid), used(Used), eaten(Eaten)],
    [Action | T],
    [close(Close), holds(Holds), sat_on(Sat), on_top_of(Oto), inside(Inside), on(On), laid_on(Laid), used(UsedX), eaten(Eaten)])
        :- similar_action(Action, use(_)), get_data(Action, X), append(Used, X, UsedX),
        perturb([close(Close), holds(Holds), sat_on(Sat), on_top_of(Oto), inside(Inside), on(On), laid_on(Laid), used(Used), eaten(Eaten)],
        T,
        [close(Close), holds(Holds), sat_on(Sat), on_top_of(Oto), inside(Inside), on(On), laid_on(Laid), used(UsedX), eaten(Eaten)]).
perturb(State, [A | T], FinalState) :- perturb(State, T, FinalState).
% unperturb_state(FinalStateOriginal, PerturbedState, UnperterbedState) reverses the previous using information from the original state
unperturb_state([close(Close), holds(Holds), sat_on(Sat), on_top_of(Oto), inside(Inside), on(On), laid_on(Laid), used(Used), eaten(Eaten) | []],
    State, State).
unperturb_state([close(Close), holds(Holds), sat_on(Sat), on_top_of(Oto), inside(Inside), on(On), laid_on(Laid), used(Used), eaten(Eaten) | T],
    PerturbedState, UnperturbedState)
        :- unperturb_state(T, PerturbedState, PerturbedState, UnperturbedState).
unperturb_state(_, [], _, UnperturbedState, UnperturbedState).
unperturb_state([Action | T],
    [close(Close), holds(Holds), sat_on(Sat), on_top_of(Oto), inside(Inside), on(On), laid_on(Laid), used(Used), eaten(Eaten)],
    [close(Close), holds(Holds), sat_on(Sat), on_top_of(Oto), inside(Inside), on(On), laid_on(Laid), used(Used), eaten(Eaten) | NewT],
    UnperturbedState)
        :- check_close(Action, Close, C), check_holds(Action, H, H), check_sat_on(Action, S, S), check_on_top_of(Action, O, O),
        check_inside(Action, I, I), check_on(Action, O, O), check_laid_on(Action, L, L), check_used(Action, U, U), check_eaten(Action, E, E).
% unperturb_actions(FinalState, PerturbedPlan, FinalPlan) takes the actions that were performed on an analogized object and fixes them
unperturb_actions([close(Close), holds(Holds), sat_on(Sat), on_top_of(Oto), inside(Inside), on(On), laid_on(Laid), used(Used), eaten(Eaten) | []], Plan, Plan).
unperturb_actions([close(Close), holds(Holds), sat_on(Sat), on_top_of(Oto), inside(Inside), on(On), laid_on(Laid), used(Used), eaten(Eaten) | T],
    PerturbedPlan, Plan) :- unperturb_actions(T, PerturbedPlan, [], Plan).
unperturb_actions(_, [], Plan, RevPlan) :- rev(Plan, RevPlan).
unperturb_actions(UnusualActions, [Action1 | T], Plan, FinalPlan)
        :- in_unusual(UnusualActions, Action1, Action), unperturb_actions(UnusualActions, T, [Action | Plan], FinalPlan).

in_unusual([], Action, Action).
in_unusual([FirstUnusual | T], Action1, Action)
        :- similar_action(FirstUnusual, Action1), get_data(Action1, X), get_action(FirstUnusual, X, Action).
in_unusual([FirstUnusual | T], Action1, Action) :- in_unusual(T, Action1, Action).

%?- perturb([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([notbook]), eaten([]), read([book]), not_read([])], PerturbedFinalState).
%?- unperturb_state([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([notbook]), eaten([]), read([book]), not_read([])], [close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([notbook, book]), eaten([])], UnperturbedFinalState).
%?- unperturb_actions([close([]), holds([]), sat_on([]), on_top_of([]), inside([]), on([]), laid_on([]), used([notbook]), eaten([]), read([book, magazine]), not_read([])], [walk(bedroom74),walk(book),grab(book),use(book)], Plan).












