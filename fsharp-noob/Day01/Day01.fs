module Day01

open System


let test_input = """
two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen
"""

let rev_string = InputParser.reverse_string

let first_digit (inputString: string) : string =
    match Seq.tryFind System.Char.IsDigit inputString with
    | Some firstDigit -> string firstDigit
    | None -> ""

let getFirstAndLastDigit (inputString: string) : string =
    let first = inputString |> first_digit
    let last  = inputString |> rev_string |> first_digit
    first + last


    

let solve_part_1 (input: string) : int =

    input
    |> InputParser.splitMultilineText
    |> List.map getFirstAndLastDigit
    |> List.filter (fun item -> not (String.IsNullOrWhiteSpace item))
    |> List.map int
    |> List.sum

    
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

    let ff =  Map.map (fun k v -> {
        Number = string v; 
        First = input.IndexOf(string k); 
        Last = input.LastIndexOf(string k)}) numbersMap
        // |> Map.values

    ff.Values
        |> List.ofSeq
        |> List.filter (fun (v) -> v.First > -1 || v.Last > -1)

    
let get_first_digit_index (input: NumberPos list) : string =
    input
    |> List.sortBy (fun (v) -> v.First)
    |> List.head
    |> (fun (v) -> v.Number)
    
let get_last_digit_index (input: NumberPos list) : string =
    input
    |> List.sortByDescending (fun (v) -> v.Last)
    |> List.head
    |> (fun (v) -> v.Number)
    
let get_digits (input: string) : string =
    let index = input |> get_digit_index
    let first = index |> get_first_digit_index 
    let last  = index |> get_last_digit_index 
    first + last
 
let solve_part_2 (input: string) : int =

    input
    |> InputParser.splitMultilineText
    |> List.map get_digits
    |> List.filter (fun item -> not (String.IsNullOrWhiteSpace item))
    |> List.map int
    |> List.sum
