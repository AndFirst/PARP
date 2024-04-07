% Funkcja sprawdzająca, czy bieżąca lokalizacja ma postacie
has_characters(Place) :-
  place(Place, _, Characters, _, _),
  Characters \= [].  % Sprawdź, czy lista postaci nie jest pusta

% Funkcja do interakcji z postacią
interact(Character) :-
  i_am_at(Place),
  place(Place, _, CharactersList, _, _),  % Pobierz postacie z bieżącej lokalizacji
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
   write('Zaraza. Nie wiem, jak rozmawiać z tym odmieńcem.')  % Domyślny komunikat dla nieznanych postaci
  ).

% Rozmowa z kupcem
kupiec_rozmowa :-
  write('Witaj Mistrzu wiedźminie! Czym mogę służyć?'), nl,
  write('1. Pokaż mi swoje towary'), nl,
  write('2. Sprzedaj przedmiot'), nl,
  write('0. Wyjdź z rozmowy'), nl,
  read(Opcja), nl,
  ( Opcja = 1 -> kupiec_kup_przedmiot ; Opcja = 2 -> kupiec_sprzedaj_przedmiot ; Opcja = 0 -> true ; write('Niepoprawna opcja.') ).

% Kupno przedmiotu od kupca
kupiec_kup_przedmiot :-
  write('Pokażę ci swoje towary. Które z nich chcesz kupić?'), nl,
  write('1. Siarka.'), nl,
  write('2. Karta do gwinta - Vernon Roche (Partiota, ale zbój)'), nl,
  write('0. Wyjdź z rozmowy'), nl,
  read(Przedmiot), nl,
  ( Przedmiot = 1 -> kupiec_kup_siarke; Przedmiot = 2 -> kupiec_kup_karte_do_gwinta; Przedmiot = 0 -> true ; write('Nie mam tego w skrzyni.') ).

kupiec_kup_siarke :-
  cena(siarka, Cena),  % Pobranie ceny siarki
  ( ma_wystarczajaca_ilosc_monet(Cena) ->
    dodaj_monety(-Cena),  % Odejmowanie ceny od posiadanych monet
    add_to_inventory(siarka, 1),
    write('Kupiłeś siarkę.')
  ; write('Niestety, potrzebujesz więcej orenów żeby to kupić') ).

kupiec_kup_karte_do_gwinta :-
  cena(karta, Cena),  % Pobranie ceny karty do gwinta
  ( ma_wystarczajaca_ilosc_monet(Cena) ->
    dodaj_monety(-Cena),  % Odejmowanie ceny od posiadanych monet
    add_to_inventory(karta, 1),
    write('Kupiłeś kartę do gwinta "Vernon Roche".')
  ; write('Niestety, potrzebujesz więcej orenów żeby to kupić') ).


kupiec_sprzedaj_przedmiot :-
  inventory(Inventory),  % Pobranie aktualnego ekwipunku
  Inventory \= [],  % Sprawdzenie, czy ekwipunek nie jest pusty
  write('Przedmioty w twoim ekwipunku:'), nl,
  display_inventory,  % Wyświetlenie ekwipunku
  write('Wybierz przedmiot, który chcesz spieniężyć: '), read(Przedmiot), nl,
  sprzedaj_przedmiot(Przedmiot).  % Sprzedaż wybranego przedmiotu

kupiec_sprzedaj_przedmiot :-
  % Jeśli ekwipunek jest pusty
  write('Twój ekwipunek jest pustszy niż głowa utopca. Nie masz nic do sprzedania.'), nl.

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
  write('Sprzedałeś '), write(Przedmiot), write(' za '), write(Cena), write(' orenów.'), nl.

atakuj(monster) :- (i_am_at(b2); i_am_at(b3)),
    write('Atakujesz krowę.'), nl,
    add_to_inventory(skóra, 1),
    write('Zabiłeś krowę i zdobyłeś krowią skórę.'), nl.

atakuj(monster) :- (i_am_at(b7); place(b7, _, _, _, gryf)) ,
  write('Zaatakowałeś gryfa, wybierz co powienieś zrobić'), nl,
  write('1. Strzel z kuszy, by go powalić.'), nl,
  write('2. Zaatakuj gryfa mieczem'), nl,
  write('0. Uciekaj'), nl,
  read(Ruch), nl,
  ( Ruch = 1 -> atak_kusza1; Ruch = 2 -> atak_miecz1; Ruch = 0 -> ucieczka ; write('Nie możesz tego zrobić') ).

atak_kusza1 :- 

atak_miecz1 :- 

ucieczka :- 
  

atakuj(monster) :- 
  i_am_at(b7),
  write("Gniazdo gryfa jest puste, powienieneś najpierw zastawić przynętę.").

atakuj(monster) :-
  write('W okolicy nie ma żadnego potwora do zabicia.'), nl.