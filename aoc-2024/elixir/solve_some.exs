Code.require_file("day-03/day-03.ex", __DIR__)


data = File.read!("../inputs/day-03.txt")

result = Day03.do_and_dont(data)
IO.inspect(result, label: "do_and_dont")
