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

    
[<Fact>]
let ``Day02.part1.test_input`` () =
    let numbers = Day02.solve_part_1 Day02.day_02_part_1_test_input
    Assert.Equal(8, numbers)

    
[<Fact>]
let ``Day02.part2.day_02_part_2`` () =
    let result = Day02.solve_part_2 Day02.day_02_part_1_test_input
    Assert.Equal(2286, result)
