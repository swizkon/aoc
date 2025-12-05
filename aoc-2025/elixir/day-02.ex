defmodule Day02 do
  import String, only: [split: 3, to_integer: 1, split_at: 2]

  import Stream, only: [map: 2]

  def sum_invalid_ids(input) do
    input
      |> split(",", trim: true)
      |> map(&to_int_range/1)
      |> Enum.flat_map(& &1)
      |> Enum.filter(&(is_any_invalido_id(&1)))
      |> Enum.sum()
  end

  defp to_int_range(range) do
    [start_s, end_s] = String.split(range, "-")
    Enum.to_list(to_integer(start_s)..to_integer(end_s))
      |> Enum.filter(& &1 > 9)
  end

  defp is_invalid_id(id) do
    s_id = to_string(id)

    half_length = div(String.length(s_id), 2)
    {left_half, right_half} = split_at(s_id, half_length)
    left_half == right_half
  end

  defp is_any_invalido_id(id) do
    s_id = to_string(id)

    half_length = div(String.length(s_id), 2)

    1..half_length
      |> Enum.map(&(is_any_invalid_id(&1, s_id)))
      |> Enum.any?()
  end

  defp is_any_invalid_id(chunk_size, s_id) do
    s_id
      |> String.graphemes()
      |> Enum.chunk_every(chunk_size)
      |> Enum.map(&Enum.join/1)
      |> Enum.uniq()
      |> Enum.count() == 1
  end

end
