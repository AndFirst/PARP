Object subclass: Character [
    name [
        ^nil
    ]

    talkTo: tradeState[
        ^nil
    ]
    
    print: aString [
        Transcript show: aString; cr
    ]

    readCommand [
        self print: ''.
        Transcript show: '> '.
        ^ FileStream stdin nextLine
    ]
]

Character subclass: Trader [
    name [
        ^'Kupiec'
    ]

    talkTo: tradeState[
        | response |
        FileStream fileIn: 'items.st'.
        self print: 'Witaj Mistrzu wiedźminie! Czym mogę służyć?'.
        self print: '1. Pokaż mi swoje towary'.
        self print: '2. Sprzedaj przedmiot'.
        self print: '0. Wyjdź z rozmowy'.
        response := self readCommand.
        response = '' ifTrue: [
            self print: 'Nie rozumiem twojej odpowiedzi.'.
            ^tradeState
        ].
        response = '1' ifTrue: [
            self print: 'Pokażę ci swoje towary. Które z nich chcesz kupić?'.
            self print: '1. Siarka.                                                 15 orenów'.
            self print: '2. Karta do gwinta - Vernon Roche (Partiota, ale zbój)     15 orenów'.
            self print: '0. Wyjdź z rozmowy'.
            response := self readCommand.
            response = '' ifTrue: [
            self print: 'Nie rozumiem twojej odpowiedzi.'.
            ^tradeState
            ].
            response = '1' ifTrue: [
                tradeState getMoney < 15 ifTrue: [
                    self print: 'Niestety nie masz wystarczająco pieniędzy.'.
                    ^ tradeState
                ] ifFalse: [
                    tradeState setMoney: (tradeState getMoney - 15).
                    tradeState getEquipment add: Sulfur new.
                    self print: 'Kupiłeś siarkę za 15 orenów.'.
                    ^ tradeState
                ]
            ].
            response = '2' ifTrue: [
                tradeState getMoney < 15 ifTrue: [
                    self print: 'Niestety nie masz wystarczająco pieniędzy.'.
                    ^ tradeState
                ] ifFalse: [
                    tradeState setMoney: (tradeState getMoney - 15).
                    tradeState getEquipment add: Card new.
                    self print: 'Kupiłeś kartę do gwinta - Vernon Roche za 15 orenów.'.
                    ^ tradeState
                ]
            ].
            response = '0' ifTrue: [
                self print: 'Do zobaczenia!'.
                ^ tradeState
            ].
            self print: 'Nie rozumiem twojej odpowiedzi.'.
            ^ tradeState
        ].
        response = '2' ifTrue: [
            tradeState getEquipment isEmpty ifTrue: [
                self print: 'Nie masz nic do sprzedania.'.
                ^ tradeState
            ]
            ifFalse: [
                self print: 'Który przedmiot chcesz sprzedać?'.
                tradeState getEquipment do: [ :item | self print: item name , (String with: Character tab), item sellPrice printString, ' orenów'].
                response := self readCommand.
                response = '' ifTrue: [
                    self print: 'Nie podałeś przedmiotu.'.
                    ^tradeState
                ].
                tradeState getEquipment do: [ :item | 
                    response = item name ifTrue: [
                        tradeState setMoney: (tradeState getMoney + item sellPrice).
                        tradeState getEquipment remove: item.
                        self print: 'Sprzedałeś przedmiot: ', item name, ' za ', item sellPrice asString, ' orenów.'.
                        ^ tradeState
                ].
            self print: 'Nie masz takiego przedmiotu.'.
            ^ tradeState
            ].
        ].
        response = '0' ifTrue: [
            self print: 'Do zobaczenia!'.
            ^ tradeState
        ].
        self print: 'Nie rozumiem twojej odpowiedzi.'.
        ^tradeState
    ]
]
]


Character subclass: Inkeeper [ 
    name [
        ^'Karczmarka'
    ]

    talkTo: tradeState[
        self print: 'Chwała Wielkiemu Tooskowi! Mistrzu wiedźminie, przybywacie w idealnym momencie!'.
        self print: 'Nasza skromna wieś Jaworek terroryzowana jest przez bestię straszliwą...'.
        self print: 'Owa bestia przyleciała podobnóż z dalekich Va Do Widz, niszcząc wszystko na swojej drodze.'.
        self print: 'Nasze dzieci, nasze kobiety, nasze zwierzęta... nic nie jest bezpieczne przed jej żądzą.'.
        self print: 'Nie ma dnia byśmy nie drżeli w cieniu tego żółtego monstrum...'.
        self print: 'Bestyja ta w głowie ma tylko jedno. Niewiele...'.
        self print: 'Pomóżcie nam Mistrzu, a nie pożałujecie'.
        self print: 'Baron Ozjasz Goldberg, władca naszych ziem zapłaci kufer koron śmiałkowi który pokona bestię.'.
        self print: 'Czy zechcecie podjąć się tej misji?'.        
    ]
]
