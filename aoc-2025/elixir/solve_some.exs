# Code.require_file("day-01/day-01.ex", __DIR__)

# data = File.read!("../inputs/day-01.txt")
# data = File.read!("../inputs/day-01-test.txt")
# data = File.read!("../inputs/day-01-test-ext.txt")

# result = Day01.get_zero_positions(data)
# IO.inspect(result, label: "get_zero_positions")

# result = Day01.get_zero_passes(data)
# IO.inspect(result, label: "get_zero_passes")



#################################################################
# DAY 02

Code.require_file("day-02.ex", __DIR__)

data = File.read!("../inputs/day-02-test.txt")
data = File.read!("../inputs/day-02.txt")
result = Day02.sum_invalid_ids(data)

correct = result == 1_227_775_554
IO.inspect(result, label: "sum_invalid_ids")
IO.inspect(correct, label: "Correct?")
