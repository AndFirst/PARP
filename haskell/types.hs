module Types where

type Location = String

type Opponent = String

type NPC = String

type Item = String

type Items = [Item]

data Direction
  = N
  | S
  | E
  | W
  | X
  deriving (Show, Eq)

type Coordinate = String

type Paths = [(Coordinate, Direction, Coordinate)]

type Place = (Coordinate, Location, [NPC], [Item], [Opponent])

type Places = [Place]

data GameState = GameState
  { currentCoordinates :: Coordinate
  , currentMapState    :: Places
  , equipment          :: Items
  , money              :: Int
  }
