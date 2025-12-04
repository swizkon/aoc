Code.require_file("day-01/day-01.ex", __DIR__)


data = File.read!("../inputs/day-01.txt")
# data = File.read!("../inputs/day-01-test.txt")
# data = File.read!("../inputs/day-01-test-ext.txt")

# result = Day01.get_zero_positions(data)
# IO.inspect(result, label: "get_zero_positions")

result = Day01.get_zero_passes(data)
IO.inspect(result, label: "get_zero_passes")
