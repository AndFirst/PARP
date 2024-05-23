Object subclass: Item [
    name [
        ^'Przedmiot'
    ]

    sellPrice [
        ^0
    ]

    use: aPlace[
        ^false
    ]

    print: aString [
        Transcript show: aString; cr
    ]
]

Item subclass: Skin [
    name [
        ^'Skóra'
    ]

    sellPrice [
        ^5
    ]
]

Item subclass: Card [
    name [
        ^'Karta do gry w Gwinta'
    ]

    sellPrice [
        ^15
    ]
]

Item subclass: Herb [ 
    name [
        ^'Ziele'
    ]

    sellPrice [
        ^1
    ]
]

Item subclass: Sword[
    name [
        ^'Gwyhyr'
    ]

    sellPrice [
        ^50
    ]
]

Item subclass: Sulfur[
    name [
        ^'Siarka'
    ]

    sellPrice [
        ^15
    ]
]

Item subclass: Bait[
    name [
        ^'Przynęta'
    ]

    sellPrice [
        ^0
    ]

    use: aPlace[
        aPlace getLocation class printString = 'Nest' ifTrue: [
            aPlace addOpponent: Griffin new.
            self print: 'Postawiłeś przynętę, gryf powinien się lada moment zjawić...'.
            self print: 'Słysz jak gryf przylatuje do gniazda, czas na niego zapolować.'.
            ^ true
        ].
        ^ false
    ]
]
