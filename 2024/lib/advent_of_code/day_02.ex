defmodule AdventOfCode.Day02 do
  defp is_safe(line, tolerance) when tolerance > -1 do
    result =
      String.split(line)
      |> Enum.chunk_every(2, 1, :discard)
      |> Enum.with_index()
      |> Enum.reduce(%{direction: "unknown"}, fn
        _curr, acc when acc.fault != nil ->
          acc

        curr, acc ->
          index = elem(curr, 1)
          head = List.first(elem(curr, 0)) |> String.to_integer()
          tail = List.last(elem(curr, 0)) |> String.to_integer()
          nextDirection = if head - tail > 0, do: "asc", else: "desc"
          nextDiff = abs(head - tail)

          direction_fault =
            if acc.direction == "unknown",
              do: false,
              else:
                if(acc.direction == nextDirection,
                  do: false,
                  else: true
                )

          diff_fault =
            if nextDiff > 0 and nextDiff < 4, do: false, else: true

          if direction_fault == true or diff_fault == true do
            %{
              direction: nextDirection,
              fault: [direction_fault: direction_fault, diff_fault: diff_fault, index: index]
            }
          else
            %{
              direction: nextDirection
            }
          end
      end)

    if(Map.get(result, :fault) != nil) do
      nextTolerance = tolerance - 1

      Enum.map(
        0..length(String.split(line)),
        fn index -> String.split(line) |> List.delete_at(index) |> Enum.join(" ") end
      )
      |> Enum.any?(&is_safe(&1, nextTolerance))
    else
      true
    end
  end

  defp is_safe(_line, -1) do
    false
  end

  def part1(args) do
    String.trim(args)
    |> String.split("\n")
    |> Enum.map(&is_safe(&1, 0))
    |> Enum.map(fn
      true -> 1
      false -> 0
    end)
    |> Enum.sum()
  end

  def part2(args) do
    String.trim(args)
    |> String.split("\n")
    |> Enum.map(&is_safe(&1, 1))
    |> Enum.map(fn
      true -> 1
      false -> 0
    end)
    |> Enum.sum()
  end
end
