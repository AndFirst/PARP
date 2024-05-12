module Main where

import           Items
import           Map
import           Opponents
import           Money
import           System.Exit (exitSuccess)
import           Types
import           Control.Monad (when)

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
  checkedCoord <- checkSpecialCases nextCoord
  case checkedCoord of
    "xx" ->
      return gameState
    "yy" -> do
      putStrLn "Dotarłeś do miejsca gdzie diabeł mówi dobranoc. Zawróć."
      return gameState
    coord -> do
      putStrLn "Nowa lokacja:"
      let description = describePlace coord (currentMapState gameState)
      maybe (return ()) putStrLn description
      return $ updateGameState gameState coord
    

checkSpecialCases :: Coordinate -> IO Coordinate
checkSpecialCases coord = do
  case coord of
    "d1" -> do
      putStrLn "W gęstym borze wpadasz w pułapkę zastawioną przez Leszych."
      putStrLn "Po cięzkim boju serce Białego Wilka zostaje brutalnie przebite przez potężnych strażników lasu..."
      exitSuccess
      return "d1"
    "e1" -> do
      putStrLn "W gęstym borze wpadasz w pułapkę zastawioną przez Leszych."
      putStrLn "Po cięzkim boju serce Białego Wilka zostaje brutalnie przebite przez potężnych strażników lasu..."
      exitSuccess
      return "e1"
    "g3" -> do
      putStrLn "Cicha, pozbawiona jakiejkolwiek aktywności potwórów jaskinia okazuje się skrywać straszny sekret."
      putStrLn "Geralt nie zdążył zorientować się jakie monstrum pozbawiło idź życia."
      putStrLn "Ukryty znów może cieszyć się spokojem w swojej kryjówce..."
      exitSuccess
      return "g3"
    "d6" -> do
      putStrLn "To jezioro wydaje się być nasycone silną magią elfów Aen Elle. Pływanie tutaj może być niebezpieczne."
      return "xx"
    "d7" -> do
      putStrLn "To jezioro wydaje się być nasycone silną magią elfów Aen Elle. Pływanie tutaj może być niebezpieczne."
      return "xx"
    "e6" -> do
      putStrLn "To jezioro wydaje się być nasycone silną magią elfów Aen Elle. Pływanie tutaj może być niebezpieczne."
      return "xx"
    "f6" -> do
      putStrLn "To jezioro wydaje się być nasycone silną magią elfów Aen Elle. Pływanie tutaj może być niebezpieczne."
      return "xx"
    "g5" -> do
      putStrLn "To jezioro wydaje się być nasycone silną magią elfów Aen Elle. Pływanie tutaj może być niebezpieczne."
      return "xx"
    "f1" -> do
      putStrLn "Wysoki klif na który nie da się wspiąć... Jak Płotka się tam dostała?"
      return "xx"
    "g2" -> do
      putStrLn "Wysoki klif na który nie da się wspiąć... Jak Płotka się tam dostała?"
      return "xx"
    "f5" -> do
      putStrLn "Wysoki klif na który nie da się wspiąć. Na jej szczycie znajduje się solidna wieża"
      return "xx"
    "g4" -> do
      putStrLn "Wysoki klif na który nie da się wspiąć."
      return "xx"
    "a1" -> do
      putStrLn "Zaraza. Nie jestem Zoltanem żebym się przebił przez pasmo Gór Va'Matz...."
      return "xx"
    "a2" -> do
      putStrLn "Zaraza. Nie jestem Zoltanem żebym się przebił przez pasmo Gór Va'Matz...."
      return "xx"
    "a3" -> do
      putStrLn "Zaraza. Nie jestem Zoltanem żebym się przebił przez pasmo Gór Va'Matz...."
      return "xx"
    "a4" -> do
      putStrLn "Zaraza. Nie jestem Zoltanem żebym się przebił przez pasmo Gór Va'Matz...."
      return "xx"
    "a5" -> do
      putStrLn "Zaraza. Nie jestem Zoltanem żebym się przebił przez pasmo Gór Va'Matz...."
      return "xx"
    "a6" -> do
      putStrLn "Zaraza. Nie jestem Zoltanem żebym się przebił przez pasmo Gór Va'Matz...."
      return "xx"
    "a7" -> do
      putStrLn "Zaraza. Nie jestem Zoltanem żebym się przebił przez pasmo Gór Va'Matz...."
      return "xx"
    _ -> return coord


updateGameState :: GameState -> Coordinate -> GameState
updateGameState gameState newCoord = gameState {currentCoordinates = newCoord}

enterDoor :: GameState -> IO GameState
enterDoor gameState = do
  let currentCoord = currentCoordinates gameState
      nextCoord = getNextCoordinate currentCoord X paths
  case nextCoord of
    Just coord -> do
      if doorStatus gameState
        then do
          putStrLn "Drzwi są otwarte, wchodzisz do środka."
          let newGameState = updateGameState gameState coord
          let currentMap = currentMapState gameState
          case describePlace coord currentMap of
                Just description -> putStrLn description

          return newGameState
        else do
          putStrLn "Drzwi wydają się być zamknięte, chyba trzeba się ich pozbyć."
          return gameState
    Nothing -> do
      putStrLn "W okolicy nie ma żadnego budynku, do którego mógłbyś wejść."
      return gameState

