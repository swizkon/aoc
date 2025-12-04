defmodule Day01 do
  import Enum, only: [map: 2,  sort: 1, sum: 1]
  import String, only: [replace: 3, split: 3, to_integer: 1]

  def get_zero_positions(input) do
    input
      |> replace("L", "-")
      |> replace("R", "+")
      |> split("\r\n", trim: true)
      |> map(&to_integer/1)
    # zip_with(left |> sort, right |> sort, fn l, r -> abs(l - r) end) |> sum
  end

  # def find_similarity(input) do
  #   {left, right} = input_to_lists(input)

  #   left
  #     |> map(&(Enum.count(right, fn x -> x == &1 end) * &1))
  #     |> sum
  # end

  defp input_to_lists(input) do
    input
      |> split("\r\n", trim: true)
      |> map(&to_integer/1)
  end

  # defp convert_rotation_to_int(val) do
  #   IO.puts "#{inspect val}"
  #   <<direction::binary-size(1), clicks::binary>> = val
  #   to_integer(clicks)
  # end

  # defp convert_rotation_to_int(<<"L", val::binary>>) do
  #   Enum.map(val, &to_integer/1)
  # end

  # defp convert_rotation_to_int(val) do
  #   Enum.map(val, &to_integer/1)
  # end

  # defp map_to_integer({l, r}) do

  #   Enum.map(r, &to_integer/1)

  #   #{ Enum.map(l, &to_integer/1), Enum.map(r, &to_integer/1) }
  # end

end
