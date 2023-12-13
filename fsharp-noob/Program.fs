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
//TestInputs.day_01_part_1_test_input
//|>
//Day01.solve_part_1 
//    |> printfn "Day01.solve_part_1: %A"


let result = Day03.solve_part_1 Day03.test_input
result |> printfn "day_02_part_1_test_input: %A"