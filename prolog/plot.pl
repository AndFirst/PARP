intro :-
    write('Geralt z Rivii przemierzając Velen dotarł w końcu na szlak wiodący do wsi Jaworek.'), nl,
    write('Po wielu dniach samotnej podróży, nadszedł czas by uzupełnić zapasy i rozejrzeć się za zleceniem.'), nl,
    write('Zbliżając się do wioski, czułe zmysły Białego Wilka natychmiast wychwyciły podejrzanie ślady...'), nl,
    nl,
    write('Zapoznaj się z zasadami rzucając zaklęcie \'instructions.\''), nl.

instructions :-
    nl,
    write('Wprowadź zaklęcia w Starszej Mowie (standardowej składni Prologa).'), nl,
    write('Dostępne zaklęcia:'), nl,
    write('n.  s.  e.  w.     -- aby przejść w danym kierunku.'), nl,
    write('look.              -- aby ponownie rozejrzeć się obok siebie.'), nl,
    write('look(kierunek).    -- aby spojrzeć w jednym z czterech kierunków.'), nl,
    write('enter(miejsce).    -- aby wejść przez drzwi do spejalnych lokacji'), nl, 
    write('instructions.      -- aby ponownie zobaczyć tę wiadomość.'), nl,
    write('halt.              -- aby zakończyć grę i wyjść.'), nl,
    nl.

% Implementacja akcji związanej z użyciem przedmiotu (przykład)
bestiariusz :-
    write('You open the bestiary and find information about Gryf:'), nl,
    write('- Gryf is a fearsome creature that dwells in dark caves.'), nl,
    write('- It is vulnerable to light-based attacks.'), nl.


