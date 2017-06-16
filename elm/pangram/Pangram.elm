module Pangram exposing (..)


alphabet : List String
alphabet =
    String.split "" "abcdefghijklmnopqrstuvwxyz"


isPangram : String -> Bool
isPangram sentence =
    let
        normalised =
            String.toLower sentence
    in
        List.all (containsLetter normalised) alphabet


containsLetter : String -> String -> Bool
containsLetter sentence letter =
    String.contains letter sentence
