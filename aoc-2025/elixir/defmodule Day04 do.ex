defmodule Day04 do
  alias String, as: S
  # alias Enum, as: E

  def count_paper_rolls(input) do
    IO.puts("input: #{inspect(input)}")

    # each paper roll is 10 units wide
    row_size = 10

    data =
      S.graphemes(input)
      |> Enum.filter(fn c -> c != "\r\n" end)
      |> Enum.chunk_every(row_size)
      |> Enum.map(fn row -> row |> Enum.with_index |> List.to_tuple end)

    indexed_tuple = data |> List.to_tuple

    IO.puts("data: #{inspect(data)}")


    IO.puts("indexed_tuple: #{inspect(indexed_tuple)}")

    result =
      indexed_tuple
      |> Tuple.to_list()
      |> Enum.map_reduce(0, fn {elem, idx}, acc ->

        count = case elem
          do
            "." -> -1
            _ -> count_adjecent_rolls(indexed_tuple, idx, row_size)
          end

        # count = case elem
        #   do
        #     "." -> 0
        #     _ -> count_adjecent_rolls(indexed_tuple, idx, row_size)
        #   end

        IO.puts("idx: #{inspect(idx)} elem: #{inspect(elem)} count: #{inspect(count)}")
        {count, acc + count}
      end)

    IO.puts("elem:          #{inspect(elem(indexed_tuple, 2))}")
    IO.puts("is_paper_roll: #{inspect(is_paper_roll?(indexed_tuple, 2))}")

    IO.puts("result: #{inspect(result)}")

    {rolls, _} = result
    rolls |> Enum.filter(fn c -> c > -1 && c < 4 end) |> length()
  end

  defp count_adjecent_rolls(t, pos, row_size) do
      is_paper_roll?(t, pos - 1) +
        is_paper_roll?(t, pos - 1 - row_size) +
        is_paper_roll?(t, pos - 1 + row_size) +
        is_paper_roll?(t, pos + 1 - row_size) +
        is_paper_roll?(t, pos + 1) +
        is_paper_roll?(t, pos + 1 + row_size) +
        is_paper_roll?(t, pos - row_size) +
        is_paper_roll?(t, pos + row_size)
  end

  defp find_max_pair(_, pack_size, curr_length, acc) when curr_length == pack_size do
    IO.puts("find_max_pair: list length equals pack_size")
    acc
  end

  defp is_paper_roll?(_, pos) when pos < 0, do: 0
  defp is_paper_roll?(t, pos) when pos >= tuple_size(t), do: 0
  defp is_paper_roll?(t, pos) do
    {c, _} = elem(t, pos)
    case c do
      "@" -> 1
      _ -> 0
    end
  end

end
