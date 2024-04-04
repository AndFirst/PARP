% Funkcja sprawdzająca, czy bieżąca lokalizacja ma postacie
has_characters(Place) :-
  place(Place, _, Characters),
  Characters \= [].  % Sprawdź, czy lista postaci nie jest pusta

% Funkcja do interakcji z postacią
interact(Character) :-
  i_am_at(Place),
  place(Place, _, CharactersList),  % Pobierz postacie z bieżącej lokalizacji
  member(Character, CharactersList),  % Sprawdź, czy wybrana postać jest obecna
  !,  % Cut, jeśli postać została znaleziona
  talk_to_character(Character).

talk_to_character(Character) :-
  ( Character = kupiec ->
    kupiec_rozmowa ; % Rozmowa z kupcem
  Character = karczmarka ->
    karczmarka_rozmowa ; % Rozmowa z karczmarką
  Character = zielarz ->
    zielarz_rozmowa ; % Rozmowa z zielarzem
   write('Nie wiem, jak rozmawiać z tą postacią.')  % Domyślny komunikat dla nieznanych postaci
  ).

% Rozmowa z kupcem
kupiec_rozmowa :-
  write('Kupiec odpowiada: Witaj! Czym mogę służyć?'), nl,
  write('1. Kup przedmiot'), nl,
  write('2. Sprzedaj przedmiot'), nl,
  write('0. Wyjdź z rozmowy'), nl,
  read(Opcja), nl,
  ( Opcja = 1 -> kupiec_kup_przedmiot ; Opcja = 2 -> kupiec_sprzedaj_przedmiot ; Opcja = 0 -> true ; write('Niepoprawna opcja.') ).

% Kupno przedmiotu od kupca
kupiec_kup_przedmiot :-
  write('Jakie przedmioty chcesz kupić?'), nl,
  write('1. Siarka.'), nl,
  write('2. Karta do gwinta - Leczo z Guleczo'), nl,
  write('0. Wyjdź z rozmowy'), nl,
  read(Przedmiot), nl,
  ( Przedmiot = 1 -> kupiec_kup_siarke; Przedmiot = 2 -> kupiec_kup_karte_do_gwinta; Przedmiot = 0 -> true ; write('Nie mamy takiego przedmiotu.') ).

kupiec_kup_siarke :-
  write('Czy masz 10 monet?'), nl,
  read(Odpowiedź), nl,
  ( Odpowiedź = tak ->
    write('Gratuluję! Kupiłeś siarkę.')
  ; write('Niestety nie masz wystarczająco dużo monet.') ).

kupiec_kup_karte_do_gwinta :-
  write('Czy masz 20 monet?'), nl,
  read(Odpowiedź), nl,
  ( Odpowiedź = tak ->
    write('Gratuluję! Kupiłeś kartę do gwinta "Leczo z Guleczo".')
  ; write('Niestety nie masz wystarczająco dużo monet.') ).


kupiec_sprzedaj_przedmiot :-
  write('Jakie przedmioty chcesz sprzedać?'), nl.
/*
  write('Jakie przedmioty chcesz sprzedać?'), nl, 
  ekwipunek(Ekwipunek),
  ( \+ member(Przedmiot, Ekwipunek) ->
    write('Nie masz tego przedmiotu.')
  ; ( forall(member(Przedmiot, Ekwipunek), write(Przedmiot), write(', ')), nl )
  ),
  read(Przedmiot), nl,
  ( member(Przedmiot, Ekwipunek) ->
    usun_z_ekwipunku(Przedmiot),
    dodaj_monety(5),
    write('Sprzedałeś przedmiot za 5 monet.')
  ; write('Nie masz tego przedmiotu.')
  ).
*/



