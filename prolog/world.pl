% place(coordinates, location, NPCs, Items, Opponents)

place(a1, west_mountains, [], [], []).
place(a2, ridge, [], [], []).
place(a3, ridge, [], [], []).
place(a4, mountains, [], [], []).
place(a5, ridge, [], [], []).
place(a6, east_mountains, [], [], []).
place(a7, east_mountains, [], [], []).

place(b1, other, [], [], []).
place(b2, meadow, [], [], [krowa]).
place(b3, meadow, [], [], [krowa]).
place(b4, other, [], [], []).
place(b5, other, [], [], []).
place(b6, other, [], [], []).
place(b7, nest, [], [], []).

place(c1, other, [], [], []).
place(c2, other, [], [], []).
place(c3, village, [kupiec, karczmarka], [], []).
place(c4, other, [], [], []).
place(c5, other, [], [], []).
place(c6, other, [], [], []).
place(c7, other, [], [], []).

place(d1, forest, [], [], []).
place(d2, other, [], [], []).
place(d3, other, [], [], []).
place(d4, other, [], [], []).
place(d5, other, [], [], []).
place(d6, lake, [], [], []).
place(d7, lake, [], [], []).

place(e1, forest, [], [], []).
place(e2, other, [], [], []).
place(e3, other, [], [], []).
place(e4, other, [], [], []).
place(e5, other, [], [], []).
place(e6, lake, [], [], []).
place(e7, lake, [], [], []).

place(f1, other, [], [], []).
place(f2, cliff_canyon, [], [], []).
place(f3, canyon, [], [], []).
place(f4, cliff_canyon, [], [], []).
place(f5, tower, [], [], []).
place(f5b, inside_tower, [], [gwyhyr], []).
place(f6, lake, [], [], []).
place(f7, lake, [], [], []).

place(g1, other, [], [], []).
place(g2, other, [], [], []).
place(g3, cave, [], [], []).
place(g4, other, [], [], []).
place(g5, lake, [], [], []).
place(g6, lake, [], [], []).
place(g7, lake, [], [], []).



west_mountains :- write("Zachodni szczyt Gór Va'Matz"), nl.
ridge :- write("Niedostępna grań Gór Va'Matz"), nl.
mountains :- write("Wysokie Góry Va'Matz"), nl.
east_mountains :- write("Wschodnie szczyty Gór Va'Matz"), nl.
forest :- write("Bór K'Backi. Czuć dobiegającą z niego gęstą esencję Leszych..."), nl.
canyon :- write('Malowniczy kanion prowadzący do jaskini.'), nl.
cliff_canyon :- write('Potężny klif na końcu kanionu.'), nl.
cave :- write('Tajemnicza jaskinia. Z jakiegoś powodu nie wygląda, żeby żadne potwory chciały się tam zapuszczać...'), nl.
nest :- write('Gniazdo gryfa.'), nl.
village :- write('Wieś Jaworek'), nl.
tower :- write('Wieża Babel. Obok znajdują się ruiny drugiej, ewidentnie uderzonej przez Wiwernę'), nl.
inside_tower :- write('Wnętrze wieży Babel. Zdaje się, że nikt tu dawno nie zaglądał.'), nl.
lake :- write('Jezioro emanujące elficką magią.'), nl.
meadow :- write('Łąka, na której pasą się krowy'), nl.
other :- write('Równiny pełne roślinności'), nl.

dodaj_przeciwnika(Miejsce, Opponent) :-
    place(Miejsce, _, _, _, _),
    assertz(place(Miejsce, _, _, _, Opponent)).