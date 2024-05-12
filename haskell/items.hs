module Items where

import           Types

herb :: Item
herb = "Ziele"

sword :: Item
sword = "Gwyhyr"

sulfur :: Item
sulfur = "Siarka"

leather :: Item
leather = "Krowia skóra"

bait :: Item
bait = "Przynęta"

trophy :: Item
trophy = "Trofeum z gryfa"

card :: Item
card = "Karta do gwinta - Vernon Roche (Partiota, ale zbój)"

printEquipment :: GameState -> IO ()
printEquipment gameState =
  if null (equipment gameState)
    then putStrLn "Twój ekwipunek jest pustszy niż głowa utopca."
    else do
      putStrLn "Twój ekwipunek zawiera:"
      mapM_ putStrLn (equipment gameState)

addItem :: Item -> GameState -> GameState
addItem item gameState = gameState {equipment = item : equipment gameState}

removeItem :: Item -> GameState -> GameState
removeItem item gameState =
  gameState {equipment = filter (/= item) (equipment gameState)}

buyItem :: Item -> Int -> GameState -> Either String GameState
buyItem item price gameState =
  if money gameState >= price
    then Right
           $ gameState
               { equipment = item : equipment gameState
               , money = money gameState - price
               }
    else Left "Niestety, potrzebujesz więcej orenów żeby to kupić."

sellItem :: Item -> Int -> GameState -> GameState
sellItem item price gameState =
  if item `elem` equipment gameState
    then gameState
           { equipment = filter (/= item) (equipment gameState)
           , money = money gameState + price
           }
    else gameState

craftBait :: GameState -> IO GameState
craftBait gameState =
  let requiredItems = [herb, herb, sulfur, leather, leather]
      playerItems = equipment gameState
   in if all (\item -> item `elem` playerItems) requiredItems
        then do
          let updatedEquipment = filter (`notElem` requiredItems) playerItems ++ ["Przynęta na gryfa"]
          putStrLn "Udało Ci się stworzyć przynętę na gryfa."
          return $ gameState { equipment = updatedEquipment }
        else do
          putStrLn "Nie masz wystarczającej ilości wymaganych przedmiotów."
          return gameState


getItemPrice :: Item -> Int
getItemPrice item
  | item == sword = 50
  | item == card = 15
  | item == sulfur = 15
  | item == leather = 5
  | otherwise = 0
