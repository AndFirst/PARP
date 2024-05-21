Object subclass: Place [
    | location  npcs items opponents|

    Place class >> new [
        | p |
        p := super new.
        p init.
        ^p
    ]

    init [
        location := nil.
        npcs := Set new.
        items := Set new.
        opponents := Set new.
    ]

    setLocation: aLocation [
        location := aLocation.
    ]    

    addNPC: aNpc [
        npcs add: aNpc.
    ]

    removeNPC: aNpc [
        npcs remove: aNpc.
    ]

    addOpponent: anOpponent [
        opponents add: anOpponent.
    ]

    removeOpponent: anOpponent [
        opponents remove: anOpponent.
    ]

    addItem: anItem [
        items add: anItem.
    ]

    removeItem: anItem [
        items remove: anItem.
    ]

    describe [
        | description |
        description := location describe, (String with: Character lf).
        npcs isEmpty ifFalse: [
            description := description, 'Postacie w tej lokalizacji: ', (String with: Character lf).
            npcs do: [:npc | description := description, '    ', npc name, (String with: Character lf)].
        ].
        items isEmpty ifFalse: [
            description := description, 'Przedmioty w tej lokalizacji: ', (String with: Character lf).
            items do: [:item | description := description, '    ', item name, (String with: Character lf)].
        ].
        opponents isEmpty ifFalse: [
            description := description, 'Przeciwnicy w tej lokalizacji: ', (String with: Character lf).
            opponents do: [:opponent | description := description, '    ', opponent name, (String with: Character lf)].
        ].
        ^description   
    ]
]
