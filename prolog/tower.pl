% Dynamiczny predykat śledzący stan drzwi (otwarte/zamknięte)
:- dynamic door_status/1.

% Predykat inicjalizujący początkowy stan drzwi (zamknięte)
init_door :-
    retractall(door_status(_)),
    assertz(door_status(closed)).

% Predykat otwierający drzwi
aard :-
    i_am_at(f5),
    door_status(open),
    write('Drzwi zostały już otwarte, nie musisz tego robić ponownie.'), nl,
    !. 

aard :-
    i_am_at(f5),
    retractall(door_status(_)),
    assertz(door_status(open)),
    write('Dzięki użyciu znaku aard udało Ci się wyważyć drzwi.'), nl,
    !.

aard :- 
    write('Nie możesz użyć tego znaku w tym miejscu.'), nl.


enter(tower) :-
    i_am_at(f5),
    door_status(open),
    write('Zdecydowałeś się wejść przez wyważone drzwi...'), nl,
    go(x),
    !.

enter(tower) :-
    i_am_at(f5),
    door_status(closed),
    write('Drzwi są zamknięte, jednak zawiasy nie wydają się być wytrzymałe. Może powinieś użyć wiedzmińskiego znaku, aby je wyważyć.'), nl,
    !.

enter(tower) :-
    write('W tej okolicy nie ma żadnej wieży do której mógłbyś wejść.'), nl.

exit(tower) :-
    i_am_at(f5b),
    write('Zdecydowałeś się wyjść z wieży...'), nl,
    go(x).
    
