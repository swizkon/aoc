module InputParser

open System

let splitMultilineText(text: string) : string list =
    text.Split('\n')
    |> Array.map(fun line -> line.Trim())
    |> Array.filter (fun item -> not (String.IsNullOrWhiteSpace item))
    |> List.ofArray
    
let split_lines(text: string) : string array =
    text.Split('\n')
    |> Array.map(fun line -> line.Trim())
    |> Array.filter (fun item -> not (String.IsNullOrWhiteSpace item))

let reverse_string (inputString: string) : string =
    inputString
        |> Seq.toArray 
        |> Array.rev 
        |> String