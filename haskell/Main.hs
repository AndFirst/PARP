module Main where

import           Items
import           Map
import           Money
import           System.Exit (exitSuccess)
import           Types

intro :: IO ()
intro = do
  putStrLn
    "Geralt z Rivii przemierzając Velen dotarł w końcu na szlak wiodący do wsi Jaworek."
  putStrLn
    "Po wielu dniach samotnej podróży, nadszedł czas by uzupełnić zapasy i rozejrzeć się za zleceniem."
  putStrLn
    "Zbliżając się do wioski, czułe zmysły Białego Wilka natychmiast wychwyciły podejrzanie ślady..."
  putStrLn ""
  putStrLn "Zapoznaj się z zasadami rzucając zaklęcie 'komendy'."

printInstructions :: IO ()
printInstructions = do
  putStrLn ""
  putStrLn "Wprowadź zaklęcia w Starszej Mowie."
  putStrLn "Dostępne zaklęcia:"
  putStrLn "n  s  e  w           -- aby przejść w danym kierunku."
  putStrLn "idz <kierunek>       -- aby przejść w danym kierunku."
  putStrLn "patrz                -- aby ponownie rozejrzeć się obok siebie."
  putStrLn "patrz <kierunek>     -- aby spojrzeć w jednym z czterech kierunków."
  putStrLn "komendy              -- aby ponownie zobaczyć tę wiadomość."
  putStrLn "zakoncz              -- aby zakończyć grę i wyjść."
  putStrLn "bestiariusz          -- aby dowiedzieć się więcej o potworach."
  putStrLn "monety               -- aby sprawdzić ilość monet."
  putStrLn "ekwipunek            -- aby zobaczyć zawartość ekwipunku."
  putStrLn "podnies <przedmiot>  -- aby podnieść przedmiot."
  putStrLn "uzyj  <przedmiot>    -- aby użyć przedmiotu."
  putStrLn "rozmawiaj <postac>   -- aby porozmawiać z postacią."
  putStrLn "stworz_przynete      -- aby stworzyć przynętę na gryfa."
  putStrLn "wejdz                -- aby wejść do wieży."
  putStrLn "wyjdz                -- aby wyjść z wieży."
  putStrLn "aard                 -- aby użyć znaku Aard."

bestiary :: IO ()
bestiary = do
  putStrLn "Otwierasz bestiariusz i wyszukujesz informacje o Gryfie:"
  putStrLn "-> Gryf jest straszną bestią dominującą przestworza."
  putStrLn "-> Zakłada gniazda w pobliżu pasm górskich."
  putStrLn
    "-> Wywabić gryfa, stworzyć należy przynętę z siarki oraz jaskółczego ziela zawiniętego w krowie truchło."
  putStrLn "-> Gryf wrażliwy jest na znak Aard, który strąci go z powietrza."
  putStrLn "-> Aby zmusić go do walki w zwarciu, użyj kuszy."

outro :: IO ()
outro = do
  putStrLn ""
  putStrLn ""
  putStrLn ""
  putStrLn "Koniec gry."

readCommand :: IO String
readCommand = do
  putStr "\n "
  getLine

getFirstWord :: String -> String
getFirstWord str =
  case words str of
    (firstWord:_) -> firstWord
    _             -> ""

getSecondWord :: String -> String
getSecondWord str =
  case words str of
    (_:second:_) -> second
    _            -> ""

move :: Direction -> GameState -> IO GameState
move dir gameState = do
  let nextCoord = getNextCoordinate (currentCoordinates gameState) dir paths
  case nextCoord of
    Just coord -> do
      putStrLn $ "Nowa lokacja:"
      let description = describePlace coord (currentMapState gameState)
      maybe (return ()) putStrLn description
      return $ updateGameState gameState coord
    Nothing -> do
      putStrLn "Dotarłeś do miejsca gdzie diabeł mówi dobranoc. Zawróć."
      return gameState

updateGameState :: GameState -> Coordinate -> GameState
updateGameState gameState newCoord = gameState {currentCoordinates = newCoord}

