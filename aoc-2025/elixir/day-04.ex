defmodule Day04 do
  alias String, as: S
  # alias Enum, as: E

  def first_removable_paper_rolls(input, row_size) do
    indexed_tuple =
      "_" <> S.replace(input, "\r\n", "__") <> "_"
      |> S.graphemes #(input)
      |> Enum.filter(fn c -> c != "\r\n" end)
      |> Enum.with_index
      |> List.to_tuple
    count_paper_rolls(indexed_tuple, row_size)
  end

  def total_removable_paper_rolls(input, row_size) do
    indexed_tuple =
      "_" <> S.replace(input, "\r\n", "__") <> "_"
      |> S.graphemes
      |> Enum.filter(fn c -> c != "\r\n" end)
      |> Enum.with_index
      |> List.to_tuple

    IO.inspect(indexed_tuple, label: "indexed_tuple")
    yolo = count_paper_rolls(indexed_tuple, row_size)
    IO.inspect(yolo, label: "yolo")
    yolo
  end

  defp count_paper_rolls(indexed_tuple, row_size) do

    list =
      indexed_tuple
      |> Tuple.to_list()
      |> Enum.map(fn {elem, idx} -> {{elem, idx}, 0, 0} end)

    # IO.inspect(list, label: "list")

    calculated = sum_removable_rolls(indexed_tuple, list, 0, row_size)

    IO.inspect(calculated, label: "calculated")
    count = calculated
      |> Enum.count(fn {{match,_}, _, _} -> match == "x" end)

    # IO.inspect(count, label: "count")

    # result =
    #   indexed_tuple
    #     |> Tuple.to_list()
    #     |> Enum.map_reduce(0, fn {elem, idx}, acc ->
    #     count = case elem
    #       do
    #         "@" -> count_adjecent_rolls(indexed_tuple, idx, row_size)
    #         "." -> -1
    #         _ -> -2
    #       end

    #     # res = case count
    #     #   do
    #     #     c when c > -1 and c < 4 -> {{"x", idx}, 1, iteration}
    #     #     _ ->  {{elem, idx}, 0, iteration}
    #     #   end

    #     # IO.inspect(res, label: "res")

    #     {count, acc + count}
    #   end)

    # IO.inspect(result, label: "count_paper_rolls result")

    # # total_count = case iteration do
    # #   0 -> elem(result, 1)
    # #   _ -> 0
    # # end

    # {rolls, _} = result
    # rolls |> Enum.filter(fn c -> c > -1 && c < 4 end) |> length()
  end

  defp sum_removable_rolls(indexed_tuple, list, iteration, row_size) do

    IO.inspect(indexed_tuple, label: "sum_removable_rolls indexed_tuple at iteration #{iteration}")
    IO.inspect(list, label: "sum_removable_rolls list at iteration #{iteration}")
    mapped =
      list
      |> Enum.map(fn {{elem, idx},_,_} ->
        count = case elem
          do
            "@" -> count_adjecent_rolls(indexed_tuple, idx, row_size)
            "." -> -1
            _ -> -2
          end

        res = case count
          do
            c when c > -1 and c < 4 -> {{"x", idx}, 1, iteration}
            _ ->  {{elem, idx}, 0, iteration}
          end

        # IO.inspect(res, label: "sum_removable_rolls item")

        res
      end)


    iteration_removed = Enum.any?(mapped, fn {_, match, iter} -> match == 1 and iter == iteration end)

    # IO.inspect(iteration_removed, label: "iteration_removed")
    # IO.inspect(mapped, label: "mapped")

    if iteration_removed do
      indexed_tuple = mapped
        |> Enum.map(fn {{c, i}, _, _} -> {c, i} end)
        |> List.to_tuple
      IO.inspect(indexed_tuple, label: "new indexed_tuple for next iteration")
      IO.puts("Some removable rolls found in iteration #{iteration}, continuing...")
      sum_removable_rolls(indexed_tuple, mapped, iteration + 1, row_size)
    else
      IO.puts("No more removable rolls found in iteration #{iteration}, stopping...")
      mapped
    end

    # result = cond do
    #   iteration_removed -> sum_removable_rolls(indexed_tuple, mapped, iteration + 1, row_size)
    #   true -> mapped
    # end

    # result
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



#################################################################


  # defp find_max_pair(_, pack_size, curr_length, acc) when curr_length == pack_size do
  #   IO.puts("find_max_pair: list length equals pack_size")
  #   acc
  # end
