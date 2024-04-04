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

podnies(Item) :-
    i_am_at(Place),  % Pobierz obecną lokalizację postaci
    place(Place, _, _, Items),  % Sprawdź, jakie przedmioty znajdują się w tej lokalizacji
    member(Item, Items),  % Sprawdź, czy wybrany przedmiot jest w tej lokalizacji
    add_to_inventory(Item, 1),  % Dodaj przedmiot do ekwipunku
    write('Podnosisz '), write(Item), write(' z ziemi.'), nl.  % Wyświetl komunikat o podniesieniu przedmiotu


cena(siarka, 15).
cena(skóra, 5).
cena(karta, 15).

