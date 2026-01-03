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

# Code.require_file("day-02.ex", __DIR__)

# # data = File.read!("../inputs/day-02-test.txt")
# data = File.read!("../inputs/day-02.txt")
# result = Day02.sum_invalid_ids(data)

# correct = result == 4_174_379_265
# IO.inspect(result, label: "sum_invalid_ids")
# IO.inspect(correct, label: "Correct?")


#################################################################
# DAY 03






#################################################################
# DAY 04


# day = 4


# Code.require_file("day-04.ex", __DIR__)

# # data = File.read!("../inputs/day-04-test.txt")
# data = File.read!("../inputs/day-04.txt")

# result = Day04.count_paper_rolls(data, 137 + 2)

# correct = result == 13
# IO.inspect(result, label: "count_paper_rolls")
# IO.inspect(correct, label: "Correct?")




#################################################################
# DAY 05

# Code.require_file("day-05.ex", __DIR__)

# # data = File.read!("../inputs/day-05-test.txt")
# data = File.read!("../inputs/day-05.txt")

# result = Day05.all_fresh_ingredients(data)

# correct = result == 14
# IO.inspect(result, label: "all_fresh_ingredients")
# IO.inspect(correct, label: "Correct?")


# # 329866104274383
# # 329866104274383
# # 329866104274383
# # 329866104274383
# # 352681648086146



#################################################################
# DAY 06

Code.require_file("day-06.ex", __DIR__)

# data = File.read!("../inputs/day-06-test.txt")
data = File.read!("../inputs/day-06.txt")

result = Day06.grand_total(data)

correct = result == 4277556
IO.inspect(result, label: "grand_total")
IO.inspect(correct, label: "Correct?")
