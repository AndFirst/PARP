:- dynamic i_am_at/1.
:- dynamic inventory/1.
:- retractall(i_am_at(_)).
:- retractall(equipment(_)).
:- dynamic monety/1.

start :-
    assert(i_am_at(c3)),
    assert(inventory([])),
    assert(monety(0)),
    intro.