Object subclass: Game [
    | isGameOver commands money equipment map x y |

    introductionText := #(
    'Geralt z Rivii przemierzając Velen dotarł w końcu na szlak wiodący do wsi Jaworek.'
    'Po wielu dniach samotnej podróży, nadszedł czas by uzupełnić zapasy i rozejrzeć się za zleceniem.'
    'Zbliżając się do wioski, czułe zmysły Białego Wilka natychmiast wychwyciły podejrzanie ślady...'
    'Zapoznaj się z zasadami rzucając zaklęcie ''komendy''.'
    ).

    instructionsText := #(
    'Wprowadź zaklęcia w Starszej Mowie.'
    'Dostępne zaklęcia:'
    'n  s  e  w           -- aby przejść w danym kierunku.'
    'idz <kierunek>       -- aby przejść w danym kierunku.'
    'patrz                -- aby ponownie rozejrzeć się obok siebie.'
    'patrz <kierunku>     -- aby spojrzeć w jednym z czterech kierunków.'
    'komendy              -- aby ponownie zobaczyć tę wiadomość.'
    'zakoncz              -- aby zakończyć grę i wyjść.'
    'bestiariusz          -- aby dowiedzieć się więcej o potworach.'
    'monety               -- aby sprawdzić ilość monet.'
    'ekwipunek            -- aby zobaczyć zawartość ekwipunku.'
    'podnies <przedmiot>  -- aby podnieść przedmiot.'
    'uzyj  <przedmiot>    -- aby użyć przedmiotu.'
    'rozmawiaj <postac>   -- aby porozmawiać z postacią.'
    'stworz_przynete      -- aby stworzyć przynętę na gryfa.'
    'atakuj <przeciwnik>  -- aby zaatakować przeciwnika.'
    'wejdz                -- aby wejść do wieży.'
    'wyjdz                -- aby wyjść z wieży.'
    'aard                 -- aby użyć znaku Aard.'
    ).

    Game class >> new [
        | g |
        g := super new.
        g init.
        ^g
    ]

    init [
        FileStream fileIn: 'map.st'.
        FileStream fileIn: 'items.st'.
        isGameOver := false.
        money := 0.
        equipment := Set new.
        map := Map new.
        commands := Dictionary new.
        x := 3.
        y := 3.
        self initializeCommands.
    ]

    initializeCommands [
    commands at: 'n' put: [ :args | self handleGoNorth ].
    commands at: 's' put: [ :args | self handleGoSouth ].
    commands at: 'e' put: [ :args | self handleGoEast ].
    commands at: 'w' put: [ :args | self handleGoWest ].
    commands at: 'idz' put: [ :args | self handleGo: args ].
    commands at: 'patrz' put: [ :args | self handleLook: args ].
    commands at: 'bestiariusz' put: [ :args | self printBestiary ].
    commands at: 'monety' put: [ :args | self checkMoney ].
    commands at: 'ekwipunek' put: [ :args | self printEquipment ].
    commands at: 'podnies' put: [ :args | self handlePickUp: args ].
    commands at: 'atakuj' put: [ :args | self handleAttack: args ].
    commands at: 'uzyj' put: [ :args | self handleUseItem: args ].
    commands at: 'rozmawiaj' put: [ :args | self handleTalk: args ].
    commands at: 'stworz_przynete' put: [ :args | self craftBait ].
    commands at: 'wejdz' put: [ :args | self handleEnterTower ].
    commands at: 'wyjdz' put: [ :args | self handleExitTower ].
    commands at: 'aard' put: [ :args | self useAard ].
    commands at: 'komendy' put: [ :args | self printCommands ].
    commands at: 'zakoncz' put: [ :args | self outro ].
    ]

    outro [
        self print: 'Koniec gry.'.
        isGameOver := true
    ]

    printLines: anArray [
        anArray do: [ :string | Transcript show: string; cr ]
    ]

    print: aString [
        Transcript show: aString; cr
    ]

    printIntro [
       self printLines: introductionText.
    ]

    printCommands [
        self printLines: instructionsText.
    ]

    readCommand [
        self print: ''.
        Transcript show: '> '.
        ^ FileStream stdin nextLine
    ]

    run [
        | cmdParts cmd action |

        self printIntro.

        [isGameOver] whileFalse: [
            cmdParts := (self readCommand subStrings) asArray.
            cmd := cmdParts first.
            action := commands at: cmd ifAbsent: [nil].
            action
                ifNotNil: [ action value: cmdParts allButFirst ]
                ifNil: [ self print: 'Nieznana komenda.' ]
        ]
    ]

    checkMoney [
        self print: 'Masz ', money printString, ' monet w sakiewce.'
    ]

    printBestiary [
        self print: 'Otwierasz bestiariusz i wyszukujesz informacje o Gryfie:'.
        self print: '-> Gryf jest straszną bestią dominującą przestworza.'.
        self print: '-> Zakłada gniazda w pobliżu pasm górskich.'.
        self print: '-> Wywabić gryfa, stworzyć należy przynętę z siarki oraz jaskółczego ziela zawiniętego w krowie truchło.'.
        self print: '-> Gryf wrażliwy jest na znak Aard, który strąci go z powietrza.'.
        self print: '-> Aby zmusić go do walki w zwarciu, użyj kuszy.'
    ]

    handleGo: args [
        args isEmpty ifTrue: [ ^self print: 'Nie podałeś kierunku.']
            ifFalse: [
                |direction|
                direction := args first.
                (direction = 'n') ifTrue: [ ^self handleGoNorth ].
                (direction = 's') ifTrue: [ ^self handleGoSouth ].
                (direction = 'w') ifTrue: [ ^self handleGoWest ].
                (direction = 'e') ifTrue: [ ^self handleGoEast ].
                self print: 'Nie ma takiego kierunku.'
            ]
    ]
    
    handleGoNorth [
        map inTower ifTrue: [ ^self print: 'Jesteś w wieży, najpierw wyjdź na zwenątrz.'].
        self print: 'Idziesz na północ.'.
        y = 1 ifTrue: [ ^self print: 'Chcesz wyjść poza mapę.' ]
        ifFalse: [
            |description|
            y := y - 1.
            description := map describeAt: x at: y.
            self print: description.
        ]
    ]

    handleGoSouth [
        map inTower ifTrue: [ ^self print: 'Jesteś w wieży, najpierw wyjdź na zwenątrz.'].
        self print: 'Idziesz na południe.'. 
        y = 7 ifTrue: [ ^self print: 'Chcesz wyjść poza mapę.' ]
        ifFalse: [
            |description|
            y := y + 1.
            description := map describeAt: x at: y.
            self print: description.
        ]
    ]

    handleGoWest [
        map inTower ifTrue: [ ^self print: 'Jesteś w wieży, najpierw wyjdź na zwenątrz.'].
        self print: 'Idziesz na zachód.'.
        x = 1 ifTrue: [ ^self print: 'Chcesz wyjść poza mapę.' ]
        ifFalse: [
            |description|
            x := x - 1.
            description := map describeAt: x at: y.
            self print: description.
        ]
    ]

    handleGoEast [
        map inTower ifTrue: [ ^self print: 'Jesteś w wieży, najpierw wyjdź na zwenątrz.'].
        self print: 'Idziesz na wschód.'.
        x = 7 ifTrue: [ ^self print: 'Chcesz wyjść poza mapę.' ]
        ifFalse: [
            |description|
            x := x + 1.
            description := map describeAt: x at: y.
            self print: description.
        ]
    ]

    handleLook: args [
        args isEmpty ifTrue: [ ^self handleLookAround]
            ifFalse: [
                |direction|
                map inTower ifTrue: [ ^self print: 'Jesteś w wieży, najpierw wyjdź na zwenątrz.'].
                direction := args first.
                (direction = 'n') ifTrue: [ ^self handleLookNorth ].
                (direction = 's') ifTrue: [ ^self handleLookSouth ].
                (direction = 'w') ifTrue: [ ^self handleLookWest ].
                (direction = 'e') ifTrue: [ ^self handleLookEast ].
                self print: 'Nie ma takiego kierunku.'
            ]
    ]

    handleLookNorth [
        self print: 'Patrzysz na północ.'.
        y = 1 ifTrue: [ ^self print: 'Patrzysz poza mapę.' ]
        ifFalse: [
            |description|
            description := map describeAt: x at: y - 1.
            self print: description.
        ]
    ]

    handleLookSouth [
        self print: 'Patrzysz na południe.' .
        y = 7 ifTrue: [ ^self print: 'Patrzysz poza mapę.' ]
        ifFalse: [
            |description|
            description := map describeAt: x at: y + 1.
            self print: description.
        ]
    ]

    handleLookWest [
        self print: 'Patrzysz na zachód.' .
        x = 1 ifTrue: [ ^self print: 'Patrzysz poza mapę.' ]
        ifFalse: [
            |description|
            description := map describeAt: x - 1 at: y.
            self print: description.
        ]    
    ]

    handleLookEast [
        self print: 'Patrzysz na wschód.' .
        x = 7 ifTrue: [ ^self print: 'Patrzysz poza mapę.' ]
        ifFalse: [
            |description|
            description := map describeAt: x + 1 at: y.
            self print: description.
        ]    
    ]

    handleLookAround [
        |description|
        self print: 'Patrzysz dookoła siebie.'.
        description := map describeAt: x at: y.
        self print: description.
    ]

    handlePickUp: args [
        args isEmpty ifTrue: [ ^self print: 'Nie podałeś przedmiotu.']
        ifFalse: [
                |itemName item|
                itemName := args first.
                item := map getItemByNameAt: x at: y name: itemName.
                item ifNil: [ ^self print: 'Nie ma tutaj takiego przedmiotu.'].
                equipment add: item.
                map removeItemAt: x at: y itemInstance: item. 
                self print: 'Podnosisz przedmiot: ', itemName.
            ]
    ]

    printEquipment [
        equipment do: [ :item | self print: item name].
    ]

    handleAttack: args [
        args isEmpty ifTrue: [ ^self print: 'Nie podałeś przeciwnika.']
        ifFalse: [
                |enemyName enemy drop |
                enemyName := args first.
                enemy := map getEnemyByNameAt: x at: y name: enemyName.
                enemy ifNil: [ ^self print: 'Nie ma tutaj takiego przeciwnika.'].
                self print: 'Atakujesz przeciwnika: ', enemyName.
                enemy attack ifTrue: [  
                    self print: 'Pokonałeś przeciwnika: ', enemyName.
                    drop := enemy getDrop.
                    drop ifNotNil: [ 
                        equipment add: drop.
                        self print: 'Otrzymujesz przedmiot: ', drop name.
                    ].
                    map removeEnemyAt: x at: y enemyInstance: enemy.
                ] 
                ifFalse: [
                    self print: 'Przeciwnik: ', enemyName, ' pokonał Cię. Koniec gry.'.
                    isGameOver := true.
                ]
        ]
    ]

    handleTalk: args [
        args isEmpty ifTrue: [ ^self print: 'Nie podałeś postaci.']
            ifFalse: [
                |character|
                character := args first.
                self print: 'Rozmawiasz z postacią: ', character
            ]
    ]

    handleUseItem: args [
        args isEmpty ifTrue: [ ^self print: 'Nie podałeś przedmiotu.']
            ifFalse: [
                |item|
                item := args first.
                self print: 'Używasz przedmiotu: ', item
            ]
    ]

    craftBait [
        | equipmentCounter skinQuantity herbQuantity sulfurQuantity|
        equipmentCounter := Dictionary new.
        equipment do: [:item |
            equipmentCounter at: item class printString ifAbsentPut: [0].
            equipmentCounter at: item class printString put: (equipmentCounter at: item class printString) + 1
        ].
        skinQuantity := equipmentCounter at: 'Skin' ifAbsent: [0].
        sulfurQuantity := equipmentCounter at: 'Sulfur' ifAbsent: [0].
        herbQuantity := equipmentCounter at: 'Herb' ifAbsent: [0].

        (skinQuantity > 1 and: [sulfurQuantity > 0 and: [herbQuantity > 1]]) 
            ifTrue: [
                equipment add: Bait new.
                self removeItemFromEquipment: 'Herb'.
                self removeItemFromEquipment: 'Herb'.
                self removeItemFromEquipment: 'Sulfur'.
                self removeItemFromEquipment: 'Skin'.
                self removeItemFromEquipment: 'Skin'.

                self print: 'Stworzyłeś przynętę na gryfa.'
            ]
            ifFalse: [
                self print: 'Nie masz wystarczającej ilości składników.'
        ]
    ]

    removeItemFromEquipment: itemClass [
        | itemToRemove |
        itemToRemove := equipment detect: [:item | item class printString = itemClass] ifNone: [nil].
        itemToRemove ifNotNil: [
            equipment remove: itemToRemove
        ] ifNil: [
            self print: 'Nie znaleziono przedmiotu klasy ', itemClass printString, ' w ekwipunku.'
        ]
    ]
    
    handleEnterTower [
        | place |
        place := map getPlaceAt: x at: y.
        place getLocation class = Tower ifTrue: [ 
            map inTower ifTrue: [^self print: 'Jesteś już w wieży...'].
            map getTower isClosed ifTrue: [^self print: 'Drzwi zakmknięte. Gdybym tylko mógł je jakoś otworzyć...'].
            self print: 'Wchodzisz do wieży.'.
            map enterTower.
        ]
        ifFalse: [^self print: 'Nie wejdziesz do wieży jeśli jej tutaj nie ma...'].
    ]

    handleExitTower [
        | place |
        place := map getPlaceAt: x at: y.
        place getLocation class = Tower ifTrue: [ 
            map inTower ifTrue: [
                map exitTower.
                ^self print: 'Wychodzisz z wieży.'.
            ]
            ifFalse: [
                ^self print: 'Stoisz przed wieżą... Jak chcesz z niej wyjść...?'.
            ]
        ]
        ifFalse: [^self print: 'Nie ma tu nic, z czego mógłbyś wyjść.'].    
    ]

    useAard [
        | place|
        place := map getPlaceAt: x at: y.
        place getLocation class = Tower ifTrue: [
            map getTower isClosed ifTrue: [
                map getTower open.
                ^self print: 'Udało Ci się wyważyć drzwi przy pomocy znaku aard - w końcu będziesz w stanie wejść do wieży.'
            ]
            ifFalse: [
                ^self print: 'Drzwi są już otwarte, nie ma sensu ponownie traktować ich aardem.'
            ].
        ]
        ifFalse: [^self print: 'Nie możesz tutaj użyć znaku aard.'].
        ]
]

Game new run.