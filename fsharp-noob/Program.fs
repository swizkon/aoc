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




//let day_01_part_1_test_input = """
//1abc2
//pqr3stu8vwx
//a1b2c3d4e5f
//treb7uchet
//"""


let day_01_part_2_test_input = """
two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen
"""

Day01.solve_part_1 TestInputs.day_01_part_1_test_input
    |> printfn "Day01.solve_part_1: %A"

let rev_string = InputParser.reverse_string

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
        

let numbersMap : Map<string, int> =
    Map.ofList [
        ("one", 1);
        ("two", 2); 
        ("three", 3);
        ("four", 4);
        ("five", 5);
        ("six", 6);
        ("seven", 7);
        ("eight", 8);
        ("nine", 9);
        ("1", 1);
        ("2", 2);
        ("3", 3);
        ("4", 4);
        ("5", 5);
        ("6", 6);
        ("7", 7);
        ("8", 8);
        ("9", 9);
        ]
        
let numbers =
        [
            "one"; "1";
            "two"; "2";
            "three"; "3";
            "four"; "4";
            "five"; "5";
            "six"; "6";
            "seven"; "7";
            "eight"; "8";
            "nine"; "9"
        ]
        
type NumberPos =
    { Number : string
      First : int
      Last : int }

let get_digit_index (input: string) : NumberPos list =
    numbers
    |> List.map (fun (v) -> {
        Number = string (Map.find v numbersMap); 
        First = input.IndexOf(v); 
        Last = input.LastIndexOf(v)})
    |> List.filter (fun (v) -> v.First > -1 || v.Last > -1)
    
let get_first_digit_index (input: string) : string =
    input
    |> get_digit_index
    |> List.sortBy (fun (v) -> v.First)
    |> List.head
    |> (fun (v) -> v.Number)
    
let get_last_digit_index (input: string) : string =
    input
    |> get_digit_index
    |> List.sortByDescending (fun (v) -> v.Last)
    |> List.head
    |> (fun (v) -> v.Number)
    
let get_digits (input: string) : string =
    let first = input |> get_first_digit_index 
    let last = input |> get_last_digit_index 
    first + last

day_01_part_2_test_input
    |> InputParser.splitMultilineText
    |> List.map get_digits
    |> List.filter (fun item -> not (String.IsNullOrWhiteSpace item))
    |> List.map int
    |> List.sum
    |> printfn "Input: %A"

let s = "twone3eighthree6"

s |> printfn "get_digit_index: %A"

s |> get_digits 
  |> printfn "get_digits: %A"