defmodule AOC.DayFour do
  defp parse_passport(p) do
    p
    |> String.split([" ", ":"])
    |> Enum.filter(fn x -> x != "" end)
    |> List.flatten()
    |> Enum.chunk_every(2)
    |> Map.new(fn [k, v] -> {k, v} end)
  end

  def is_valid(p) do
    required = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]

    Enum.reduce(required, true, fn r, acc ->
      case p[r] do
        nil -> acc and false
        _ -> acc and true
      end
    end)
  end

  def num_valid_passports(passports) do
    Enum.reduce(passports |> Enum.map(&parse_passport/1) |> Enum.map(&is_valid/1), 0, fn p, acc ->
      case p do
        true -> acc + 1
        _ -> acc
      end
    end)
  end
end
