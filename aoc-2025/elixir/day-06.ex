defmodule Day06 do
  alias String, as: S
  alias Enum, as: E

  def grand_total(input) do
    parts = input
      |> S.split("\r\n")
      |> E.reverse()

    [arithm | numbers] = parts

    numbers = numbers
      |> E.map(fn r -> S.split(r, " ", trim: true) |> E.map(&S.to_integer/1) end)
      |> E.zip()
      |> E.map(&Tuple.to_list/1)
      |> E.with_index

    arithm = arithm
      |> S.split(" ", trim: true)
      |> E.with_index

    E.map(numbers, fn {num_list, idx} ->
      op = E.find(arithm, fn {_op, i} -> i == idx end) |> elem(0)
      case op do
        "+" -> E.sum(num_list)
        "*" -> E.reduce(num_list, 1, &(&1 * &2))
      end
    end)
      |> E.sum()

  end

end
