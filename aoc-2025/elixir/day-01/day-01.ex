defmodule Day01 do
  import Enum, only: [map: 2]
  import String, only: [replace: 3, split: 3, to_integer: 1]

  def get_zero_positions(input) do
    data = input
      |> replace("L", "-")
      |> replace("R", "+")
      |> split("\r\n", trim: true)
      |> map(&to_integer/1)
      |> Enum.reduce([50], fn x, acc -> pos_accumulator(x, acc) end)

      IO.inspect(data |> Enum.reverse, label: "Positions")
     data |> Enum.count(&(&1 == 0))
  end

  defp pos_accumulator(rotation, state) do
    curr_pos = hd(state)
    new_pos = rem(curr_pos + rem(rotation, 100), 100)
    [new_pos | state]
  end

  def get_zero_passes(input) do
    initial_state = {50, 0} # Starting at position 50 with 0 zero passes
    input
      |> replace("L", "-")
      |> replace("R", "+")
      |> split("\r\n", trim: true)
      |> map(&to_integer/1)
      |> Enum.reduce(initial_state, fn x, acc -> acc_zero_passes(x, acc) end)
  end

  defp acc_zero_passes(rotation, state) do
    {curr_pos, total_passes} = state
    new_pos = rem(curr_pos + rem(rotation, 100), 100)

    # How many full passes through zero
    full_passes = div(abs(rotation), 100)

    zero_passes =
      cond do
        new_pos > curr_pos and rotation < 0 -> 1
        new_pos < curr_pos and rotation > 0 -> 1

        curr_pos < new_pos and curr_pos < 0 and new_pos > 0 -> 1
        curr_pos > new_pos and curr_pos > 0 and new_pos < 0 -> 1

        new_pos == 0 -> 1
        true -> 0
      end + full_passes

    IO.puts ("Curr Pos: #{curr_pos}, Rotation: #{rotation}, New Pos: #{new_pos}, Zero Passes: #{zero_passes}")

    fixed_p = fix_position(new_pos)
    {fixed_p, total_passes + zero_passes}
  end

  defp fix_position(position) when position < 0, do: position + 100
  defp fix_position(position) when position > 99, do: position - 100
  defp fix_position(position), do: position

end
