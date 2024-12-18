defmodule ReportValidation do
  defstruct prev: -1, status: 0, incrs: 0, decrs: 0, dups: 0, errors: 0
end

defmodule Day02 do
  import Enum, only: [map: 2]
  import String, only: [split: 3, to_integer: 1]

  def safe_reports(input) do
    reports = input_to_reports(input)
    reports
      |> map(&(loose_validate_report(&1)))
      |> Enum.flat_map(fn x -> x end)
      |> length
  end

  defp input_to_reports(input) do
    input
      |> split("\r\n", trim: true)
      |> map(&(split(&1, " ", trim: true) |> map(fn x -> to_integer(x) end)))
  end

  defp loose_validate_report(report) do
    transform_to_loose(report)
      |> Enum.map(fn x -> validate_single_report(x) end)
      |> Enum.filter(fn x -> x.status == 0 end)
      |> Enum.take(1)
  end

  defp validate_single_report(report) do
    Enum.reduce_while(report, %ReportValidation{}, fn x, acc ->
      cond do
        acc.prev < 0 ->
          {:cont, %{acc | prev: x}}

        acc.prev == x ->
          {:halt, %{acc | status: 1, dups: acc.dups + 1, errors: acc.errors + 1}}

        abs(x - acc.prev) > 3 ->
          {:halt, %{acc | status: 4, errors: acc.errors + 1}}

        x < acc.prev and acc.incrs > 0 ->
          {:halt, %{acc | status: 2, errors: acc.errors + 1}}

        x > acc.prev and acc.decrs > 0  ->
          {:halt, %{acc | status: 3, errors: acc.errors + 1}}

        x < acc.prev ->
          {:cont, %{acc | prev: x, decrs: acc.decrs + 1}}

        true ->
          {:cont, %{acc | prev: x, incrs: acc.incrs + 1}}
      end
    end)

  end

  defp transform_to_loose(list) do
    Enum.map(Enum.with_index(list), fn {_, index} ->
      List.delete_at(list, index)
    end)
  end

end


data = File.read!("day-02.txt")

safe_reports = Day02.safe_reports(data)
IO.inspect(safe_reports, label: "safe_reports")

# find_similarity = Day01.find_similarity(data)
# IO.inspect(find_similarity, label: "find_similarity")
