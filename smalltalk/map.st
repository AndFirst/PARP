Object subclass: Map [
    | places |

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
        | westMountains ridge mountains eastMountains forest canyon cliffCanyon canyonWall hill cave nest village tower insideTower lake meadow other illegalMove outOfBounds |
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
        insideTower := InsideTower new.
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
        | inkeeper trader |
        trader := Trader new.
        inkeeper := Inkeeper new.

        self addNpcAt: 3 at: 3 to: inkeeper.
        self addNpcAt: 3 at: 3 to: trader.
    ]

    initOpponents [
        self addOpponentAt: 3 at: 3 to: Cow new.
    ]

    initItems [
        self addItemAt: 3 at: 3 to: Skin new.
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

    describeAt: j at: i [
        | place row |
        row := places at: i.
        place := row at: j.        
        ^place describe
    ]
]