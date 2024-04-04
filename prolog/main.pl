:- dynamic i_am_at/1.
:- dynamic monety/1.



start :-
    assert(i_am_at(c3)),
    assert(monety(0)),
    intro.