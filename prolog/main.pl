:- dynamic i_am_at/1.
:- dynamic inventory/1.
:- retractall(i_am_at(_)).
:- retractall(equipment(_)).
:- dynamic monety/1.


% Dodawanie przedmiotu do ekwipunku
add_to_inventory(Item, Quantity) :-
    retract(inventory(Inventory)),
    % Sprawdzenie, czy przedmiot już istnieje w ekwipunku
    (   
        member((Item, OldQuantity), Inventory) ->
        NewQuantity is OldQuantity + Quantity,
        select((Item, OldQuantity), Inventory, TempInventory),
        assert(inventory([(Item, NewQuantity)|TempInventory]))
        ; 
        assert(inventory([(Item, Quantity)|Inventory]))
    ).

% Usuwanie przedmiotu z ekwipunku
remove_from_inventory(Item, Quantity) :-
    retract(inventory(Inventory)),
    % Sprawdzenie, czy przedmiot istnieje w ekwipunku
    (   
        member((Item, OldQuantity), Inventory),
        OldQuantity >= Quantity ->
        NewQuantity is OldQuantity - Quantity,
        select((Item, OldQuantity), Inventory, TempInventory),
        % Usunięcie przedmiotu z ekwipunku, jeśli jego ilość wynosi 0
        (   NewQuantity =:= 0 -> 
            assert(inventory(TempInventory))
            ;
            assert(inventory([(Item, NewQuantity)|TempInventory]))
        )
        ; 
        % Przedmiot nie występuje w ekwipunku lub ilość jest niewystarczająca
        assert(inventory(Inventory))
    ).

display_inventory :-
    inventory(Inventory),
    write('Your inventory:'), nl,
    display_items(Inventory).

% Wyświetlanie przedmiotów w ekwipunku
display_items([]).
display_items([(Item, Quantity)|Rest]) :-
    write('- '), write(Item), write_quantity(Quantity), nl,
    display_items(Rest).

% Wyświetlanie ilości przedmiotu, jeśli jest większa niż 1
write_quantity(1) :- !.
write_quantity(Quantity) :-
    write(' (x'), write(Quantity), write(')').

% Użycie przedmiotu z ekwipunku
use(Item) :-
    % Sprawdzenie, czy przedmiot istnieje w ekwipunku
    inventory(Inventory),
    member((Item, _), Inventory),
    % Wykonanie akcji związanej z użyciem przedmiotu
    use_item(Item),
    nl.

% Implementacja akcji związanej z użyciem przedmiotu (przykład)
use_item(bestiariusz) :-
    write('You open the bestiary and find information about Gryf:'), nl,
    write('- Gryf is a fearsome creature that dwells in dark caves.'), nl,
    write('- It is vulnerable to light-based attacks.'), nl.

% Złożenie pzynęty na gryfa
craft_bait() :-
    % Sprawdzenie, czy gracz ma odpowiednią ilość każdego składnika
    inventory(Inventory),
    member((siarka, 1), Inventory),
    member((ziele_szatana, 1), Inventory),
    member((krowia_skora, 2), Inventory),
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
    assert(inventory([(bestiariusz, 1)])),
    assert(monety(0)),
    intro.