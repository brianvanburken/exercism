module Bob exposing (..)


isShouting : String -> Bool
isShouting statement =
    let
        upperCase =
            String.toUpper statement

        lowerCase =
            String.toLower statement
    in
        upperCase == statement && lowerCase /= statement


hey : String -> String
hey statement =
    if isShouting statement then
        "Whoa, chill out!"
    else if String.endsWith "?" statement then
        "Sure."
    else if statement |> String.trim |> String.isEmpty then
        "Fine. Be that way!"
    else
        "Whatever."
