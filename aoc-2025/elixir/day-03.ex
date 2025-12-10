defmodule Day03 do
  alias String, as: S
  alias Enum, as: E

  def sum_joltage(input) do
    input
      |> S.split("\r\n", trim: true)
      |> E.map(&transform_data/1)
      |> E.sum()
  end

  def sum_joltage_bigpack(input, pack_size) do

    IO.puts "input: #{inspect input} pack_size: #{inspect pack_size}"
    data = input
      |> S.split("\r\n", trim: true)
      |> E.map(&transform_data/1)

    # IO.puts "data: #{inspect data}"

    initial_state = []

    data
    #  |> E.sum()
  end

  defp transform_data(input) do
    data = input
      |> S.graphemes
      |> E.map(&S.to_integer/1)
      # |> Enum.reverse
      |> Enum.with_index
      # |> Enum.reverse

    IO.puts("data: #{inspect data}")
    data
      |> find_max_pair(3, "")
  end

  defp find_max_pair([], _, acc) do

    IO.puts("find_max_pair No more to calc...")
    acc
  end

  defp find_max_pair(index_list, pack_size, acc) do
    highest_ranked_within_array = index_list
      |> Enum.slice(0, pack_size)
      |> Enum.max_by(fn {value, _idx} -> value end)

    IO.puts "highest_ranked_within_array: #{inspect highest_ranked_within_array}"

    remain = index_list
      |> Enum.drop(elem(highest_ranked_within_array, 1) + 1)

    acc = acc <> "#{elem(highest_ranked_within_array, 0)}"

    IO.puts "remain: #{inspect remain} pack_size: #{inspect pack_size} acc: #{inspect acc}"
    find_max_pair(remain, pack_size, acc)
  end

  # defp find_max_pair(data) do
  #   indexed = data
  #   first = indexed
  #     |> Enum.drop(-1)
  #     |> Enum.max_by(fn {value, _idx} -> value end)

  #   IO.puts "first: #{inspect first}"

  #   second = indexed
  #     |> Enum.drop(elem(first, 1) + 1)
  #     |> Enum.max_by(fn {value, _idx} -> value end)
  #   S.to_integer("#{elem(first, 0)}#{elem(second, 0)}")
  # end

end
