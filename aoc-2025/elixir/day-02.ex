defmodule Day02 do
  # import Enum, only: [map: 2]
  import String, only: [replace: 3, split: 3, to_integer: 1, split_at: 2]

  import Stream, only: [map: 2]

  def sum_invalid_ids(input) do
    input
      |> split(",", trim: true)
      |> map(&to_int_range/1)
      |> Enum.flat_map(& &1)
      |> Enum.filter(&(is_invalid_id(&1)))
      # |> Enum.uniq()
      |> Enum.sum()
  end

  defp to_int_range(range) do
    [start_s, end_s] = String.split(range, "-")
    result = Enum.to_list(to_integer(start_s)..to_integer(end_s))
  end

  defp is_invalid_id(id) do
    s_id = to_string(id)

    half_length = div(String.length(s_id), 2)
    {left_half, right_half} = split_at(s_id, half_length)
    left_half == right_half
  end

end
