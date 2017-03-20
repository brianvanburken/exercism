module Leap exposing (..)


isLeapYear : Int -> Bool
isLeapYear year =
    rem year 4
        == 0
        && rem year 100
        /= 0
        || rem year 400
        == 0