aard :: GameState -> IO GameState
aard gameState
  | currentCoordinates gameState /= "f5" = do
      putStrLn "Nie możesz tutaj użyć znaku aard."
      return gameState
  | doorStatus gameState = do
      putStrLn "Drzwi są już otwarte, nie ma sensu ponownie traktować ich aardem."
      return gameState
  | otherwise = do
      putStrLn "Udało Ci się wyważyć drzwi przy pomocy znaku aard - w końcu będziesz w stanie wejść do wieży."
      return $ gameState { doorStatus = True }

exitDoor :: GameState -> IO GameState
exitDoor gameState = do
  let currentCoord = currentCoordinates gameState
      nextCoord = getNextCoordinate currentCoord Y paths
  case nextCoord of
    Just coord -> do
      putStrLn "Opuszczasz to miejsce."
      let newGameState = updateGameState gameState coord
      let currentMap = currentMapState gameState
      case describePlace coord currentMap of
            Just description -> putStrLn description

      return newGameState
    Nothing -> do
      putStrLn "Nie ma tu nic, z czego mógłbyś wyjść."
      return gameState

useBait :: GameState -> IO GameState
useBait gameState =
  let bait = "Przynęta na gryfa"
      currentCoord = currentCoordinates gameState
      currentMap = currentMapState gameState
  in if bait `elem` equipment gameState
       then if currentCoord == "b7"
              then do
                putStrLn "Postawiłeś przynętę, gryf powinien się lada moment zjawić..."
                putStrLn "Słysz jak gryf przylatuje do gniazda, czas na niego zapolować."
                let updatedGameState = removeItem bait gameState
                return $ gameState { currentMapState = addOpponentToPlace currentCoord griffin currentMap }
              else do
                putStrLn "Nie możesz użyć przynęty na gryfa tutaj."
                return gameState
       else do
         putStrLn "Nie masz przynęty na gryfa w swoim ekwipunku."
         return gameState

------- Atacks

isCowPresent :: Coordinate -> Places -> Bool
isCowPresent coord places =
  case findPlaceByCoordinate coord places of
    Just (_, _, _, _, opponents) -> "krowa" `elem` opponents
    Nothing -> False

atakuj :: Opponent -> GameState -> IO GameState
atakuj "krowa" gameState
  | isCowPresent (currentCoordinates gameState) (currentMapState gameState) =
      do
        putStrLn "Atakujesz krowę."
        putStrLn "Zabiłeś krowę i zdobyłeś krowią skórę."
        return $ addItem leather gameState
  | otherwise =
      do
        putStrLn "W okolicy nie ma żadnej krowy do zabicia."
        return gameState

atakuj "gryf" gameState
  | currentCoordinates gameState == "b7" =
      case placeInfo of
        Just (_, _, _, _, [opponent]) -> do
          putStrLn "Zaatakowałeś gryfa, wybierz co powinieneś zrobić"
          putStrLn "1. Strzel z kuszy, by go powalić."
          putStrLn "2. Zaatakuj mieczem"
          putStrLn "0. Uciekaj"
          ruch <- getLine
          case ruch of
            "1" -> atak_kusza1 gameState
            "2" -> atak_miecz1 gameState
            "0" -> ucieczka gameState
            _ -> do
              putStrLn "Nie możesz tego zrobić"
              return gameState
        Just _ -> do
          putStrLn "Gniazdo gryfa jest puste, powinieneś najpierw zastawić przynętę."
          return gameState
  | otherwise = do
      putStrLn "W okolicy nie ma żadnego potwora do zabicia."
      return gameState
  where
    placeInfo = findPlaceByCoordinate (currentCoordinates gameState) (currentMapState gameState)

atakuj _ gameState = do
  putStrLn "W okolicy nie ma takiego stworzenia."
  return gameState


atak_kusza1 :: GameState -> IO GameState
atak_kusza1 gameState = do
  putStrLn "Udało Ci się trafć gryfa kuszą strącając go na ziemię."
  putStrLn "Wybierz, co powinieneś zrobić następnie."
  putStrLn "1. Strzel z kuszy."
  putStrLn "2. Zaatakuj mieczem"
  putStrLn "0. Uciekaj"
  ruch <- getLine
  case ruch of
    "1" -> atak_kusza2 gameState
    "2" -> zabicie_gryfa gameState
    "0" -> ucieczka gameState
    _ -> do
      putStrLn "Nie możesz tego zrobić"
      return gameState

atak_kusza2 :: GameState -> IO GameState
atak_kusza2 gameState = do
  putStrLn "Strzał kuszą w obalonego gryfa nie był wystarczający do zabicia bestii."
  putStrLn "Wybierz, co powinieneś zrobić następnie."
  putStrLn "1. Strzel z kuszy."
  putStrLn "2. Zaatakuj mieczem"
  putStrLn "0. Uciekaj"
  ruch <- getLine
  case ruch of
    "1" -> atak_kusza2 gameState
    "2" -> zabicie_gryfa gameState
    "0" -> ucieczka gameState
    _ -> do
      putStrLn "Nie możesz tego zrobić"
      atak_kusza2 gameState

