module Money where

import           Types

updateMoney :: Int -> GameState -> GameState
updateMoney amount gameState =
  let currentMoney = money gameState
      newMoney = currentMoney + amount
   in gameState {money = newMoney}

checkMoney :: GameState -> IO ()
checkMoney gameState = do
  putStrLn $ "Aktualna ilość orenów: " ++ show (money gameState)
