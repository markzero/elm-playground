module Main exposing (..)

import Html exposing (text)

type alias Car =
    { description: String
    , age: Int
    }

cars =
    [ { description = "Black BMW", age = 10 }
    , { description = "Red VW", age = 4}
    ]

-- return list of description strings only
-- List.map takes fn first with anonymous fn as argument, then a list argument
carmap : List Car -> List String
carmap cars =
        List.map (\car -> car.description) cars

-- foldl in Elm is like reduce in JavaScript
-- first it takes anonymous fn, then initial value, then list to iterate over
-- memo is the value that we start with
carfold : List Car -> String -> Maybe Car
carfold carsparam description =
  List.foldl
  (
    \car memo -> case memo of
      Just _  -> memo
      Nothing -> if car.description == description then
                   Just car
                   else Nothing
  )
  Nothing
  carsparam


main = text
        <| toString <| carfold cars "Black BMW"
        -- also can be written as
        -- <| (toString (carmap cars))
