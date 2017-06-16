module Accumulate exposing (..)


accumulate : (a -> b) -> List a -> List b
accumulate fn list =
    case list of
        [] ->
            []

        x :: xs ->
            fn x :: accumulate fn xs
