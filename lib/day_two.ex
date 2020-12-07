defmodule AOC.DayTwo do
  defp parse_entry(e) do
    split = String.split(e, ["-", " ", ":"]) |> Enum.filter(fn x -> x != "" end)

    %{
      first: String.to_integer(Enum.at(split, 0)),
      second: String.to_integer(Enum.at(split, 1)),
      x: Enum.at(split, 2),
      password: Enum.at(split, 3)
    }
  end

  def is_valid_1(e) do
    required_char_count = String.length(String.replace(e.password, ~r/[^#{e.x}]*/, ""))
    required_char_count >= e.first and required_char_count <= e.second
  end

  @spec is_valid_2(
          atom
          | %{first: non_neg_integer, password: binary, second: non_neg_integer, x: any}
        ) :: boolean
  def is_valid_2(e) do
    first = String.slice(e.password, e.first - 1, 1) == e.x
    second = String.slice(e.password, e.second - 1, 1) == e.x

    (first and !second) or (!first and second)
  end

  def num_valid_passwords(passwords, validator) do
    Enum.reduce(passwords |> Enum.map(&parse_entry/1) |> Enum.map(validator), 0, fn p, acc ->
      case p do
        true -> acc + 1
        _ -> acc
      end
    end)
  end
end
