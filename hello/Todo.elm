module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)

-- model
type alias Model =
    { todo: String
    , todos: List String
    }

model =
    { todo = ""
    , todos = []
    }

-- update
type Msg
    = UpdateText String
    | AddItem
    | RemoveItem String

update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateText text ->
            { model | todo = text }
        AddItem ->
            { model | todos = model.todo :: model.todos }
        RemoveItem todo ->
            { model | todos = List.filter (\t -> t /= todo) model.todos }

todoItem todo =
    li []
        [ text todo
        , button [onClick (RemoveItem todo)] [text "X"]
        ]

todoList todos =
    let
        children = List.map todoItem todos
    in
       ul [] children

view model =
    div []
    [
        input [onInput UpdateText] []
    ,   button [onClick AddItem] [text "Add"]
    ,   p [] [text model.todo]
    ,   todoList model.todos
    ]

main =
    Html.beginnerProgram
    { model  = model
    , view   = view
    , update = update
    }
