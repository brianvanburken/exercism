module Raindrops exposing (..)


cases : List ( Int, String )
cases =
    [ ( 3, "Pling" )
    , ( 5, "Plang" )
    , ( 7, "Plong" )
    ]


raindrops : Int -> String
raindrops x =
    List.foldr
        (\( divider, sound ) acc ->
            if x % divider == 0 then
                sound ++ acc
            else
                acc
        )
        ""
        cases
        |> (\xs ->
                if String.isEmpty xs then
                    toString x
                else
                    xs
           )
