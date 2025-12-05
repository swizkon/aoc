defmodule Day03 do
  alias String, as: S
  alias Enum, as: E

  def sum_joltage(input) do
    data = input
      |> S.split("\r\n", trim: true)
      |> E.map(&S.graphemes/1)
      |> E.map(&to_ints/1)
      |> E.map(&find_max_pair/1)
    IO.puts "data: #{inspect data}"
    data # |> E.sum()
  end

  defp to_ints(list) do
    Enum.map(list, &String.to_integer/1)
    #  |> Enum.chunk_every(2, 1, :discard)
  end

  defp find_max_pair(data) do

    first = data
      |> Enum.with_index()
      |> Enum.max_by(fn {value, _idx} -> value end)

      IO.puts "first: #{inspect first}"

    second = data
      |> Enum.with_index()
    # Enum.max(in)
    # d |> Enum.map(&Integer.to_string/1)
    #   |> Enum.join("")
    #   |> String.to_integer()
  end

  defp find_max(pair, state) do
    [first, second] = pair
    [first_max, second_max] = state

    IO.puts("curr state:  [#{first_max}, #{second_max}] in: [#{first}, #{second}]")

    first_max = if first > first_max, do: first, else: first_max
    second_max = if second > second_max, do: second, else: second_max

    IO.puts("new state:  [#{first_max}, #{second_max}]")
    [first_max, second_max]
  end

  # defp join_ints(d) do
  #   d |> Enum.map(&Integer.to_string/1)
  #     |> Enum.join("")
  #     |> String.to_integer()
  # end



end
