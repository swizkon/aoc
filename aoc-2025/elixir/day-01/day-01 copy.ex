defmodule Day01 do
  import Enum, only: [map: 2, sum: 1]
  import String, only: [replace: 3, split: 3, to_integer: 1]

  def get_zero_positions(input) do
    rotations = input
      |> replace("L", "-")
      |> replace("R", "+")
      |> split("\r\n", trim: true)
      |> map(&to_integer/1)
      |> map(&(rem(&1, 100))) # remove extra full turns

    positions = Enum.reduce(rotations, [50], fn x, acc -> accumulator(x, acc) end)
      |> Enum.reverse

    zero_positions = positions
      # |> Enum.filter(&(&1 == 0))
      |> Enum.count(&(&1 == 0))

  end

  defp accumulator(rotation, state) do
    curr_pos = hd(state)
    new_pos = fix_position(curr_pos + rotation)

    IO.puts "curr_post #{curr_pos} and rotation: #{rotation} = new_pos: #{inspect new_pos}"

    [new_pos | state]
  end

  def fix_position(position) when position < 0, do: position + 100
  def fix_position(position) when position > 99, do: position - 100
  def fix_position(position), do: position

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
