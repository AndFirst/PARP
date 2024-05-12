% Funkcja dodająca monety do posiadanych przez postać
dodaj_monety(Ilosc) :-
    retract(monety(X)),  % Pobierz obecną ilość monet
    Nowa_ilosc is X + Ilosc,  % Dodaj do niej nowe monety
    asserta(monety(Nowa_ilosc)).  % Zapisz zaktualizowaną ilość monet

% Funkcja, która sprawdza, czy postać ma wystarczającą ilość monet
ma_wystarczajaca_ilosc_monet(Requred) :-
    monety(Ilosc),
    Ilosc >= Requred.

monety :-
    monety(Ilosc),
    format('Posiadasz ~d orenów temerskich.~n', [Ilosc]).