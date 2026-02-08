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

% Similar-to Objects
% Lamp
type(Lamp, lamp) :- type(Lamp, ceilinglamp).
type(Lamp, lamp) :- type(Lamp, walllamp).
type(Lamp, lamp) :- type(Lamp, tablelamp).
% Television
type(Television, television) :- type(Television, tv).
% Couch
type(Couch, couch) :- type(Couch, sofa).
type(Couch, couch) :- type(Couch, chair).
type(Couch, couch) :- type(Couch, bed).
% Feet
type(Feet, feet) :- type(Feet, character).
type(Feet, feetboth) :- type(Feet, character).

similar_action(X, Y) :- similar_action(Y, X).

get_data(use(X), X).
% Read
get_data(read(X), X).
get_action(read(_), X, read(X)).
similar_action(read(_), use(_)).
% Watch
get_data(watch(X), X).
get_action(watch(_), X, watch(X)).
similar_action(watch(_), use(_)).
% dust
get_data(dust(X), X).
get_action(dust(_), X, dust(X)).
similar_action(dust(_), use(_)).
% fold
get_data(fold(X), X).
get_action(fold(_), X, fold(X)).
similar_action(fold(_), use(_)).
% laugh
get_data(laugh(X), X).
get_action(laugh(_), X, laugh(X)).
similar_action(laugh(_), use(_)).
% dial
get_data(dial(X), X).
get_action(dial(_), X, dial(X)).
similar_action(dial(_), use(_)).
% rinse
get_data(rinse(X), X).
get_action(rinse(_), X, rinse(X)).
similar_action(rinse(_), use(_)).
% sweep
get_data(sweep(X), X).
get_action(sweep(_), X, sweep(X)).
similar_action(sweep(_), use(_)).
% write
get_data(write(X), X).
get_action(write(_), X, write(X)).
similar_action(write(_), use(_)).
% push
get_data(push(X), X).
get_action(push(_), X, push(X)).
similar_action(push(_), use(_)).
% speak
get_data(speak(X), X).
get_action(speak(_), X, speak(X)).
similar_action(speak(_), use(_)).
% cover
get_data(cover(X), X).
get_action(cover(_), X, cover(X)).
similar_action(cover(_), use(_)).
% play
get_data(play(X), X).
get_action(play(_), X, play(X)).
similar_action(play(_), use(_)).
% sleep
get_data(sleep(X), X).
get_action(sleep(_), X, sleep(X)).
similar_action(sleep(_), use(_)).
% unfold
get_data(unfold(X), X).
get_action(unfold(_), X, unfold(X)).
similar_action(unfold(_), use(_)).
% cut
get_data(cut(X), X).
get_action(cut(_), X, cut(X)).
similar_action(cut(_), use(_)).
% closed
get_data(closed(X), X).
get_action(closed(_), X, closed(X)).
similar_action(closed(_), use(_)).
% wash
get_data(wash(X), X).
get_action(wash(_), X, wash(X)).
similar_action(wash(_), use(_)).
% jump
get_data(jump(X), X).
get_action(jump(_), X, jump(X)).
similar_action(jump(_), use(_)).
% wipe
get_data(wipe(X), X).
get_action(wipe(_), X, wipe(X)).
similar_action(wipe(_), use(_)).
% wakeup
get_data(wakeup(X), X).
get_action(wakeup(_), X, wakeup(X)).
similar_action(wakeup(_), use(_)).
% talk
get_data(talk(X), X).
get_action(talk(_), X, talk(X)).
similar_action(talk(_), use(_)).
% greet
get_data(greet(X), X).
get_action(greet(_), X, greet(X)).
similar_action(greet(_), use(_)).
% sew
get_data(sew(X), X).
get_action(sew(_), X, sew(X)).
similar_action(sew(_), use(_)).
% wrap
get_data(wrap(X), X).
get_action(wrap(_), X, wrap(X)).
similar_action(wrap(_), use(_)).
% brush
get_data(brush(X), X).
get_action(brush(_), X, brush(X)).
similar_action(brush(_), use(_)).
% pull
get_data(pull(X), X).
get_action(pull(_), X, pull(X)).
similar_action(pull(_), use(_)).
% dance
get_data(dance(X), X).
get_action(dance(_), X, dance(X)).
similar_action(dance(_), use(_)).
% soak
get_data(soak(X), X).
get_action(soak(_), X, soak(X)).
similar_action(soak(_), use(_)).
% scrub
get_data(scrub(X), X).
get_action(scrub(_), X, scrub(X)).
similar_action(scrub(_), use(_)).
% flush
get_data(flush(X), X).
get_action(flush(_), X, flush(X)).
similar_action(flush(_), use(_)).
% shake
get_data(shake(X), X).
get_action(shake(_), X, shake(X)).
similar_action(shake(_), use(_)).
% wait
get_data(wait(X), X).
get_action(wait(_), X, wait(X)).
similar_action(wait(_), use(_)).
% spread
get_data(spread(X), X).
get_action(spread(_), X, spread(X)).
similar_action(spread(_), use(_)).
% open
get_data(open(X), X).
get_action(open(_), X, open(X)).
similar_action(open(_), use(_)).
% touch
get_data(touch(X), X).
get_action(touch(_), X, touch(X)).
similar_action(touch(_), grab(_)).
% squeeze
get_data(squeeze(X), X).
get_action(squeeze(_), X, squeeze(X)).
similar_action(squeeze(_), grab(_)).
% uncover
get_data(uncover(X), X).
get_action(uncover(_), X, uncover(X)).
similar_action(uncover(_), grab(_)).
% leave
get_data(leave(X), X).
get_action(leave(_), X, leave(X)).
similar_action(leave(_), walk(_)).
% enter
get_data(enter(X), X).
get_action(enter(_), X, enter(X)).
similar_action(enter(_), walk(_)).
% run
get_data(run(X), X).
get_action(run(_), X, run(X)).
similar_action(run(_), walk(_)).
% crawl
get_data(crawl(X), X).
get_action(crawl(_), X, crawl(X)).
similar_action(crawl(_), walk(_)).
% plugin
get_data(plugin(X), X).
get_action(plugin(_), X, plugin(X)).
similar_action(plugin(_), switchon(_)).
% climb
get_data(climb(X), X).
get_action(climb(_), X, climb(X)).
similar_action(climb(_), sit(_)).
% drink
get_data(drink(X), X).
get_action(drink(_), X, drink(X)).
similar_action(drink(_), eat(_)).


