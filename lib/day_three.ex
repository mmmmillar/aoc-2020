defmodule AOC.DayThree do
  def num_trees_product(map, slopes) do
    slopes
    |> Enum.reduce(1, fn slope, acc ->
      acc * num_trees(map, slope)
    end)
  end

  def num_trees(map, slope) do
    map
    |> Enum.take_every(slope.y)
    |> Enum.with_index()
    |> Enum.reduce(0, fn {line, index}, acc ->
      case String.at(line, rem(index * slope.x, String.length(line))) do
        "#" when index > 0 ->
          acc + 1

        _ ->
          acc
      end
    end)
  end
end
