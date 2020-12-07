defmodule AOC.DayThree do
  def num_trees(map) do
    map
    |> Enum.with_index()
    |> Enum.reduce(0, fn {line, index}, acc ->
      case String.at(line, rem(index * 3, String.length(line))) do
        "#" when index > 0 ->
          acc + 1

        _ ->
          acc
      end
    end)
  end
end
