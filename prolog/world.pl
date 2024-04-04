describe(a1) :- west_mountains.
describe(a2) :- ridge.
describe(a3) :- ridge.
describe(a4) :- mountains.
describe(a5) :- ridge.
describe(a6) :- east_mountains.
describe(a7) :- east_mountains.

describe(b1) :- other.
describe(b2) :- meadow.
describe(b3) :- meadow.
describe(b4) :- other.
describe(b5) :- other.
describe(b6) :- other.
describe(b7) :- nest.

describe(c1) :- other.
describe(c2) :- other.
describe(c3) :- village.
describe(c4) :- other.
describe(c5) :- other.
describe(c6) :- other.
describe(c7) :- other.

describe(d1) :- forest.
describe(d2) :- other.
describe(d3) :- other.
describe(d4) :- other.
describe(d5) :- other.
describe(d6) :- lake.
describe(d7) :- lake.

describe(e1) :- forest.
describe(e2) :- other.
describe(e3) :- other.
describe(e4) :- other.
describe(e5) :- other.
describe(e6) :- lake.
describe(e7) :- lake.

describe(f1) :- other.
describe(f2) :- cliff_canyon.
describe(f3) :- canyon.
describe(f4) :- cliff_canyon.
describe(f5) :- tower.
describe(f6) :- lake.
describe(f7) :- lake.

describe(g1) :- other.
describe(g2) :- other.
describe(g3) :- cave.
describe(g4) :- other.
describe(g5) :- lake.
describe(g6) :- lake.
describe(g7) :- lake.


west_mountains :- write("Zachodni szczyt Gór Va'Matz"), nl.
ridge :- write("Niedostępna grań Gór Va'Matz"), nl.
ridge:- write("Niedostępna grań Gór Va'Matz"), nl.
mountains :- write("Wysokie Góry Va'Matz"), nl.
ridge :- write("Niedostępna grań Gór Va'Matz"), nl.
east_mountains :- write("Wschodnie szczyty Gór Va'Matz"), nl.
east_mountains :- write("Wschodnie szczyty Gór Va'Matz"), nl.
forest :- write("Bór K'Backi. Czuć dobiegającą z niego gęstą esencję Leszych..."), nl.
canyon :- write('Malowniczy kanion prowadzący do jaskini.'), nl.
cliff_canyon :- write('Potężny klif na końcu kanionu.'), nl.
cave :- write('Tajemnicza jaskinia. Z jakiegoś powodu nie wygląda, żeby żadne potwory chciały się tam zapuszczać...'), nl.
nest :- write('Gniazdo gryfa.'), nl.
village :- write('Wieś Jaworek'), nl.
tower :- write('Wieża Babel. Obok znajdują się ruiny drugiej, ewidentnie uderzonej przez Wiwernę'), nl.
lake :- write('Jezioro emanujące elficką magią.'), nl.
meadow :- write('Łąka, na której pasą się krowy'), nl.
other :- write('Równiny pełne roślinności'), nl.
