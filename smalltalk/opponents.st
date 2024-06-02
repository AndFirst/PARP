Object subclass: Opponent [
    name [
        self raiseError
    ]

    getDrop [
        ^nil
    ]

    attack [
        ^'L'
    ]

    print: aString [
        Transcript show: aString; cr
    ]

    readCommand [
        self print: ''.
        Transcript show: '> '.
        ^ FileStream stdin nextLine
    ]
]

Opponent subclass: Cow [
    name [
        ^'Krowa'
    ]

    getDrop [
        FileStream fileIn: 'items.st'.
        ^Skin new.
    ]

    attack [
        ^'W'   
    ]
]


Opponent subclass: Griffin [ 
    name [
        ^'Gryf'
    ]

    attack [
        | response |
        self print: 'Zaatakowałeś gryfa, wybierz co powinieneś zrobić'.
        self print: '1. Strzel z kuszy, by go powalić.'.
        self print: '2. Zaatakuj mieczem'.
        self print: '0. Uciekaj'.
        response := self readCommand.
        response = '' ifTrue: [
            self print: 'Nie ruszyłeś się. Niedobrze...'.
            ^'L'
        ].
        response = '1' ifTrue: [
            ^self crossbowAttack1
        ].
        response = '2' ifTrue: [
            ^self swordAttack1
        ].
        response = '0' ifTrue: [
            ^'E'
        ].
        self print: 'Co ty robisz...?'.
        ^'L'
    ]

    crossbowAttack1 [
        | response |
        self print: 'Udało Ci się trafć gryfa kuszą strącając go na ziemię.'.
        self print: 'Wybierz, co powinieneś zrobić następnie.'.
        self print: '1. Strzel z kuszy.'.
        self print: '2. Zaatakuj mieczem'.
        self print: '0. Uciekaj'. 
        response := self readCommand.
        response = '' ifTrue: [
            self print: 'Nie ruszyłeś się. Niedobrze...'.
            ^'L'
        ].
        response = '1' ifTrue: [
            ^self crossbowAttack2
        ].
        response = '2' ifTrue: [
            ^self griffinDeath
        ].
        response = '0' ifTrue: [
            ^'E'
        ].
        self print: 'Co ty robisz...?'.
        ^'L'
    ]

    crossbowAttack2 [
        | response |
        self print: 'Strzał kuszą w obalonego gryfa nie był wystarczający do zabicia bestii.'.
        self print: 'Wybierz, co powinieneś zrobić następnie.'.
        self print: '1. Strzel z kuszy.'.
        self print: '2. Zaatakuj mieczem'.
        self print: '0. Uciekaj'. 
        response := self readCommand.
        response = '' ifTrue: [
            self print: 'Nie ruszyłeś się. Niedobrze...'.
            ^'L'
        ].
        response = '1' ifTrue: [
            ^self crossbowAttack2
        ].
        response = '2' ifTrue: [
            ^self griffinDeath
        ].
        response = '0' ifTrue: [
            ^'E'
        ].
        self print: 'Co ty robisz...?'.
        ^'L'
    ]

    swordAttack1 [
        |response|
        self print: 'Nie udało Ci się trafić pikującego gryfa.'.
        self print: 'Uważaj, bo następnym razem gryf może Cię trafić.'.
        self print: '1. Strzel z kuszy.'.
        self print: '2. Zaatakuj mieczem'.
        self print: '0. Uciekaj'.
        response := self readCommand.
        response = '' ifTrue: [
            self print: 'Nie ruszyłeś się. Niedobrze...'.
            ^'L'
        ].
        response = '1' ifTrue: [
            ^self crossbowAttack1
        ].
        response = '2' ifTrue: [
            ^self swordAttack2
        ].
        response = '0' ifTrue: [
            ^'E'
        ].
        self print: 'Co ty robisz...?'.
        ^'L'
    ]

    swordAttack2 [
        self print: 'Pikujący gryf krytycznie trafił Cię szponem.'.
        self print: 'Niestety odniesiona rana okazała się fatalna i doprowadziła do Twojej śmierci.'.
        ^'L'
    ]

    griffinDeath [
        self print: 'Gryf padł martwy od ciosu miecza.'.
        ^'W'
    ]

]