gameLoop :: GameState -> IO ()
gameLoop gameState = do
  cmd <- readCommand
  case getFirstWord cmd of
    "n" -> do
      let newState = move N gameState
      putStrLn "Idziesz na północ."
      gameLoop =<< newState
    "s" -> do
      let newState = move S gameState
      putStrLn "Idziesz na południe."
      gameLoop =<< newState
    "e" -> do
      let newState = move E gameState
      putStrLn "Idziesz na wschód."
      gameLoop =<< newState
    "w" -> do
      let newState = move W gameState
      putStrLn "Idziesz na zachód."
      gameLoop =<< newState
    "idz" -> do
      case getSecondWord cmd of
        "n" -> do
          let newState = move N gameState
          putStrLn "Idziesz na północ."
          gameLoop =<< newState
        "s" -> do
          let newState = move S gameState
          putStrLn "Idziesz na południe."
          gameLoop =<< newState
        "e" -> do
          let newState = move E gameState
          putStrLn "Idziesz na wschód."
          gameLoop =<< newState
        "w" -> do
          let newState = move W gameState
          putStrLn "Idziesz na zachód."
          gameLoop =<< newState
        _ -> do
          putStrLn "Nieznana komenda."
          putStrLn ""
    "patrz" -> do
      case getSecondWord cmd of
        "n" -> do
          let nextCoord =
                getNextCoordinate (currentCoordinates gameState) N paths
          case nextCoord of
            Just coord -> do
              putStrLn "Patrzysz na północ"
              maybe
                (return ())
                putStrLn
                (describePlace coord (currentMapState gameState))
            Nothing -> putStrLn "Nie możesz patrzeć w tym kierunku."
        "s" -> do
          let nextCoord =
                getNextCoordinate (currentCoordinates gameState) S paths
          case nextCoord of
            Just coord -> do
              putStrLn "Patrzysz na południe"
              maybe
                (return ())
                putStrLn
                (describePlace coord (currentMapState gameState))
            Nothing -> putStrLn "Nie możesz patrzeć w tym kierunku."
        "e" -> do
          let nextCoord =
                getNextCoordinate (currentCoordinates gameState) E paths
          case nextCoord of
            Just coord -> do
              putStrLn "Patrzysz na wschód"
              maybe
                (return ())
                putStrLn
                (describePlace coord (currentMapState gameState))
            Nothing -> putStrLn "Nie możesz patrzeć w tym kierunku."
        "w" -> do
          let nextCoord =
                getNextCoordinate (currentCoordinates gameState) W paths
          case nextCoord of
            Just coord -> do
              putStrLn "Patrzysz na zachód"
              maybe
                (return ())
                putStrLn
                (describePlace coord (currentMapState gameState))
            Nothing -> putStrLn "Nie możesz patrzeć w tym kierunku."
        "" -> do
          putStrLn "Patrzysz dookoła siebie."
          let currentCoord = currentCoordinates gameState
              currentMap = currentMapState gameState
          case describePlace currentCoord currentMap of
            Just description -> putStrLn description
            Nothing ->
              putStrLn
                $ "Nie znaleziono miejsca o koordynatach: " ++ currentCoord
        _ -> do
          putStrLn "Nieznana komenda."
          putStrLn ""
    "bestiariusz" -> do
      putStrLn "Otwierasz bestiariusz."
      bestiary
    "monety" -> do
      putStrLn "Sprawdzasz ilość monet w kieszeni"
      checkMoney gameState
    "ekwipunek" -> do
      putStrLn "Przeglądasz zawartość ekwipunku."
      printEquipment gameState
    "podnies" -> do
      putStrLn "Podnosisz przedmiot."
    "uzyj" -> do
      putStrLn "Używasz przedmiotu."
    "rozmawiaj" -> do
      putStrLn "Próbujesz porozmawiać z kimś."
    "stworz_przynete" -> do
      putStrLn "Tworzysz przynętę."
    "wejdz" -> do
      putStrLn "Wchodzisz do budynku."
    "wyjdz" -> do
      putStrLn "Wychodzisz na zewnątrz."
    "aard" -> do
      putStrLn "Używasz znaku Aard."
    "komendy" -> do
      printInstructions
      gameLoop gameState
    "zakoncz" -> do
      putStrLn "Koniec gry."
      exitSuccess
    _ -> do
      putStrLn "Nieznana komenda."
      putStrLn ""
  gameLoop gameState

main :: IO ()
main = do
  let state =
        GameState
          { currentCoordinates = "c3"
          , equipment = []
          , currentMapState = places
          , money = 0
          }
  intro
  gameLoop state
