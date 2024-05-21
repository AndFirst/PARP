Object subclass: Character [
    name [
        self raiseError
    ]

    talkTo [
        self raiseError
    ]
]

Character subclass: Trader [
    name [
        ^'Kupiec'
    ]

    talkTo [
        ^'Trader says: I am a trader'
    ]
]


Character subclass: Inkeeper [ 
    name [
        ^'Karczmarka'
    ]

    talkTo [
        ^'Innkeeper says: I am inkeeper'
    ]
]
