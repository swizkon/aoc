defmodule Day01 do
  import Enum, only: [map: 2]
  import String, only: [replace: 3, split: 3, to_integer: 1]

  def get_zero_positions(input) do
    input
      |> replace("L", "-")
      |> replace("R", "+")
      |> split("\r\n", trim: true)
      |> map(&to_integer/1)
      |> Enum.reduce([50], fn x, acc -> accumulator(x, acc) end)
      # |> Enum.reverse
      |> Enum.count(&(&1 == 0))
  end

  defp accumulator(rotation, state) do
    curr_pos = hd(state)
    new_pos = rem(curr_pos + rem(rotation, 100), 100)
    [new_pos | state]
  end

  defp fix_position(position) when position < 0, do: position + 100
  defp fix_position(position) when position > 99, do: position - 100
  defp fix_position(position), do: position

end
