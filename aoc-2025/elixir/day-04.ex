defmodule Day04 do
  alias String, as: S
  alias Enum, as: E

  def count_paper_rolls(input) do

    IO.puts "input: #{inspect input}"

    data = S.graphemes(input)
      |> Enum.with_index

    IO.puts "data: #{inspect data}"

    row_size = 10 # each paper roll is 10 units wide

    indexed_tuple = List.to_tuple(data)

    indexed_tuple

  end

  defp transform_data(input, pack_size) do
    data = input
      |> S.graphemes
      |> E.map(&S.to_integer/1)
      |> Enum.with_index

    IO.puts("data: #{inspect data}")
    data
      |> find_max_pair(pack_size, 0, "")
  end

  defp find_max_pair([], _, _, acc) do
    IO.puts("find_max_pair No more to calc...")
    acc
  end

  defp find_max_pair(_, pack_size, curr_length, acc) when curr_length == pack_size do
    IO.puts("find_max_pair: list length equals pack_size")
    acc
  end

  defp find_max_pair(index_list, pack_size, curr_length, acc) do

    len = length(index_list)

    highest_ranked_within_array = index_list
      |> Enum.slice(0, len - pack_size + 1)
      |> Enum.max_by(fn {value, _idx} -> value end)

    IO.puts "highest_ranked_within_array: #{inspect highest_ranked_within_array}"

    remain = index_list
      |> Enum.drop(elem(highest_ranked_within_array, 1) + 1)
      |> Enum.map(fn {first, _second} -> first end)
      |> Enum.with_index

    acc = acc <> "#{elem(highest_ranked_within_array, 0)}"

    IO.puts "remain: #{inspect remain} pack_size: #{inspect pack_size} acc: #{inspect acc}"
    find_max_pair(remain, pack_size - 1, curr_length, acc)
  end

  defp is_paper_roll?(_, pos) when pos < 0 do false end
  defp is_paper_roll?(t, pos) when pos >= tuple_size(t) do false end
  defp is_paper_roll?(t, pos) do elem(t, pos) == "@" end

end
