defmodule Day03 do
  alias String, as: S
  alias Enum, as: E

  def sum_joltage(input) do
    input
      |> S.split("\r\n", trim: true)
      |> E.map(&S.graphemes/1)
      |> E.map(&to_ints/1)
      |> E.map(&find_max_pair/1)
      |> E.sum()
  end

  defp to_ints(list) do
    Enum.map(list, &String.to_integer/1)
  end

  defp find_max_pair(data) do
    indexed = data |> Enum.with_index()
    first = indexed
      |> Enum.drop(-1)
      |> Enum.max_by(fn {value, _idx} -> value end)

    IO.puts "first: #{inspect first}"

    second = indexed
      |> Enum.drop(elem(first, 1) + 1)
      |> Enum.max_by(fn {value, _idx} -> value end)
    S.to_integer("#{elem(first, 0)}#{elem(second, 0)}")
  end

end
