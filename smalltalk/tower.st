Object subclass: TowerBuilding [
    |closed items|
    TowerBuilding class >> new [
        | t |
        t := super new.
        t init.
        ^t
    ]

    init [
        FileStream fileIn: 'items.st'.
        closed := true.
        items := Set new.
        items add: Sword new.
    ]

    describe [
        | description |
        description := 'Wnętrze wieży Bab-el. Zdaje się, że nikt tu dawno nie zaglądał.', (String with: Character lf).
        items isEmpty ifFalse: [
            description := description, 'Przedmioty w tej lokalizacji: ', (String with: Character lf).
            items do: [:item | description := description, '    ', item name, (String with: Character lf)].
        ].
        ^description
    ]

    isClosed [
        ^closed
    ]

    open [
        closed := false
    ]

    getItemByName: anItemName [
        items do: [:item | 
            item name = anItemName ifTrue: [^item]
        ].
        ^nil
    ]

    removeItem: anItem [
        items remove: anItem.
    ]

    
]