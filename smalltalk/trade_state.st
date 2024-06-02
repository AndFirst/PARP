Object subclass: TradeState[
    |money equipment|

    TradeState class >> new[
        ^super new init
    ]   

    init[
        money := 0.
        equipment :=  nil.
    ]

    getMoney[
        ^money
    ]

    setMoney: aMoney[
        money := aMoney
    ]

    getEquipment[
        ^equipment
    ]

    setEquipment: anEquipment[
        equipment := anEquipment
    ]
]