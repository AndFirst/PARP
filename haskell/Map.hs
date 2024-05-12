module Map where

import           Data.Maybe (listToMaybe)
import           Types

import           Items
import           Locations
import           NPCs
import           Opponents

paths :: Paths
paths =
  [ ("a1", E, "a2")
  , ("a1", S, "b1")
  , ("a2", E, "a3")
  , ("a2", W, "a1")
  , ("a2", S, "b2")
  , ("a3", E, "a4")
  , ("a3", W, "a2")
  , ("a3", S, "b3")
  , ("a4", E, "a5")
  , ("a4", W, "a3")
  , ("a4", S, "b4")
  , ("a5", E, "a6")
  , ("a5", W, "a4")
  , ("a5", S, "b5")
  , ("a6", E, "a7")
  , ("a6", W, "a5")
  , ("a6", S, "b6")
  , ("a7", W, "a6")
  , ("a7", S, "b7")
  , ("b1", N, "a1")
  , ("b1", E, "b2")
  , ("b1", S, "c1")
  , ("b2", N, "a2")
  , ("b2", E, "b3")
  , ("b2", W, "b1")
  , ("b2", S, "c2")
  , ("b3", N, "a3")
  , ("b3", E, "b4")
  , ("b3", W, "b2")
  , ("b3", S, "c3")
  , ("b4", N, "a4")
  , ("b4", E, "b5")
  , ("b4", W, "b3")
  , ("b4", S, "c4")
  , ("b5", N, "a5")
  , ("b5", E, "b6")
  , ("b5", W, "b4")
  , ("b5", S, "c5")
  , ("b6", N, "a6")
  , ("b6", E, "b7")
  , ("b6", W, "b5")
  , ("b6", S, "c6")
  , ("b7", N, "a7")
  , ("b7", W, "b6")
  , ("b7", S, "c7")
  , ("c1", N, "b1")
  , ("c1", E, "c2")
  , ("c1", S, "d1")
  , ("c2", N, "b2")
  , ("c2", E, "c3")
  , ("c2", W, "c1")
  , ("c2", S, "d2")
  , ("c3", N, "b3")
  , ("c3", E, "c4")
  , ("c3", W, "c2")
  , ("c3", S, "d3")
  , ("c4", N, "b4")
  , ("c4", E, "c5")
  , ("c4", W, "c3")
  , ("c4", S, "d4")
  , ("c5", N, "b5")
  , ("c5", E, "c6")
  , ("c5", W, "c4")
  , ("c5", S, "d5")
  , ("c6", N, "b6")
  , ("c6", E, "c7")
  , ("c6", W, "c5")
  , ("c6", S, "d6")
  , ("c7", N, "b7")
  , ("c7", W, "c6")
  , ("c7", S, "d7")
  , ("d1", N, "c1")
  , ("d1", E, "d2")
  , ("d1", S, "e1")
  , ("d2", N, "c2")
  , ("d2", E, "d3")
  , ("d2", W, "d1")
  , ("d2", S, "e2")
  , ("d3", N, "c3")
  , ("d3", E, "d4")
  , ("d3", W, "d2")
  , ("d3", S, "e3")
  , ("d4", N, "c4")
  , ("d4", E, "d5")
  , ("d4", W, "d3")
  , ("d4", S, "e4")
  , ("d5", N, "c5")
  , ("d5", E, "d6")
  , ("d5", W, "d4")
  , ("d5", S, "e5")
  , ("d6", N, "c6")
  , ("d6", E, "d7")
  , ("d6", W, "d5")
  , ("d6", S, "e6")
  , ("d7", N, "c7")
  , ("d7", W, "d6")
  , ("d7", S, "e7")
  , ("e1", N, "d1")
  , ("e1", E, "e2")
  , ("e1", S, "f1")
  , ("e2", N, "d2")
  , ("e2", E, "e3")
  , ("e2", W, "e1")
  , ("e2", S, "f2")
  , ("e3", N, "d3")
  , ("e3", E, "e4")
  , ("e3", W, "e2")
  , ("e3", S, "f3")
  , ("e4", N, "d4")
  , ("e4", E, "e5")
  , ("e4", W, "e3")
  , ("e4", S, "f4")
  , ("e5", N, "d5")
  , ("e5", E, "e6")
  , ("e5", W, "e4")
  , ("e5", S, "f5")
  , ("e6", N, "d6")
  , ("e6", E, "e7")
  , ("e6", W, "e5")
  , ("e6", S, "f6")
  , ("e7", N, "d7")
  , ("e7", W, "e6")
  , ("e7", S, "f7")
  , ("f1", N, "e1")
  , ("f1", E, "f2")
  , ("f1", S, "g1")
  , ("f2", N, "e2")
  , ("f2", E, "f3")
  , ("f2", W, "f1")
  , ("f2", S, "g2")
  , ("f3", N, "e3")
  , ("f3", E, "f4")
  , ("f3", W, "f2")
  , ("f3", S, "g3")
  , ("f4", N, "e4")
  , ("f4", E, "f5")
  , ("f4", W, "f3")
  , ("f4", S, "g4")
  , ("f5", N, "e5")
  , ("f5", E, "f6")
  , ("f5", W, "f4")
  , ("f5", S, "g5")
  , ("f6", N, "e6")
  , ("f6", E, "f7")
  , ("f6", W, "f5")
  , ("f6", S, "g6")
  , ("f7", N, "e7")
  , ("f7", W, "f6")
  , ("f7", S, "g7")
  , ("g1", N, "f1")
  , ("g1", E, "g2")
  , ("g2", N, "f2")
  , ("g2", E, "g3")
  , ("g2", W, "g1")
  , ("g3", N, "f3")
  , ("g3", E, "g4")
  , ("g3", W, "g2")
  , ("g4", N, "f4")
  , ("g4", E, "g5")
  , ("g4", W, "g3")
  , ("g5", N, "f5")
  , ("g5", E, "g6")
  , ("g5", W, "g4")
  , ("g6", N, "f6")
  , ("g6", E, "g7")
  , ("g6", W, "g5")
  , ("g7", N, "f7")
  , ("g7", W, "g6")
  , ("f5", X, "f5b")
  , ("f5b", X, "f5")
  ]

