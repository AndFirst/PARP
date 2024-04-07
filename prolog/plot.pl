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
    wrtie('Go(kierunek).     -- aby przejść w danym kierunku.'), nl,
    write('look.              -- aby ponownie rozejrzeć się obok siebie.'), nl,
    write('look(kierunek).    -- aby spojrzeć w jednym z czterech kierunków.'), nl,
    write('enter(miejsce).    -- aby wejść przez drzwi do spejalnych lokacji'), nl, 
    write('instructions.      -- aby ponownie zobaczyć tę wiadomość.'), nl,
    write('halt.              -- aby zakończyć grę i wyjść.'), nl,
    write('Bestiariusz.       -- aby dowiedzieć się więcej o potworach.'), nl,
    write('monety.            -- aby sprawdzić ilość monet.'), nl,
    write('display_inventory. -- aby zobaczyć zawartość ekwipunku.'), nl,
    write('podnies(przedmiot). -- aby podnieść przedmiot.'), nl,
    write('use(przedmiot).    -- aby użyć przedmiotu.'), nl,
    write('interact(postać). -- aby porozmawiać z postacią.'), nl,
    write('craft_bait.      -- aby stworzyć przynętę na gryfa.'), nl,
    write('-----------------------------------------------------------------'), nl.
    write('W wieży Babel:'), nl,
    write('enter. -- aby wejść do wieży.'), nl,
    write('exit.  -- aby wyjść z wieży.'), nl,
    write('aard.  -- aby użyć znaku Aard.'), nl.


% Implementacja akcji związanej z użyciem przedmiotu (przykład)
bestiariusz :-
    write('Otwierasz bestiariusz i wyszukujesz informacje o Gryfie:'), nl,
    write('-> Gryf jest straszną bestią dominującą przestworza.'), nl,
    write('-> Zakłada gniazda w pobliżu pasm górskich.'), nl,
    write('-> Wywabić gryfa, stworzyć należy przynętę z siarki oraz jaskółczego ziela zawiniętego w krowie truchło.'), nl,
    write('-> Gryf wrażliwy jest na znak Aard, który strąci go z powietrza.'), nl,
    write('-> Aby zmusić go do walki w zwarciu, użyj kuszy.'), nl.


