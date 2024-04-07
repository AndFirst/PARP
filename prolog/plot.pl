intro :-
    write('Geralt z Rivii przemierzając Velen dotarł w końcu na szlak wiodący do wsi Jaworek.'), nl,
    write('Po wielu dniach samotnej podróży, nadszedł czas by uzupełnić zapasy i rozejrzeć się za zleceniem.'), nl,
    write('Zbliżając się do wioski, czułe zmysły Białego Wilka natychmiast wychwyciły podejrzanie ślady...'), nl,
    nl,
    write('Zapoznaj się z zasadami rzucając zaklęcie \'komendy.\''), nl.

komendy :-
    nl,
    write('Wprowadź zaklęcia w Starszej Mowie (standardowej składni Prologa).'), nl,
    write('Dostępne zaklęcia:'), nl,
    write('n.  s.  e.  w.      -- aby przejść w danym kierunku.'), nl,
    write('idź(kierunek).       -- aby przejść w danym kierunku.'), nl,
    write('patrz.               -- aby ponownie rozejrzeć się obok siebie.'), nl,
    write('patrz(kierunek).     -- aby spojrzeć w jednym z czterech kierunków.'), nl,
    write('wejdz(miejsce).     -- aby wejść przez drzwi do spejalnych lokacji'), nl, 
    write('komendy.            -- aby ponownie zobaczyć tę wiadomość.'), nl,
    write('halt.               -- aby zakończyć grę i wyjść.'), nl,
    write('bestiariusz.        -- aby dowiedzieć się więcej o potworach.'), nl,
    write('monety.             -- aby sprawdzić ilość monet.'), nl,
    write('ekwipunek.          -- aby zobaczyć zawartość ekwipunku.'), nl,
    write('podnies(przedmiot). -- aby podnieść przedmiot.'), nl,
    write('uzyj(przedmiot).    -- aby użyć przedmiotu.'), nl,
    write('rozmawiaj(postać).   -- aby porozmawiać z postacią.'), nl,
    write('stworz_przynete.    -- aby stworzyć przynętę na gryfa.'), nl,
    write('wejdz. -- aby wejść do wieży.'), nl,
    write('wyjdz.  -- aby wyjść z wieży.'), nl,
    write('aard.  -- aby użyć znaku Aard.'), nl.


% Implementacja akcji związanej z użyciem przedmiotu (przykład)
bestiariusz :-
    write('Otwierasz bestiariusz i wyszukujesz informacje o Gryfie:'), nl,
    write('-> Gryf jest straszną bestią dominującą przestworza.'), nl,
    write('-> Zakłada gniazda w pobliżu pasm górskich.'), nl,
    write('-> Wywabić gryfa, stworzyć należy przynętę z siarki oraz jaskółczego ziela zawiniętego w krowie truchło.'), nl,
    write('-> Gryf wrażliwy jest na znak Aard, który strąci go z powietrza.'), nl,
    write('-> Aby zmusić go do walki w zwarciu, użyj kuszy.'), nl.


