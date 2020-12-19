defmodule AOC.DayFour do
  def validate_height(h) do
    hgt = Regex.named_captures(~r/^(?<height>[\d]+)(?<unit>(cm|in))$/, h)

    if hgt != nil do
      height = String.to_integer(hgt["height"])
      unit = hgt["unit"]

      cond do
        unit == "cm" and height >= 150 and height <= 193 -> true
        unit == "in" and height >= 59 and height <= 76 -> true
        true -> false
      end
    else
      false
    end
  end

  def validate_hair(h) do
    String.match?(h, ~r/^#[0-9a-f]{6}$/)
  end

  def validate_eye(e) do
    case e do
      "amb" -> true
      "blu" -> true
      "brn" -> true
      "gry" -> true
      "grn" -> true
      "hzl" -> true
      "oth" -> true
      _ -> false
    end
  end

  def validate_pid(p) do
    String.match?(p, ~r/^[0-9]{9}$/)
  end

  defp parse_passport(p) do
    p
    |> String.split([" ", ":"])
    |> Enum.filter(fn x -> x != "" end)
    |> List.flatten()
    |> Enum.chunk_every(2)
    |> Map.new(fn [k, v] -> {k, v} end)
  end

  def is_valid(p, validate) do
    validators = %{
      byr: fn x -> String.to_integer(x) >= 1920 and String.to_integer(x) <= 2002 end,
      iyr: fn x -> String.to_integer(x) >= 2010 and String.to_integer(x) <= 2020 end,
      eyr: fn x -> String.to_integer(x) >= 2020 and String.to_integer(x) <= 2030 end,
      hgt: fn x -> validate_height(x) end,
      hcl: fn x -> validate_hair(x) end,
      ecl: fn x -> validate_eye(x) end,
      pid: fn x -> validate_pid(x) end
    }

    Enum.reduce(Map.keys(validators), true, fn k, acc ->
      case p[to_string(k)] do
        nil ->
          acc and false

        x when validate ->
          acc and validators[k].(x)

        _ ->
          acc and true
      end
    end)
  end

  def num_valid_passports(passports, validate) do
    Enum.reduce(
      passports
      |> Enum.map(&parse_passport/1)
      |> Enum.map(&is_valid(&1, validate)),
      0,
      fn p, acc ->
        case p do
          true -> acc + 1
          _ -> acc
        end
      end
    )
  end
end
