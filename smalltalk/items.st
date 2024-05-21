Object subclass: Item [
    name [
        self raiseError
    ]
]

Item subclass: Skin [
    name [
        ^'Skóra'
    ]
]


Item subclass: Herb [ 
    name [
        ^'Ziele'
    ]
]
