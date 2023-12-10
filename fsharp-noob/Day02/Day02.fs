module Day02

open System
open System.Text.RegularExpressions

let day_02_part_1_test_input = """
Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
"""

type Game =
    { Id : int
      Blue : int
      Green : int
      Red : int }

let max_match (input: string, pattern: string) =
    let matches = Regex.Matches(input, pattern)
    let result = matches |> Seq.map (fun item -> item.Groups.[1].Value |> int)

    match List.ofSeq result with
        | [] -> 0
        | _ -> result |> Seq.max
    

let parse_game (input: string) : Game =
    let game = Regex.Match(input, "Game (\d+): ")
    let id = game.Groups.[1].Value |> int
    
    let blue = max_match(input, " (\d+) blue")
    let green = max_match(input, " (\d+) green")
    let red = max_match(input, " (\d+) red")
        
    { Id = id; Blue = blue; Green = green ; Red = red }
    

let solve_part_1 (input: string) : int =
    input
    |> InputParser.splitMultilineText
    |> List.map parse_game
    |> List.filter (fun i -> i.Red <= 12 && i.Green <= 13 && i.Blue <= 14)
    |> List.map (fun i -> i.Id)
    |> List.sum
 

let solve_part_2 (input: string) : int =
    input
    |> InputParser.splitMultilineText
    |> List.map parse_game
    |> List.map (fun i -> i.Blue * i.Green * i.Red)
    |> List.sum
 