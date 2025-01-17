defmodule AdventOfCode.Day01Test do
  use ExUnit.Case

  import AdventOfCode.Day01

  test "part1" do
    input = AdventOfCode.Input.get!(1, 2024)

    # input = """
    # 3   4
    # 4   3
    # 2   5
    # 1   3
    # 3   9
    # 3   3
    # """

    result = part1(input)

    assert result == 2_113_135
    # assert result == 11
  end

  test "part2" do
    input = AdventOfCode.Input.get!(1, 2024)

    # input = """
    # 3   4
    # 4   3
    # 2   5
    # 1   3
    # 3   9
    # 3   3
    # """

    result = part2(input)

    assert result == 19_097_157
    # assert result == 31
  end
end
