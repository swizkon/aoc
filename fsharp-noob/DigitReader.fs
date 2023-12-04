module DigitReader

open System

let replacements =
    [
        "one", "1"
        "two", "2"
        "three", "3"
        "four", "4"
        "five", "5"
        "six", "6"
        "seven", "7"
        "eight", "8"
        "nine", "9"
        "1", "1"
        "2", "2"
        "3", "3"
        "4", "4"
        "5", "5"
        "6", "6"
        "7", "7"
        "8", "8"
        "9", "9"
    ]

    
let reverse = InputHelper.reverse_string

let first_digit (inputString: string) : string =
    match Seq.tryFind System.Char.IsDigit inputString with
    | Some firstDigit -> string firstDigit
    | None -> ""

let getFirstAndLastDigit (inputString: string) : string =
    let first = inputString |> first_digit
    let last  = inputString |> reverse |> first_digit
    first + last