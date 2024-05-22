Object subclass: Opponent [
    name [
        self raiseError
    ]

    getDrop [
        ^nil
    ]

    attack [
        self raiseError
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
        ^true   
    ]
]


Opponent subclass: Griffin [ 
    name [
        ^'Gryf'
    ]
]
