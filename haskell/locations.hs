module Locations where

import           Types

westMountains :: Location
westMountains = "Zachodni szczyt Gór Va'Matz"

ridge :: Location
ridge = "Niedostępna grań Gór Va'Matz"

mountains :: Location
mountains = "Wysokie Góry Va'Matz"

eastMountains :: Location
eastMountains = "Wschodnie szczyty Gór Va'Matz"

forest :: Location
forest = "Bór K'Backi. Czuć dobiegającą z niego gęstą esencję Leszych..."

canyon :: Location
canyon = "Malowniczy kanion prowadzący do jaskini."

cliffCanyon :: Location
cliffCanyon = "Potężny klif na końcu kanionu."

canyonWall :: Location
canyonWall = "Niedostępne zbocze kanionu."

hill :: Location
hill = "Strome zbocze prowadzące do wieży Bab'el."

cave :: Location
cave =
  "Tajemnicza jaskinia. Z jakiegoś powodu nie wygląda, żeby żadne potwory chciały się tam zapuszczać..."

nest :: Location
nest = "Gniazdo gryfa."

village :: Location
village = "Wies Jaworek"

tower :: Location
tower =
  "Wieża Bab'el. Obok znajdują się ruiny drugiej, ewidentnie uderzonej przez Wiwernę"

insideTower :: Location
insideTower = "Wnętrze wieży Bab'el. Zdaje się, że nikt tu dawno nie zaglądał."

lake :: Location
lake = "Jezioro emanujące elficką magią."

meadow :: Location
meadow = "Łąka, na której pasą się krowy"

other :: Location
other = "Równiny pełne roślinności"

illegalMove :: Location
illegalMove = "Miejsce nie do przejścia"

outOfBounds :: Location
outOfBounds = "Miejsce poza mapą"
