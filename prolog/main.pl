:- dynamic i_am_at/1.
:- dynamic inventory/1.
:- retractall(i_am_at(_)).
:- retractall(equipment(_)).
:- dynamic monety/1.


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
    write('Udało Ci się wytworzyć przynętę na gryfa'), nl.

% Informacja, gdy gracz nie ma niezbędnych składników
craft_bait :-
    write('Nie masz przedmiotów niezbędnych do wytworzenia przynęty. \n Do wytworzenia przynęty niezbędne są: \n- 2 krowie skóry \n- siarka \n-ziele szatana'), nl.

start :-
    assert(i_am_at(c3)),
    assert(inventory([])),
    assert(monety(0)),
    intro.