atak_miecz1 :: GameState -> IO GameState
atak_miecz1 gameState = do
  putStrLn "Nie udało Ci się trafić pikującego gryfa."
  putStrLn "Uważaj, bo następnym razem gryf może Cię trafić."
  putStrLn "1. Strzel z kuszy."
  putStrLn "2. Zaatakuj mieczem"
  putStrLn "0. Uciekaj"
  ruch <- getLine
  case ruch of
    "1" -> atak_kusza1 gameState
    "2" -> atak_miecz2 gameState
    "0" -> ucieczka gameState
    _ -> do
      putStrLn "Nie możesz tego zrobić"
      atak_miecz1 gameState

atak_miecz2 :: GameState -> IO GameState
atak_miecz2 gameState = do
  putStrLn "Pikujący gryf krytycznie trafił Cię szponem."
  putStrLn "Niestety odniesiona rana okazała się fatalna i doprowadziła do Twojej śmierci."
  exitSuccess

zabicie_gryfa :: GameState -> IO GameState
zabicie_gryfa gameState = do
  putStrLn "Gryf padł martwy od ciosu miecza."
  putStrLn "Zdobywasz trofeum z gryfa."
  let updatedPlaces = removeOpponentFromPlace (currentCoordinates gameState) griffin (currentMapState gameState)
      updatedGameState = gameState { currentMapState = updatedPlaces, equipment = trophy : equipment gameState }
  putStrLn "Udało Ci się ukończyć wiedźmińską przygodę, gratulacje."
  exitSuccess
  return updatedGameState

ucieczka :: GameState -> IO GameState
ucieczka gameState = do
  putStrLn "Udało Ci się uciec od gryfa do wsi Jaworek."
  let updatedGameState = gameState { currentCoordinates = "c3" }
  return updatedGameState
  
----------



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
            "yy" -> putStrLn "Nie możesz patrzeć w tym kierunku."
            coord -> do
              putStrLn "Patrzysz na północ"
              maybe
                (return ())
                putStrLn
                (describePlace coord (currentMapState gameState))
        "s" -> do
          let nextCoord =
                getNextCoordinate (currentCoordinates gameState) S paths
          case nextCoord of
            "yy" -> putStrLn "Nie możesz patrzeć w tym kierunku."
            coord -> do
              putStrLn "Patrzysz na południe"
              maybe
                (return ())
                putStrLn
                (describePlace coord (currentMapState gameState))
        "e" -> do
          let nextCoord =
                getNextCoordinate (currentCoordinates gameState) E paths
          case nextCoord of
            "yy" -> putStrLn "Nie możesz patrzeć w tym kierunku."
            coord -> do
              putStrLn "Patrzysz na wschód"
              maybe
                (return ())
                putStrLn
                (describePlace coord (currentMapState gameState))
        "w" -> do
          let nextCoord =
                getNextCoordinate (currentCoordinates gameState) W paths
          case nextCoord of
            "yy" -> putStrLn "Nie możesz patrzeć w tym kierunku."
            coord -> do
              putStrLn "Patrzysz na zachód"
              maybe
                (return ())
                putStrLn
                (describePlace coord (currentMapState gameState))
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
      let itemName = getSecondWord cmd
      newState <- podnies itemName gameState
      gameLoop newState
    "atakuj" -> do
      let opponentName = getSecondWord cmd
      newState <- atakuj opponentName gameState
      gameLoop newState
    "uzyj" -> do
      case getSecondWord cmd of
        "przynęta" -> do
          let newState = useBait gameState
          gameLoop =<< newState
        _ -> do
          putStrLn "Nie możesz użyć tego przedmiotu."
    "rozmawiaj" -> do
      putStrLn "Próbujesz porozmawiać z kimś."
    "stworz_przynete" -> do
      let newState = craftBait gameState
      gameLoop =<< newState
    "wejdz" -> do
      let newState = enterDoor gameState
      gameLoop =<< newState
    "wyjdz" -> do
      let newState = exitDoor gameState
      gameLoop =<< newState
    "aard" -> do
      let newState = aard gameState
      gameLoop =<< newState
    "kup" -> do
      let itemName = getSecondWord cmd
      putStrLn "Podaj cenę przedmiotu: "
      price <- readLn
      case buyItem itemName price gameState of
        Right newState -> do
          putStrLn $ "Kupujesz przedmiot: " ++ itemName
          gameLoop newState
        Left errorMsg -> do
          putStrLn errorMsg
          gameLoop gameState
    "sprzedaj" -> do
      let itemName = getSecondWord cmd
      putStrLn "Podaj cenę przedmiotu: "
      price <- readLn
      let newState = sellItem itemName price gameState
      putStrLn $ "Sprzedajesz przedmiot: " ++ itemName
      gameLoop newState
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
          , equipment = [bait]
          , currentMapState = places
          , money = 0
          , doorStatus = False
          }
  intro
  gameLoop state