places :: Places
places =
  [ ("a1", westMountains, [], [], [])
  , ("a2", ridge, [], [], [])
  , ("a3", ridge, [], [], [])
  , ("a4", mountains, [], [], [])
  , ("a5", ridge, [], [], [])
  , ("a6", eastMountains, [], [], [])
  , ("a7", eastMountains, [], [], [])
  , ("b1", other, [], [], [])
  , ("b2", meadow, [], [herb], [cow])
  , ("b3", meadow, [], [], [])
  , ("b4", other, [], [], [])
  , ("b5", other, [], [], [])
  , ("b6", other, [], [], [])
  , ("b7", nest, [], [], [])
  , ("c1", other, [], [], [])
  , ("c2", other, [], [], [])
  , ("c3", village, [trader, trader, trader], [herb, herb], [cow, cow])
  , ("c4", other, [], [], [])
  , ("c5", other, [], [], [])
  , ("c6", other, [], [], [])
  , ("c7", other, [], [], [])
  , ("d1", forest, [], [], [])
  , ("d2", other, [], [], [])
  , ("d3", other, [], [], [])
  , ("d4", other, [], [], [])
  , ("d5", other, [], [], [])
  , ("d6", lake, [], [], [])
  , ("d7", lake, [], [], [])
  , ("e1", forest, [], [], [])
  , ("e2", other, [], [], [])
  , ("e3", other, [], [], [])
  , ("e4", other, [], [], [])
  , ("e5", other, [], [], [])
  , ("e6", lake, [], [], [])
  , ("e7", lake, [], [], [])
  , ("f1", other, [], [], [])
  , ("f2", cliffCanyon, [], [], [])
  , ("f3", canyon, [], [], [])
  , ("f4", cliffCanyon, [], [], [])
  , ("f5", tower, [], [], [])
  , ("f5b", insideTower, [], [sword], [])
  , ("f6", lake, [], [], [])
  , ("f7", lake, [], [], [])
  , ("g1", other, [], [], [])
  , ("g2", other, [], [], [])
  , ("g3", cave, [], [], [])
  , ("g4", other, [], [], [])
  , ("g5", lake, [], [], [])
  , ("g6", lake, [], [], [])
  , ("g7", lake, [], [], [])
  , ("xx", illegalMove, [], [], [])
  , ("yy", outOfBounds, [], [], [])
  ]

