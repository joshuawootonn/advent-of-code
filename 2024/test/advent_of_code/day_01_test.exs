defmodule AdventOfCode.Day01Test do
  use ExUnit.Case

  import AdventOfCode.Day01

  @tag :skip
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

    assert result == 11
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

    assert result
  end
end
