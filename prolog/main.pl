:- dynamic i_am_at/1.
:- dynamic inventory/1.
:- retractall(i_am_at(_)).
:- retractall(equipment(_)).
:- dynamic monety/1.
:- discontiguous go/1.

% Złożenie pzynęty na gryfa
craft_bait() :-
    % Sprawdzenie, czy gracz ma odpowiednią ilość każdego składnika
    inventory(Inventory),
    member((siarka, 1), Inventory),
    member((ziele_szatana, 1), Inventory),
    member((skóra, 2), Inventory),
    % Usunięcie składników z ekwipunku
    remove_from_inventory(siarka, 1),
    remove_from_inventory(ziele_szatana, 1),
    remove_from_inventory(krowia_skora, 2),
    add_to_inventory(przynęta_na_gryfa, 1),
    write('Wytworzono przynętę na gryfa. Teraz na pewno uda się go ukatrupić'), nl.

% Informacja, gdy gracz nie ma niezbędnych składników
craft_bait :-
    write('Nie masz przedmiotów niezbędnych do wytworzenia przynęty. \n Potrzebujesz: \n- 2 krowie skóry \n- siarka \n-ziele z bagn Oorsynowskich'), nl.

start :-
    assert(i_am_at(f5)),
    assert(inventory([])),
    initialization(init_door),
    assert(monety(0)),
    intro.