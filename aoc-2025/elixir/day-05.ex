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
    parts = input
      |> S.split("\r\n\r\n")
      |> E.map(fn p -> p |> S.split("\r\n") end)
      |> List.to_tuple

    ranges = elem(parts, 0)
      |> E.map(fn r -> S.split(r, "-")
        |> E.map(&S.to_integer/1)
        |> E.sort
        |> List.to_tuple end)
      |> E.sort_by(& elem(&1, 0))
      # |> E.sort_by(fn {min, _} -> min end)
      # |> E.with_index

    IO.puts ("Initial ranges: #{inspect(ranges)}")

    reduced = ranges
      |> Enum.reduce([], fn {low, high}, acc ->
          case acc do
            [] ->
              [{low, high}]
            [{prev_low, prev_high} | rest] ->
              if low <= prev_high do
                # Merge: update the upper bound
                [{prev_low, max(prev_high, high)} | rest]
              else
                # No overlap: add as new range
                [{low, high} | acc]
              end
          end
        end)
      |> Enum.reverse()


    IO.puts ("reduced overlapped ranges: #{inspect(reduced)}")
    # excluding_swallowed = ranges
      # |> E.filter(fn {{from, to}, idx} -> not is_range_swallowed(from, to, idx, ranges) end)


    fixed_overlapping = reduced
      # |> E.with_index
      # |> E.chunk_every(2, 1, [List.last(ranges)])
      # |> E.map(fn [a, b] -> fix_overlapping(a,b) end)
      |> E.filter(fn {from, to} -> from <= to end)

    # IO.puts ("Excluding overlapped ranges: #{inspect(fixed_overlapping)}")

    # fixed_overlapping = fixed_overlapping

    IO.puts ("Excluding overlapped ranges: #{inspect(fixed_overlapping)}")

    result = fixed_overlapping
      |> E.map(fn {from, to} -> to - from + 1 end)
      |> E.sum

    result

  end

  # defp is_range_swallowed(_, _, _, []), do: false
  # defp is_range_swallowed(from, to, idx, [{{min, max}, x} | tail]) do
  #   if min <= from and to <= max and idx < x do
  #     true
  #   else
  #     is_range_swallowed(from, to, idx, tail)
  #   end
  # end

  defp fix_overlapping(a, b) do
    IO.puts("Fixing overlapping: #{inspect(a)} with #{inspect(b)}")
    {{lower, upper}, idx} = a
    {{min, _}, idx2} = b

    if upper >= min and idx != idx2 do
      IO.puts("Overlapping detected: #{upper} with #{min}")
      {{lower, min - 1}, idx}
    else
      a
    end
  end

  # defp is_range_overlapping(_, _, _, []), do: false
  # defp is_range_overlapping(from, to, idx, [{{min, max}, x} | tail]) do
  #   IO.puts("Checking overlapping: #{from}-#{to} with #{min}-#{max}")
  #   if min <= to and idx + 1 == x do
  #     IO.puts("Overlapping detected: #{from}-#{to} with #{min}-#{max}")
  #     true
  #   else
  #     IO.puts("No overlapping: #{from}-#{to} with #{min}-#{max}")
  #     is_range_overlapping(from, to, idx, tail)
  #   end
  # end

end
