open System

open System.Text.RegularExpressions

//let replaceTextWithDigits (input: string) : string =
//    let replacements =
//        [
//            "one", "1"
//            "two", "2"
//            "three", "3"
//            "four", "4"
//            "five", "5"
//            "six", "6"
//            "seven", "7"
//            "eight", "8"
//            "nine", "9"
//        ]

//    let pattern = String.Join("|", replacements |> List.map fst |> Array.ofList)
//    let regex = new Regex(pattern, RegexOptions.IgnoreCase)
//    let replaceMatch (matchResult: Match) =
//        matchResult.Value |> Seq.find (fun (k, _) -> k.ToLower() = matchResult.Value.ToLower()) |> snd

//    regex.Replace(input, replaceMatch)


// Lets go!



//let test_input = """
//1abc2
//pqr3stu8vwx
//a1b2c3d4e5f
//treb7uchet
//"""


let test_input = """
two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen
"""

let rev_string = InputHelper.reverse_string

let first_digit (inputString: string) : string =
    match Seq.tryFind System.Char.IsDigit inputString with
    | Some firstDigit -> string firstDigit
    | None -> ""

let getFirstAndLastDigit (inputString: string) : string =
    let first = inputString |> first_digit
    let last  = inputString 
                    |> rev_string
                    |> first_digit
    first + last
        
"abc" |> rev_string |> printfn "%A"

test_input
    |> InputHelper.splitMultilineText
    |> List.map getFirstAndLastDigit
    |> List.filter (fun item -> not (String.IsNullOrWhiteSpace item))
    |> List.map int
    // |> List.sum
    |> printfn "Input: %A"
