defmodule Day05 do
  alias String, as: S
  alias Enum, as: E

  def count_fresh_ingredients(input) do
    parts = input
      |> S.split("\r\n\r\n")
      |> E.map(fn p -> p |> S.split("\r\n") end)
      |> List.to_tuple

    ranges = elem(parts, 0)
      |> E.map(fn r -> S.split(r, "-")
      |> E.map(&S.to_integer/1)
      |> List.to_tuple() end)

    elem(parts, 1)
      |> E.map(&S.to_integer/1)
      |> E.filter(fn id -> E.any?(ranges, fn {min, max} -> id >= min and id <= max end) end)
      |> length
  end

  def all_fresh_ingredients(input) do
    fresh_ranges = input
      |> S.split("\r\n\r\n")
      |> E.map(fn p -> p |> S.split("\r\n") end)
      |> List.to_tuple
      |> elem(0)
      |> E.map(fn r -> S.split(r, "-")
        |> E.map(&S.to_integer/1)
        |> E.sort
        |> List.to_tuple end)
      |> E.sort_by(& elem(&1, 0))

    merged_ranges = fresh_ranges
      |> E.reduce([], fn {low, high}, acc ->
          case acc do
            [] -> [{low, high}]
            [{prev_low, prev_high} | rest] ->
              if low <= prev_high do
                [{prev_low, max(prev_high, high)} | rest]
              else
                [{low, high} | acc]
              end
          end
        end)

    merged_ranges
      |> E.map(fn {from, to} -> to - from + 1 end)
      |> E.sum
  end

end
