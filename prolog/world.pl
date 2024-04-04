place(a1, mountains, []).
place(a2, mountains, []).
place(a3, mountains, []).
place(a4, mountains, []).
place(a5, mountains, []).
place(a6, mountains, []).
place(a7, mountains, []).

place(b1, other, []).
place(b2, meadow, []).
place(b3, meadow, []).
place(b4, other, []).
place(b5, other, []).
place(b6, other, []).
place(b7, nest, []).

place(c1, other, []).
place(c2, other, []).
place(c3, village, [kupiec, karczmarka]).
place(c4, other, []).
place(c5, other, []).
place(c6, other, []).
place(c7, other, []).

place(d1, forest, []).
place(d2, other, []).
place(d3, other, []).
place(d4, other, []).
place(d5, other, []).
place(d6, lake, []).
place(d7, lake, []).

place(e1, forest, []).
place(e2, other, []).
place(e3, other, []).
place(e4, other, []).
place(e5, other, []).
place(e6, lake, []).
place(e7, lake, []).

place(f1, other, []).
place(f2, canyon, []).
place(f3, canyon, []).
place(f4, canyon, []).
place(f5, tower, []).
place(f6, lake, []).
place(f7, lake, []).

place(g1, other, []).
place(g2, other, []).
place(g3, cave, []).
place(g4, other, []).
place(g5, lake, []).
place(g6, lake, []).
place(g7, lake, []).


mountains :- write('Góry Va-Matz'), nl.
forest :- write('Las Vegas'), nl.
canyon :- write('Kanion'), nl.
cave :- write('Jaskinia'), nl.
nest :- write('Gniazdo gryfa'), nl.
village :- write('Wieś Jaworek'), nl.
tower :- write('Wieża Babel'), nl.
lake :- write('Jezioro'), nl.
meadow :- write('Łąka'), nl.
other :- write('Nieużytki'), nl.
