defmodule Day03 do
  alias String, as: S
  alias Enum, as: E

  # def sum_joltage(input) do
  #   input
  #     |> S.split("\r\n", trim: true)
  #     |> E.map(&transform_data/1)
  #     |> E.sum()
  # end

  def sum_joltage_bigpack(input, pack_size) do

    IO.puts "input: #{inspect input} pack_size: #{inspect pack_size}"
    data = input
      |> S.split("\r\n", trim: true)
      |> E.map(fn a -> transform_data(a, pack_size) end)

    # data = Enum.map(data, fn x -> transform_data(x, pack_size) end)
    # Enum.map(list, fn a -> transform_data(a, pack_size) end)
    # initial_state = []

    data
      |> E.map(&S.to_integer/1)
      |> E.sum()
  end

  defp transform_data(input, pack_size) do
    data = input
      |> S.graphemes
      |> E.map(&S.to_integer/1)
      # |> Enum.reverse
      |> Enum.with_index
      # |> Enum.reverse

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
    # handle this case as needed
    acc
  end

  defp find_max_pair(index_list, pack_size, curr_length, acc) do

    len = length(index_list)
    # index_list =
    #   cond do
    #     len == pack_size -> []
    #     true -> index_list
    #   end

    # IO.puts "length acc: #{S.length(acc)}"
    IO.puts "len index_list: #{len}"

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

end
