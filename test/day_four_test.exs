defmodule AOC.DayFourTest do
  use ExUnit.Case

  defp parse(s) do
    s
    |> String.replace("\n\n", "---")
    |> String.replace("\n", " ")
    |> String.split("---")
    |> Enum.map(&String.trim/1)
  end

  setup_all do
    [
      sample_set:
        "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
      byr:1937 iyr:2017 cid:147 hgt:183cm

      iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
      hcl:#cfa07d byr:1929

      hcl:#ae17e1 iyr:2013
      eyr:2024
      ecl:brn pid:760753108 byr:1931
      hgt:179cm

      hcl:#cfa07d eyr:2025 pid:166559648
      iyr:2011 ecl:brn hgt:59in"
        |> parse(),
      problem_set: AOC.Helpers.get_problem_set(4, &parse/1)
    ]
  end

  test "get the number of valid passports in sample set", %{sample_set: sample_set} do
    assert AOC.DayFour.num_valid_passports(sample_set) == 2
  end

  test "get the number of valid passports in problem set", %{problem_set: problem_set} do
    IO.inspect(AOC.DayFour.num_valid_passports(problem_set))
  end
end
