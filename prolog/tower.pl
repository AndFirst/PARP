% Dynamiczny predykat śledzący stan drzwi (otwarte/zamknięte)
:- dynamic door_status/1.

% Predykat inicjalizujący początkowy stan drzwi (zamknięte)
init_door :-
    retractall(door_status(_)),
    assertz(door_status(closed)).

:- initialization(init_door).

% Predykat otwierający drzwi
aard(door) :-
    i_am_at(f5),
    % Sprawdzenie, czy drzwi są już otwarte
    door_status(open),
    % Informacja o otwartych drzwiach
    write('Drzwi zostały już otwarte, nie musisz tego robić ponownie.'), nl,
    !. % Przerwij dalsze działanie predykatu

aard :-
    i_am_at(f5),
    % Otwarcie drzwi
    retractall(door_status(_)),
    assertz(door_status(open)),
    write('Dzięki użyciu znaku aard udało Ci się wyważyć drzwi.'), nl.

aard :- 
    write('Nie możesz użyć tego znaku w tym miejscu.'), nl.

% Predykat obsługujący próbę wejścia do wieży
enter(tower) :-
    i_am_at(f5),
    % Sprawdzenie, czy drzwi są otwarte
    door_status(open),
    % Próba wejścia do wieży
    write('Zdecydowałeś się wejść przez wyważone drzwi...'), nl.
    
enter(tower) :-
    i_am_at(f5),
    % Sprawdzenie, czy drzwi są zamknięte
    door_status(closed),
    % Informacja o zamkniętych drzwiach
    write('Drzwi są zamknięte, jednak zawiasy nie wydają się być wytrzymałe. Może powinieś użyć wiedzmińskiego znaku, aby je wyważyć.'), nl.

enter(tower) :-
    write('W tej okolicy nie ma żadnej wieży do której mógłbyś wejść.')

exit(tower) :-
    % insert operacje wyjścia z wieży