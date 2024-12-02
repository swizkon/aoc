defmodule Day01 do
  import Enum, only: [map: 2, unzip: 1, zip_with: 3, sort: 1, sum: 1]
  import String, only: [split: 3, to_integer: 1]

  def calculate_difference(input) do
    {left, right} = input_to_lists(input)
    zip_with(left |> sort, right |> sort, fn l, r -> abs(l - r) end) |> sum
  end

  def find_similarity(input) do
    {left, right} = input_to_lists(input)

    # Find how many times numbers in left occur in right
    res = left
      |> map(&Enum.count(right, &1) * &1)
      |> sum

      IO.inspect(res, label: "res")

  end

  defp input_to_lists(input) do
    input
      |> split("\r\n", trim: true)
      |> map(&(split(&1, " ", trim: true) |> List.to_tuple))
      |> unzip
      |> map_to_integer
  end

  defp map_to_integer({l, r}) do
    { Enum.map(l, &to_integer/1), Enum.map(r, &to_integer/1) }
  end

  # defp map_to_integer({list, _}) do
  #   Enum.map(list, &to_integer/1)
  # end

  # defp map_to_integer(list) do
  #   Enum.map(list, &to_integer/1)
  # end


end


file = File.read!("day-01-test.txt")

calculate_difference = Day01.calculate_difference(file)
IO.inspect(calculate_difference, label: "calculate_difference")

find_similarity = Day01.find_similarity(file)
IO.inspect(find_similarity, label: "find_similarity")
