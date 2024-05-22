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

Item subclass: Sword[
    name [
        ^'Gwyhyr'
    ]
]

Item subclass: Sulfur[
    name [
        ^'Siarka'
    ]
]

Item subclass: Bait[
    name [
        ^'Przynęta'
    ]
]
