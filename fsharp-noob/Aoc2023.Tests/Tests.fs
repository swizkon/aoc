module Tests

open System
open Xunit

[<Fact>]
let ``My test`` () =
    Assert.True(true)


[<Fact>]
let ``InputHelper.reverse reverses string`` () =
    let numbers = InputHelper.reverse_string "abc"
    Assert.Equal("cba", numbers)
