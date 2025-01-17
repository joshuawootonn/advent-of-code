defmodule AdventOfCode.Day01 do
  def part1(args) do
    chunks =
      String.trim(args)
      |> String.split("\n")

    first_chunks = chunks |> Enum.map(&String.split(&1, " ")) |> Enum.map(&hd(&1)) |> Enum.sort()

    second_chunks =
      chunks |> Enum.map(&String.split(&1, " ")) |> Enum.map(&List.last(&1)) |> Enum.sort()

    Enum.zip(first_chunks, second_chunks)
    |> Enum.map(&abs(String.to_integer(elem(&1, 0)) - String.to_integer(elem(&1, 1))))
    |> Enum.sum()
  end

  def part2(args) do
    chunks =
      String.trim(args)
      |> String.split("\n")

    first_chunks = chunks |> Enum.map(&String.split(&1, " ")) |> Enum.map(&hd(&1)) |> Enum.sort()

    second_chunks =
      chunks |> Enum.map(&String.split(&1, " ")) |> Enum.map(&List.last(&1)) |> Enum.sort()

    Enum.map(first_chunks, fn a ->
      Enum.count(second_chunks, fn b -> b == a end) * String.to_integer(a)
    end)
    |> Enum.sum()
  end
end
