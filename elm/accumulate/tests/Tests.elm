module Tests exposing (..)

import Test exposing (..)
import Expect
import Accumulate exposing (accumulate)
import String


square : Int -> Int
square x =
    x * x


tests : Test
tests =
    describe "Accumulate"
        [ test "[] Accumulate" <|
            \() -> Expect.equal [] (accumulate square [])
        , test "square Accumulate" <|
            \() -> Expect.equal [ 1, 4, 9 ] (accumulate square [ 1, 2, 3 ])
        , test "toUpper Accumulate" <|
            \() ->
                Expect.equal [ "HELLO", "WORLD" ]
                    (accumulate String.toUpper [ "hello", "world" ])
        , test "reverse Accumulate" <|
            \() ->
                Expect.equal [ "olleh", "dlrow" ]
                    (accumulate String.reverse [ "hello", "world" ])
        ]
