module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


-- model
type alias Model =
    { str: String
    , list: List Int
    }

model =
    { str = ""
    , list = []
    }

-- update
type Msg
    = SomeUpdate String -- string is parameter
    | OtherUpdate -- no params

update: Msg -> Model -> Model
update msg model =
    case msg of
        SomeUpdate strarg ->
            { model | str = strarg }
        OtherUpdate ->
            { model | list = 1 :: model.list }

-- view
view model =
    div []
    [ input [onInput SomeUpdate, placeholder "Do the string thing"] []
    , button [onClick (SomeUpdate "param")] [text "Do the string thing with param"]
    , button [onClick OtherUpdate] [text "Do the list thing"]
    , p [] [text (toString model.list)]
    , p [] [text model.str]
    ]

main =
    Html.beginnerProgram
    { model  = model
    , view   = view
    , update = update
    }
