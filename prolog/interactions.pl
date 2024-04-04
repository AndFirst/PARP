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
  write('Witaj! Czym mogę służyć?'), nl,
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
  cena(siarka, Cena),  % Pobranie ceny siarki
  ( ma_wystarczajaca_ilosc_monet(Cena) ->
    dodaj_monety(-Cena),  % Odejmowanie ceny od posiadanych monet
    add_to_inventory(siarka, 1),
    write('Gratuluję! Kupiłeś siarkę.')
  ; write('Niestety nie masz wystarczająco dużo monet.') ).

kupiec_kup_karte_do_gwinta :-
  cena(karta, Cena),  % Pobranie ceny karty do gwinta
  ( ma_wystarczajaca_ilosc_monet(Cena) ->
    dodaj_monety(-Cena),  % Odejmowanie ceny od posiadanych monet
    add_to_inventory(karta, 1),
    write('Gratuluję! Kupiłeś kartę do gwinta "Leczo z Guleczo".')
  ; write('Niestety nie masz wystarczająco dużo monet.') ).


kupiec_sprzedaj_przedmiot :-
  inventory(Inventory),  % Pobranie aktualnego ekwipunku
  Inventory \= [],  % Sprawdzenie, czy ekwipunek nie jest pusty
  write('Przedmioty w twoim ekwipunku:'), nl,
  display_inventory,  % Wyświetlenie ekwipunku
  write('Wybierz przedmiot do sprzedaży: '), read(Przedmiot), nl,
  sprzedaj_przedmiot(Przedmiot).  % Sprzedaż wybranego przedmiotu

kupiec_sprzedaj_przedmiot :-
  % Jeśli ekwipunek jest pusty
  write('Twój ekwipunek jest pusty. Nie masz przedmiotów do sprzedaży.'), nl.

% Sprzedaż przedmiotu
sprzedaj_przedmiot(Przedmiot) :-
  inventory(Inventory),  % Pobranie aktualnego ekwipunku
  member((Przedmiot, Ilosc), Inventory),  % Sprawdzenie, czy postać posiada wybrany przedmiot
  Ilosc > 0,  % Sprawdzenie, czy ilość przedmiotu jest większa od zera
  % Sprawdzenie ceny przedmiotu
  cena(Przedmiot, Cena),
  % Usunięcie przedmiotu z ekwipunku
  remove_from_inventory(Przedmiot, 1),
  % Dodanie monet do posiadanych przez postać
  dodaj_monety(Cena),
  write('Sprzedałeś '), write(Przedmiot), write(' za '), write(Cena), write(' monet.'), nl.
