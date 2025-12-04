defmodule Day01 do
  import Enum, only: [map: 2]
  import String, only: [replace: 3, split: 3, to_integer: 1]

  def get_zero_positions(input) do
    data = input
      |> replace("L", "-")
      |> replace("R", "+")
      |> split("\r\n", trim: true)
      |> map(&to_integer/1)
      |> Enum.reduce([50], fn x, acc -> accumulator(x, acc) end)

      IO.inspect(data |> Enum.reverse, label: "Positions")
     data |> Enum.count(&(&1 == 0))
  end

  defp accumulator(rotation, state) do
    curr_pos = hd(state)
    new_pos = rem(curr_pos + rem(rotation, 100), 100)

    # To get the count of zero passes, check if old and new positions cross zero
    # This logic can be adjusted based on specific requirements
    # if (curr_pos > 0 and new_pos <= 0) or (curr_pos < 0 and new_pos >= 0) do

    [new_pos | state]
  end

  def get_zero_passes(input) do
    initial_state = [50]
    input
      |> replace("L", "-")
      |> replace("R", "+")
      |> split("\r\n", trim: true)
      |> map(&to_integer/1)
      |> Enum.reduce(initial_state, fn x, acc -> acc_zero_passes(x, acc) end)
      |> Enum.count(&(&1 == 0))
  end

  defp acc_zero_passes(rotation, state) do
    curr_pos = hd(state)
    new_pos = rem(curr_pos + rem(rotation, 100), 100)

    # To get the count of zero passes, check if old and new positions cross zero
    # This logic can be adjusted based on specific requirements
    # if (curr_pos > 0 and new_pos <= 0) or (curr_pos < 0 and new_pos >= 0) do

    [new_pos | state]
  end


end
