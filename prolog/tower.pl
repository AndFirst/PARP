% Dynamiczny predykat śledzący stan drzwi (otwarte/zamknięte)
:- dynamic door_status/1.

% Predykat inicjalizujący początkowy stan drzwi (zamknięte)
init_door :-
    retractall(door_status(_)),
    assertz(door_status(closed)).

:-   initialization(init_door).

% Predykat otwierający drzwi
aard :-
    i_am_at(f5),
    door_status(open),
    % Informacja o otwartych drzwiach
    write('Wrota wieży babel zostały już otwarte, nie marnuj magicznej energii.'), nl,
    !. % Przerwij dalsze działanie predykatu

aard :-
    i_am_at(f5),
    retractall(door_status(_)),
    assertz(door_status(open)),
    write('Dzięki użyciu znaku Aard udało Ci się wyważyć wrota wieży Babel.'), nl.

aard :- 
    write('Nie powinienem rzucać znaków nadaremno. Co by Vesemir powiedział...'), nl.

% Predykat obsługujący próbę wejścia do wieży
wejdz :-
    i_am_at(f5),
    % Sprawdzenie, czy drzwi są otwarte
    door_status(open),
    % Próba wejścia do wieży
    write('Zdecydowałeś się wejść przez wyważone wrota... Po drugiej stronie spotyka cię obraz nędzy i rozpaczy.'), nl,
    write('Wszędzie widać zwłoki, a na ścianach magiczne malunki z krwi. Wszystko wskazuje na to, że wieża została zaatakowana przez potwory.'), nl,
    write('Przy szczątkach wiedźmina ze szkoły Gryfa zauważasz jego srebrny miecz. Wygląda na dzieło mistrza Harr Nasia z Pvogrodu.'), nl,
    write('Tak potęzny oręż na pewno przyda się w nadchodzącej bitwie, lub przyniesie spory zysk.'), nl,
    idź(x).
    
wejdz :-
    i_am_at(f5),
    % Sprawdzenie, czy drzwi są zamknięte
    door_status(closed),
    % Informacja o zamkniętych drzwiach
    write('Wrota są zamknięte, jednak zawiasy nie wydają się być dość wytrzymałe by stanowiły przeszkodę. Powiniem użyć wiedzmińskiego znaku, aby je wyważyć.'), nl.

wejdz:-
    write('W tej okolicy nie ma żadnej wieży do której mógłbyś wejść. Ogranicz spożycie fisstechu...'), nl.

wyjdz :-
    i_am_at(f5b),
    write('Zdecydowałeś się wyjść z wieży...'), nl,
    idź(x).

wyjdz :-
    write('Nie możesz wyjść z wieży, jeśli w niej nie jesteś...'), nl.
