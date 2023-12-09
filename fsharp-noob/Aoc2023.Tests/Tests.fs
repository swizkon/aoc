module Tests

open System
open Xunit

[<Fact>]
let ``My test`` () =
    Assert.True(true)

    
[<Fact>]
let ``InputHelper.reverse reverses string`` () =
    let numbers = InputParser.reverse_string "abc"
    Assert.Equal("cba", numbers)


    
[<Fact>]
let ``Day01.part1.test_input`` () =
    let numbers = Day01.solve_part_1 TestInputs.day_01_part_1_test_input
    Assert.Equal(142, numbers)

    
[<Fact>]
let ``Day01.part2.test_input`` () =
    let numbers = Day01.solve_part_2 TestInputs.day_01_part_2_test_input
    Assert.Equal(281, numbers)
