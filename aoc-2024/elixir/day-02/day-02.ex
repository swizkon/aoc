defmodule ReportValidation do
  defstruct prev: -1, status: 0, incrs: 0, decrs: 0, dups: 0, errors: 0
end

defmodule Day02 do
  import Enum, only: [map: 2]
  import String, only: [split: 3, to_integer: 1]

  def safe_reports(input) do
    reports = input_to_reports(input)

    IO.inspect(reports, label: "reports")

    safe_reports = reports
      |> map(&(validate_report(&1)))
      |> Enum.flat_map(fn x -> x end)

    IO.inspect(safe_reports, label: "safe_reports")
    safe_reports
      # |> Enum.filter(fn x -> x.status == 0 end)
      |> length
  end

  defp input_to_reports(input) do
    input
      |> split("\r\n", trim: true)
      |> map(&(split(&1, " ", trim: true) |> map(fn x -> to_integer(x) end)))
  end

  defp validate_report(report) do

    # res = validate_single_report(report)

    # IO.inspect(res, label: "res")

    # if res.status == 0 do
    #   IO.inspect("no errors", label: "no errors")
    #   [res]
    # end

    IO.inspect("loose_validate_report", label: "loose_validate_report")
    loose_validate_report(report)
      |> Enum.filter(fn x -> x.status == 0 end)
      |> Enum.take(1)

    # Enum.reduce_while(report, %ReportValidation{}, fn x, acc ->
    #   cond do
    #     acc.prev < 0 ->
    #       {:cont, %{acc | prev: x}}

    #     acc.prev == x ->
    #       {:halt, %{acc | status: 1, dups: acc.dups + 1}}

    #     abs(x - acc.prev) > 3 ->
    #       {:halt, %{acc | status: 4}}

    #     x < acc.prev and acc.incrs > 0 ->
    #       {:halt, %{acc | status: 2}}

    #     x < acc.prev ->
    #       {:cont, %{acc | prev: x, decrs: acc.decrs + 1}}

    #     x > acc.prev and acc.decrs > 0  ->
    #       {:halt, %{acc | status: 3}}

    #     true ->
    #       {:cont, %{acc | prev: x, incrs: acc.incrs + 1}}
    #   end
    # end)

  end

  defp loose_validate_report(report) do
    IO.inspect(report, label: "report")

    loose_reports = transform_to_loose(report)

    IO.inspect(loose_reports, label: "loose_reports")

    Enum.map(loose_reports, fn x -> validate_single_report(x) end)


  end

  defp validate_single_report(report) do
    Enum.reduce_while(report, %ReportValidation{}, fn x, acc ->
      cond do
        acc.prev < 0 ->
          {:cont, %{acc | prev: x}}

        acc.prev == x ->
          {:cont, %{acc | prev: x, status: 1, dups: acc.dups + 1, errors: acc.errors + 1}}

        abs(x - acc.prev) > 3 ->
          {:cont, %{acc | status: 4, errors: acc.errors + 1}}

        x < acc.prev and acc.incrs > 0 ->
          {:cont, %{acc | status: 2, errors: acc.errors + 1}}

        x < acc.prev ->
          {:cont, %{acc | prev: x, decrs: acc.decrs + 1}}

        x > acc.prev and acc.decrs > 0  ->
          {:cont, %{acc | status: 3, errors: acc.errors + 1}}

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
