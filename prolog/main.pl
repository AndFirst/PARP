:- dynamic i_am_at/1.
:- dynamic inventory/1.
:- retractall(i_am_at(_)).
:- retractall(equipment(_)).
:- dynamic monety/1.
:- discontiguous idź/1.
:- dynamic gryf_fight_status/1.

% Złożenie pzynęty na gryfa
stworz_przynete() :-
    % Sprawdzenie, czy gracz ma odpowiednią ilość każdego składnika
    inventory(Inventory),
    member((siarka, 1), Inventory),
    member((polne_ziele, 1), Inventory),
    member((skóra, 2), Inventory),
    % Usunięcie składników z ekwipunku
    remove_from_inventory(siarka, 1),
    remove_from_inventory(polne_ziele, 1),
    remove_from_inventory(krowia_skora, 2),
    add_to_inventory(przynęta_na_gryfa, 1),
    write('Wytworzono przynętę na gryfa. Teraz na pewno uda się go ukatrupić'), nl.

% Informacja, gdy gracz nie ma niezbędnych składników
stworz_przynete :-
    write('Nie masz przedmiotów niezbędnych do wytworzenia przynęty. \n Potrzebujesz: \n- 2 krowie skóry \n- siarka \n-ziele z bagn Oorsynowskich'), nl.

start :-
    assert(i_am_at(c3)),
    assert(inventory([])),
    assert(monety(0)),
    add_to_inventory(przynęta_na_gryfa, 1),
    intro.