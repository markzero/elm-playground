module Main exposing (..)

import Html exposing (text)

politely : String -> String
politely phrase =
    "Excuse me, " ++ phrase

ask : String -> String -> String
ask thing place =
    "is there a "
        ++ thing ++ " in the " ++ place ++ "?"

askPolitelyAboutFish : String -> String

-- key concepts to observe here:
-- 1. function composition (<<) - make a function out of two+ functions
-- 2. (ask "fish") => partially applied function - only one arg instead of two
-- 3. point free style: not defining arguments directly
-- (ask "fish") is curried function, if called with less params
-- it returns a function which accepts string and returns a string
-- `place` argument is passed to `politely` fn through `ask` fn
askPolitelyAboutFish = politely << (ask "fish")

main =
    text
    <| askPolitelyAboutFish "hat"
