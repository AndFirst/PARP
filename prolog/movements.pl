path(a1, e, a2).
path(a1, s, b1).

path(a2, e, a3).
path(a2, w, a1).
path(a2, s, b2).

path(a3, e, a4).
path(a3, w, a2).
path(a3, s, b3).

path(a4, e, a5).
path(a4, w, a3).
path(a4, s, b4).

path(a5, e, a6).
path(a5, w, a4).
path(a5, s, b5).

path(a6, e, a7).
path(a6, w, a5).
path(a6, s, b6).

path(a7, w, a6).
path(a7, s, b7).

path(b1, n, a1).
path(b1, e, b2).
path(b1, s, c1).

path(b2, n, a2).
path(b2, e, b3).
path(b2, w, b1).
path(b2, s, c2).

path(b3, n, a3).
path(b3, e, b4).
path(b3, w, b2).
path(b3, s, c3).

path(b4, n, a4).
path(b4, e, b5).
path(b4, w, b3).
path(b4, s, c4).

path(b5, n, a5).
path(b5, e, b6).
path(b5, w, b4).
path(b5, s, c5).

path(b6, n, a6).
path(b6, e, b7).
path(b6, w, b5).
path(b6, s, c6).

path(b7, n, a7).
path(b7, w, b6).
path(b7, s, c7).

path(c1, n, b1).
path(c1, e, c2).
path(c1, s, d1).

path(c2, n, b2).
path(c2, e, c3).
path(c2, w, c1).
path(c2, s, d2).

path(c3, n, b3).
path(c3, e, c4).
path(c3, w, c2).
path(c3, s, d3).

path(c4, n, b4).
path(c4, e, c5).
path(c4, w, c3).
path(c4, s, d4).

path(c5, n, b5).
path(c5, e, c6).
path(c5, w, c4).
path(c5, s, d5).

path(c6, n, b6).
path(c6, e, c7).
path(c6, w, c5).
path(c6, s, d6).

path(c7, n, b7).
path(c7, w, c6).
path(c7, s, d7).

path(d1, n, c1).
path(d1, e, d2).
path(d1, s, e1).

path(d2, n, c2).
path(d2, e, d3).
path(d2, w, d1).
path(d2, s, e2).

path(d3, n, c3).
path(d3, e, d4).
path(d3, w, d2).
path(d3, s, e3).

path(d4, n, c4).
path(d4, e, d5).
path(d4, w, d3).
path(d4, s, e4).

path(d5, n, c5).
path(d5, e, d6).
path(d5, w, d4).
path(d5, s, e5).

path(d6, n, c6).
path(d6, e, d7).
path(d6, w, d5).
path(d6, s, e6).

path(d7, n, c7).
path(d7, w, d6).
path(d7, s, e7).

path(e1, n, d1).
path(e1, e, e2).
path(e1, s, f1).

path(e2, n, d2).
path(e2, e, e3).
path(e2, w, e1).
path(e2, s, f2).

path(e3, n, d3).
path(e3, e, e4).
path(e3, w, e2).
path(e3, s, f3).

path(e4, n, d4).
path(e4, e, e5).
path(e4, w, e3).
path(e4, s, f4).

path(e5, n, d5).
path(e5, e, e6).
path(e5, w, e4).
path(e5, s, f5).

path(e6, n, d6).
path(e6, e, e7).
path(e6, w, e5).
path(e6, s, f6).

path(e7, n, d7).
path(e7, w, e6).
path(e7, s, f7).

path(f1, n, e1).
path(f1, e, f2).
path(f1, s, g1).

path(f2, n, e2).
path(f2, e, f3).
path(f2, w, f1).
path(f2, s, g2).

path(f3, n, e3).
path(f3, e, f4).
path(f3, w, f2).
path(f3, s, g3).

path(f4, n, e4).
path(f4, e, f5).
path(f4, w, f3).
path(f4, s, g4).

path(f5, n, e5).
path(f5, e, f6).
path(f5, w, f4).
path(f5, s, g5).

path(f6, n, e6).
path(f6, e, f7).
path(f6, w, f5).
path(f6, s, g6).

path(f7, n, e7).
path(f7, w, f6).
path(f7, s, g7).

path(g1, n, f1).
path(g1, e, g2).

path(g2, n, f2).
path(g2, e, g3).
path(g2, w, g1).

path(g3, n, f3).
path(g3, e, g4).
path(g3, w, g2).

path(g4, n, f4).
path(g4, e, g5).
path(g4, w, g3).

path(g5, n, f5).
path(g5, e, g6).
path(g5, w, g4).

path(g6, n, f6).
path(g6, e, g7).
path(g6, w, g5).

path(g7, n, f7).
path(g7, w, g6).

go(s) :- i_am_at(c1),
        write('W gęstym borze wpadasz w pułapkę zastawioną przez Leszych.'), nl, 
        write("Po cięzkim boju serce Białego Wilka zostaje brutalnie przebite przez potężnych strażników lasu..."), 
        !, halt.
go(w) :- (i_am_at(d2); i_am_at(d3)), 
        write('W gęstym borze wpadasz w pułapkę zastawioną przez Leszych.'), nl, 
        write("Po cięzkim boju serce Białego Wilka zostaje brutalnie przebite przez potężnych strażników lasu..."), 
        !, halt.
go(s) :- i_am_at(e3), 
        write('Cicha, pozbawiona jakiejkolwiek aktywności potwórów jaskinia okazuje się skrywać straszny sekret.'), 
        nl, write('Geralt nie zdążył zorientować się jakie monstrum pozbawiło go życia.'), nl,
        write('Ukryty znów może cieszyć się spokojem w swojej kryjówce...'), !, halt.

go(Direction) :-
        i_am_at(Here),
        path(Here, Direction, There),
        retract(i_am_at(Here)),
        assert(i_am_at(There)),
        !, look.

go(_) :-
        write('Dotarłeś do miejsca gdzie diabeł mówi dobranoc. Zawróć.'), nl.

n :- go(n).

s :- go(s).

e :- go(e).

w :- go(w).

look :-
    i_am_at(Place),
    write('Obecna lokalizacja: '), describe(Place),
    nl.


look(Direction) :-
        i_am_at(Here),
        path(Here, Direction, There),
        write('Patrzysz na: '), describe(There), nl,
        !.

look(_) :-
        write('Zaraza. Nie powinienem tam iść'), nl.