%check_close(_, C, C).
%check_holds(_, H, H).
%check_sat_on(_, S, S).
%check_on_top_of(_, O, O).
%check_inside(_, I, I).
%check_on(_, O, O).
%check_laid_on(_, L, L).
%check_used(Action, U, UF) :- similar_action(Action, use(_)), get_data(Action, X), remove_all(U, X, UF).
%check_used(_, U, U).
%check_eaten(_, E, E).

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
%unperturb_state([close(Close), holds(Holds), sat_on(Sat), on_top_of(Oto), inside(Inside), on(On), laid_on(Laid), used(Used), eaten(Eaten) | []],
%    State, State).
%unperturb_state([close(Close), holds(Holds), sat_on(Sat), on_top_of(Oto), inside(Inside), on(On), laid_on(Laid), used(Used), eaten(Eaten) | T],
%    PerturbedState, UnperturbedState)
%        :- unperturb_state(T, PerturbedState, PerturbedState, UnperturbedState).
%unperturb_state(_, [], _, UnperturbedState, UnperturbedState).
%unperturb_state([Action | T],
%    [close(Close), holds(Holds), sat_on(Sat), on_top_of(Oto), inside(Inside), on(On), laid_on(Laid), used(Used), eaten(Eaten)],
%    [close(Close), holds(Holds), sat_on(Sat), on_top_of(Oto), inside(Inside), on(On), laid_on(Laid), used(Used), eaten(Eaten) | NewT],
%    UnperturbedState)
%        :- check_close(Action, Close, C), check_holds(Action, H, H), check_sat_on(Action, S, S), check_on_top_of(Action, O, O),
%        check_inside(Action, I, I), check_on(Action, O, O), check_laid_on(Action, L, L), check_used(Action, U, U), check_eaten(Action, E, E).

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
