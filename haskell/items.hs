module Items where

import           Types

herb :: Item
herb = "polne ziele"

sword :: Item
sword = "gwyhyr"

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
