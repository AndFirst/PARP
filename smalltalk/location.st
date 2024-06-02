Object subclass: Location [
    describe [
        self raiseError
    ]
]

Location subclass: WestMountains [
    describe [
        ^'Zachodni szczyt Gór Va-Matz'
    ]
]

Location subclass: Ridge [
    describe [
        ^'Niedostępna grań Gór Va-Matz'
    ]
]

Location subclass: Mountains [
    describe [
        ^'Wysokie Góry Va-Matz'
    ]
]

Location subclass: EastMountains [
    describe [
        ^'Wschodnie szczyty Gór Va-Matz'
    ]
]

Location subclass: Forest [
    describe [
        ^'Bór K-Backi. Czuć dobiegającą z niego gęstą esencję Leszych...'
    ]
]

Location subclass: Canyon [
    describe [
        ^'Malowniczy kanion prowadzący do jaskini.'
    ]
]

Location subclass: CliffCanyon [
    describe [
        ^'Potężny klif na końcu kanionu.'
    ]
]

Location subclass: CanyonWall [
    describe [
        ^'Niedostępne zbocze kanionu.'
    ]
]

Location subclass: Hill [
    describe [
        ^'Strome zbocze prowadzące do wieży Bab-el.'
    ]
]

Location subclass: Cave [
    describe [
        ^'Tajemnicza jaskinia. Z jakiegoś powodu nie wygląda, żeby żadne potwory chciały się tam zapuszczać...'
    ]
]

Location subclass: Nest [
    describe [
        ^'Gniazdo gryfa.'
    ]
]

Location subclass: Village [
    describe [
        ^'Wies Jaworek'
    ]
]

Location subclass: Tower [
    describe [
        ^'Wieża Bab-el. Obok znajdują się ruiny drugiej, ewidentnie uderzonej przez Wiwernę'
    ]
]

Location subclass: InsideTower [
    describe [
        ^'Wnętrze wieży Bab-el. Zdaje się, że nikt tu dawno nie zaglądał.'
    ]
]

Location subclass: Lake [
    describe [
        ^'Jezioro emanujące elficką magią.'
    ]
]

Location subclass: Meadow [
    describe [
        ^'Łąka, na której pasą się krowy'
    ]
]

Location subclass: Other [
    describe [
        ^'Równiny pełne roślinności'
    ]
]

Location subclass: IllegalMove [
    describe [
        ^'Miejsce nie do przejścia'
    ]
]

Location subclass: OutOfBounds [
    describe [
        ^'Miejsce poza mapą'
    ]
]