findPlaceByCoordinate :: Coordinate -> Places -> Maybe Place
findPlaceByCoordinate coord =
  listToMaybe . filter (\(c, _, _, _, _) -> c == coord)

describePlace :: Coordinate -> Places -> Maybe String
describePlace coord places = do
  (_, location, npcs, items, opponents) <- findPlaceByCoordinate coord places
  let locationLine = [location]
      npcLines =
        if null npcs
          then []
          else ["Postacie w tej lokalizacji:"]
                 ++ map (\npc -> "    " ++ npc) npcs
      itemLines =
        if null items
          then []
          else ["Przedmioty, które można znaleźć w tej lokalizacji:"]
                 ++ map (\item -> "    " ++ item) items
      opponentLines =
        if null opponents
          then []
          else ["Przeciwnicy w tej lokalizacji:"]
                 ++ map (\opponent -> "    " ++ opponent) opponents
  return
    $ ""
        ++ unlines locationLine
        ++ unlines npcLines
        ++ unlines itemLines
        ++ unlines opponentLines

getNextCoordinate :: Coordinate -> Direction -> Paths -> Coordinate
getNextCoordinate currentCoord direction paths =
  case filter
         (\(coord, dir, _) -> coord == currentCoord && dir == direction)
         paths of
    []                  -> "yy"
    [(_, _, nextCoord)] -> nextCoord
    _                   -> error "Invalid path definition"

addItemsToPlace :: Coordinate -> [Item] -> Places -> Places
addItemsToPlace coord newItems places =
  case findPlaceByCoordinate coord places of
    Just (c, loc, npcs, items, opponents) ->
      let updatedItems = items ++ newItems
          newPlace = (c, loc, npcs, updatedItems, opponents)
          updatedPlaces =
            map
              (\p@(c', _, _, _, _) ->
                 if c' == c
                   then newPlace
                   else p)
              places
       in updatedPlaces
    Nothing -> places

removeItemFromPlace :: Coordinate -> Item -> Places -> Places
removeItemFromPlace coord itemToRemove places =
  case findPlaceByCoordinate coord places of
    Just (c, loc, npcs, items, opponents) ->
      let updatedItems = filter (/= itemToRemove) items
          newPlace = (c, loc, npcs, updatedItems, opponents)
          updatedPlaces =
            map
              (\p@(c', _, _, _, _) ->
                 if c' == c
                   then newPlace
                   else p)
              places
       in updatedPlaces
    Nothing -> places

addOpponentToPlace :: Coordinate -> Opponent -> Places -> Places
addOpponentToPlace coord opponent places =
  case findPlaceByCoordinate coord places of
    Just (c, loc, npcs, items, opponents) ->
      let newOpponents = opponent : opponents
          newPlace = (c, loc, npcs, items, newOpponents)
          updatedPlaces =
            map
              (\p@(c', _, _, _, _) ->
                 if c' == c
                   then newPlace
                   else p)
              places
       in updatedPlaces
    Nothing -> places

removeOpponentFromPlace :: Coordinate -> Opponent -> Places -> Places
removeOpponentFromPlace coord opponent places =
  case findPlaceByCoordinate coord places of
    Just (c, loc, npcs, items, opponents) ->
      let newOpponents = filter (/= opponent) opponents
          newPlace = (c, loc, npcs, items, newOpponents)
          updatedPlaces =
            map
              (\p@(c', _, _, _, _) ->
                 if c' == c
                   then newPlace
                   else p)
              places
       in updatedPlaces
    Nothing -> places
