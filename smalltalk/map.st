Object subclass: Map [
    | places  insideTower mTower|

    Map class >> new [
        | m |
        m := super new.
        m init.
        ^m
    ]

    init [
        FileStream fileIn: 'place.st'.
        FileStream fileIn: 'location.st'.
        FileStream fileIn: 'characters.st'.
        FileStream fileIn: 'opponents.st'.
        FileStream fileIn: 'items.st'.
        FileStream fileIn: 'tower.st'.


        insideTower := false.
        mTower := TowerBuilding new.

        places := Array new: 7.
        1 to: 7 do: [:i |
            places at: i put: (Array new: 7).
            1 to: 7 do: [:j |
                (places at: i) at: j put: Place new.
            ]
        ].

        self initLocations.
        self initNPCs.
        self initOpponents.
        self initItems.
    ]
    initLocations [
        | westMountains ridge mountains eastMountains forest canyon cliffCanyon canyonWall hill cave nest village tower lake meadow other illegalMove outOfBounds |
        westMountains := WestMountains new.
        ridge := Ridge new.
        mountains := Mountains new.
        eastMountains := EastMountains new.
        forest := Forest new.
        canyon := Canyon new.
        cliffCanyon := CliffCanyon new.
        canyonWall := CanyonWall new.
        hill := Hill new.
        cave := Cave new.
        nest := Nest new.
        village := Village new.
        tower := Tower new.
        lake := Lake new.
        meadow := Meadow new.
        other := Other new.

        self setLocationAt: 1 at: 1 to: westMountains.
        self setLocationAt: 1 at: 2 to: ridge.
        self setLocationAt: 1 at: 3 to: ridge.
        self setLocationAt: 1 at: 4 to: mountains.
        self setLocationAt: 1 at: 5 to: ridge.
        self setLocationAt: 1 at: 6 to: eastMountains.
        self setLocationAt: 1 at: 7 to: eastMountains.

        self setLocationAt: 2 at: 1 to: other.
        self setLocationAt: 2 at: 2 to: meadow.
        self setLocationAt: 2 at: 3 to: meadow.
        self setLocationAt: 2 at: 4 to: other.
        self setLocationAt: 2 at: 5 to: other.
        self setLocationAt: 2 at: 6 to: other.
        self setLocationAt: 2 at: 7 to: nest.

        self setLocationAt: 3 at: 1 to: other.
        self setLocationAt: 3 at: 2 to: other.
        self setLocationAt: 3 at: 3 to: village.
        self setLocationAt: 3 at: 4 to: other.
        self setLocationAt: 3 at: 5 to: other.
        self setLocationAt: 3 at: 6 to: other.
        self setLocationAt: 3 at: 7 to: other.

        self setLocationAt: 4 at: 1 to: forest.
        self setLocationAt: 4 at: 2 to: other.
        self setLocationAt: 4 at: 3 to: other.
        self setLocationAt: 4 at: 4 to: other.
        self setLocationAt: 4 at: 5 to: other.
        self setLocationAt: 4 at: 6 to: lake.
        self setLocationAt: 4 at: 7 to: lake.

        self setLocationAt: 5 at: 1 to: forest.
        self setLocationAt: 5 at: 2 to: other.
        self setLocationAt: 5 at: 3 to: other.
        self setLocationAt: 5 at: 4 to: other.
        self setLocationAt: 5 at: 5 to: other.
        self setLocationAt: 5 at: 6 to: lake.
        self setLocationAt: 5 at: 7 to: lake.

        self setLocationAt: 6 at: 1 to: cliffCanyon.
        self setLocationAt: 6 at: 2 to: canyon.
        self setLocationAt: 6 at: 3 to: canyon.
        self setLocationAt: 6 at: 4 to: hill.
        self setLocationAt: 6 at: 5 to: tower.
        self setLocationAt: 6 at: 6 to: lake.
        self setLocationAt: 6 at: 7 to: lake.

        self setLocationAt: 7 at: 1 to: other.
        self setLocationAt: 7 at: 2 to: canyonWall.
        self setLocationAt: 7 at: 3 to: cave.
        self setLocationAt: 7 at: 4 to: canyonWall.
        self setLocationAt: 7 at: 5 to: lake.
        self setLocationAt: 7 at: 6 to: lake.
        self setLocationAt: 7 at: 7 to: lake.
    ]

    initNPCs [
        self addNpcAt: 3 at: 3 to: Inkeeper new.
        self addNpcAt: 3 at: 3 to: Trader new.
    ]

    initOpponents [
        self addOpponentAt: 2 at: 2 to: Cow new.
        self addOpponentAt: 2 at: 2 to: Cow new.

        self addOpponentAt: 2 at: 3 to: Cow new.
        self addOpponentAt: 2 at: 3 to: Cow new.
        self addOpponentAt: 2 at: 3 to: Cow new.

        self addOpponentAt: 3 at: 7 to: Cow new.
    ]
    

    initItems [
        self addItemAt: 2 at: 5 to: Herb new.

        self addItemAt: 3 at: 1 to: Herb new.

        self addItemAt: 4 at: 3 to: Herb new.
        self addItemAt: 4 at: 3 to: Herb new.

        self addItemAt: 5 at: 4 to: Herb new.
    ]

    getPlaceAt: j at: i [
        | row |
        row := places at: i.
        ^row at: j
    ]

    setLocationAt: i at: j to: aLocation [
        | place row |
        row := places at: i.
        place := row at: j.
        place setLocation: aLocation.
        row at: j put: place.
    ]

    addNpcAt: i at: j to: aNPC [
        | place row |
        row := places at: i.
        place := row at: j.
        place addNPC: aNPC.
        row at: j put: place.
    ]

    addOpponentAt: i at: j to: anOpponent [
        | place row |
        row := places at: i.
        place := row at: j.
        place addOpponent: anOpponent.
        row at: j put: place.
    ]

    addItemAt: i at: j to: anItem [
        | place row |
        row := places at: i.
        place := row at: j.
        place addItem: anItem.
        row at: j put: place.
    ]

    getItemByNameAt: j at: i name: aName [
        | place row |
        insideTower ifTrue: [^mTower getItemByName: aName ].
        row := places at: i.
        place := row at: j.
        ^place getItemByName: aName
    ]

    getEnemyByNameAt: j at: i name: aName [
        | place row |
        insideTower ifTrue: [^nil ].
        row := places at: i.
        place := row at: j.
        ^place getEnemyByName: aName
    ]

    removeItemAt: j at: i itemInstance: anItem [
        | place row |
        insideTower ifTrue: [^mTower removeItem: anItem ].
        row := places at: i.
        place := row at: j.
        place removeItem: anItem.
        row at: j put: place.
    ]

    removeEnemyAt: j at: i enemyInstance: anEnemy [
        | place row |
        insideTower ifFalse: [
            row := places at: i.
            place := row at: j.
            place removeOpponent: anEnemy.
            row at: j put: place.
        ]
    ]

    describeAt: j at: i [
        insideTower ifTrue: [^mTower describe ]
        ifFalse: [
            | place row |
            row := places at: i.
            place := row at: j.        
            ^place describe
        ]
    ]

    enterTower [
        insideTower := true.
    ]

    exitTower [
        insideTower := false.
    ]

    inTower [
        ^insideTower
    ]

    getTower [
        ^mTower
    ]
]