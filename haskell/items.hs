module Items where

import           Types

herb :: Item
herb = "Bagienne ziele"

sword :: Item
sword = "Miecz Gnomi Gwyhyr"

sulfur :: Item
sulfur = "Siarka"

leather :: Item
leather = "Krowia skóra"

bait :: Item
bait = "Przynęta na gryfa"

printEquipment :: GameState -> IO ()
printEquipment gameState =
  if null (equipment gameState)
    then putStrLn "Twój ekwipunek jest pusty."
    else do
      putStrLn "Twój ekwipunek zawiera:"
      mapM_ putStrLn (equipment gameState)

addItem :: Item -> GameState -> GameState
addItem item gameState = gameState {equipment = item : equipment gameState}

removeItem :: Item -> GameState -> GameState
removeItem item gameState =
  gameState {equipment = filter (/= item) (equipment gameState)}

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