defmodule Day03 do
  import Enum
  import String
  alias String, as: S

  def multi_result(input) do
    Regex.scan(~r/mul\((\d+),(\d+)\)/, input)
      |> map(fn [_, a, b] -> to_integer(a) * to_integer(b) end)
      |> sum
  end

  def do_and_dont(input) do
    "Ö" <> replace(input, "don't()", "¤Å") |> replace("do()", "¤Ö")
      |> S.split("¤")
      |> filter(fn x -> starts_with?(x, "Ö") end)
      |> map(fn x -> S.slice(x, 1..10000) |> multi_result end)
      |> sum
  end
end
