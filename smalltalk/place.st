Object subclass: Place [
    | location  npcs items opponents dangerous deathMessage|

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
        dangerous := false.
        deathMessage := ''.
    ]

    setDangerous: value [
        dangerous := value.
    ]

    isDangerous [
        ^dangerous
    ]

    setDeathMessage: aMessage [
        deathMessage := aMessage.
    ]

    getDeathMessage [
        ^deathMessage
    ]

    setLocation: aLocation [
        location := aLocation.
    ]    

    getLocation [
        ^location
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

    hasItem: anItemName [
        items do: [:item | 
            item name = anItemName ifTrue: [^true]
        ].
        ^false
    ]

    getItemByName: anItemName [
        items do: [:item | 
            item name = anItemName ifTrue: [^item]
        ].
        ^nil
    ]

    getEnemyByName: anEnemyName [
        opponents do: [:opponent | 
            opponent name = anEnemyName ifTrue: [^opponent]
        ].
        ^nil
    ]

    getCharacterByName: aCharacterName [
        npcs do: [:npc | 
            npc name = aCharacterName ifTrue: [^npc]
        ].
        ^nil
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
