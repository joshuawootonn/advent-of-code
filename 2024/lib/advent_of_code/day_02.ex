defmodule AdventOfCode.Day02 do
  defp is_safe(chunk, tolerance \\ 0) do
    result =
      String.split(chunk)
      |> Enum.chunk_every(2, 1, :discard)
      |> Enum.reduce(%{direction: "unknown", direction_fault: 0, diff_fault: 0}, fn
        _curr, acc when acc.direction_fault > tolerance ->
          acc

        _curr, acc when acc.diff_fault > tolerance ->
          acc

        curr, acc ->
          head = List.first(curr) |> String.to_integer()
          tail = List.last(curr) |> String.to_integer()
          nextDirection = if head - tail > 0, do: "asc", else: "desc"
          nextDiff = abs(head - tail)

          direction_fault =
            if acc.direction == "unknown",
              do: 0,
              else:
                if(acc.direction == nextDirection,
                  do: acc.direction_fault,
                  else: acc.direction_fault + 1
                )

          diff_fault =
            if nextDiff > 0 and nextDiff < 4, do: acc.diff_fault, else: acc.diff_fault + 1

          # IO.inspect(%{
          #   head: head,
          #   tail: tail,
          #   direction_fault: direction_fault,
          #   diff_fault: diff_fault
          # })

          %{
            direction: nextDirection,
            direction_fault: direction_fault,
            diff_fault: diff_fault
          }
      end)

    # IO.inspect(%{
    #   dir: result.direction_fault,
    #   diff: result.diff_fault,
    #   tolerance: tolerance
    # })

    if result.direction_fault <= tolerance and result.diff_fault <= tolerance, do: 1, else: 0
  end

  def part1(args) do
    chunks = String.trim(args) |> String.split("\n")

    Enum.map(chunks, &is_safe(&1)) |> Enum.sum()
  end

  def part2(_args) do
  end
end
