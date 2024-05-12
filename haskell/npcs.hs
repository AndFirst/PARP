module NPCs where

import           Data.Maybe (listToMaybe)
import           Types
import           Items

trader :: NPC
trader = "kupiec"

innkeeper :: NPC
innkeeper = "karczmarka"

villager :: NPC
villager = "wieśniak"

fisherman :: NPC
fisherman = "rybak"

findPlaceByCoordinate :: Coordinate -> Places -> Maybe Place
findPlaceByCoordinate coord =
  listToMaybe . filter (\(c, _, _, _, _) -> c == coord)

isNPCInPlace :: NPC -> Coordinate -> Places -> Bool
isNPCInPlace npc coord places = 
    case findPlaceByCoordinate coord places of
        Just (_, _, npcs, _, _) -> npc `elem` npcs
        Nothing -> False

talk :: String -> GameState -> IO GameState
talk npc gameState = do
    let currentCoord = currentCoordinates gameState
        currentMap = currentMapState gameState
    if isNPCInPlace npc currentCoord currentMap
    then do
        case npc of
            "kupiec" -> talkTrader gameState
            -- "karczmarka" -> karczmarka_rozmowa
            -- "wieśniak" -> wieśniak_rozmowa
            -- "rybak" -> rybak_rozmowa
            _ -> putStrLn "Zaraza. Nie wiem, jak rozmawiać z tym odmieńcem." >> return gameState
    else do
        putStrLn "Nie ma tu tej postaci."
        return gameState
     
          
talkTrader :: GameState -> IO GameState
talkTrader gameState = do
    putStrLn "Witaj Mistrzu wiedźminie! Czym mogę służyć?"
    putStrLn "1. Pokaż mi swoje towary"
    putStrLn "2. Sprzedaj przedmiot"
    putStrLn "0. Wyjdź z rozmowy"
    opcja <- getLine
    case opcja of
        "1" -> do
            putStrLn "Pokażę ci swoje towary. Które z nich chcesz kupić?"
            putStrLn "1. Siarka."
            putStrLn "2. Karta do gwinta - Vernon Roche (Partiota, ale zbój)"
            putStrLn "0. Wyjdź z rozmowy"
            choice <- getLine
            case choice of
                "1" -> do 
                    let attemptBuySulfur = buyItem sulfur 15 gameState
                    case attemptBuySulfur of
                        Left msg -> do
                            putStrLn msg
                            return gameState
                        Right newGameState -> do
                            putStrLn "Kupiłeś siarkę za 15 orenów."
                            return newGameState
                "2" -> do
                    let attemptBuyCard = buyItem card 15 gameState
                    case attemptBuyCard of
                        Left msg -> do
                            putStrLn msg
                            return gameState
                        Right newGameState -> do
                            putStrLn "Kupiłeś kartę do gwinta z Vernonem Rochem za 15 orenów."
                            return newGameState
                "0" -> return gameState
                _ -> do
                    putStrLn "Niepoprawna opcja."
                    return gameState
        
        "2" -> do
            if null (equipment gameState)
                then do
                    putStrLn "Twój ekwipunek jest pustszy niż głowa utopca. Nie masz nic do sprzedania."
                    return gameState
            else do
                printEquipment gameState
                putStrLn "Wybierz przedmiot, który chcesz spieniężyć: "
                item <- getLine
                if item `elem` equipment gameState
                then do
                    let itemPrice = getItemPrice item
                    if itemPrice == 0
                    then do
                        putStrLn "Nie mogę sprzedać tego przedmiotu."
                        return gameState
                    else do
                        let attemptSellItem = sellItem item itemPrice gameState
                        putStrLn $ "Sprzedałeś " ++ item ++ " za " ++ show itemPrice ++ " orenów."
                        return attemptSellItem
                else do
                    putStrLn "Nie masz tego przedmiotu w ekwipunku."
                    return gameState

        "0" -> return gameState
        _ -> do
            putStrLn "Niepoprawna opcja."
            return gameState
