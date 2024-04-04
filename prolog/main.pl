:- dynamic i_am_at/1.
:- dynamic inventory/1.
:- dynamic chat/2.
:- retractall(i_am_at(_)).
:- retractall(equipment(_)).


% Dodawanie przedmiotu do ekwipunku
add_to_inventory(Item) :-
    retract(inventory(Inventory)),
    assert(inventory([Item|Inventory])).

% Usuwanie przedmiotu z ekwipunku
remove_from_inventory(Item) :-
    retract(inventory(Inventory)),
    select(Item, Inventory, NewInventory),
    assert(inventory(NewInventory)).

display_inventory :-
    inventory(Inventory),
    write('W twoim ekwipunku znajdują się: '), nl,
    display_items(Inventory).

% Wyświetlanie przedmiotów w ekwipunku
display_items([]).
display_items([Item|Rest]) :-
    write('- '), write(Item), nl,
    display_items(Rest).

% Predykat obsługujący użycie przedmiotów
use(Item) :-
    % Sprawdzenie czy przedmiot znajduje się w ekwipunku
    inventory(Inventory),
    member(Item, Inventory),
    % Obsługa różnych przedmiotów
    (
        Item = bestiariusz -> write('Bestiariusz Wiedźminski, Kaer Morhen 1261 \n (...) \n Jak zabic gryfa.txt \n')  
        % Tutaj możesz dodać obsługę innych przedmiotów
        ; write('You cannot use that item.')
    ), nl.


start :-
    assert(i_am_at(c3)),
    assert(inventory([bestiariusz])),
    intro.