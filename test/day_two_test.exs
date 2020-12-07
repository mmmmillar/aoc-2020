defmodule AOC.DayTwoTest do
  use ExUnit.Case

  setup_all do
    [
      sample_set: ["1-3 a: abcde", "1-3 b: cdefg", "2-9 c: ccccccccc"],
      problem_set: AOC.Helpers.get_problem_set(2)
    ]
  end

  test "gets the number of valid passwords in sample set with first validator", %{
    sample_set: sample_set
  } do
    assert AOC.DayTwo.num_valid_passwords(sample_set, &AOC.DayTwo.is_valid_1/1) == 2
  end

  test "gets the number of valid passwords in sample set with second validator", %{
    sample_set: sample_set
  } do
    assert AOC.DayTwo.num_valid_passwords(sample_set, &AOC.DayTwo.is_valid_2/1) == 1
  end

  # test "gets the number of valid passwords in the problem set with the first validator", %{
  #   problem_set: problem_set
  # } do
  #   IO.puts(AOC.DayTwo.num_valid_passwords(problem_set, &AOC.DayTwo.is_valid_1/1))
  # end

  # test "gets the number of valid passwords in the problem set with the second validator", %{
  #   problem_set: problem_set
  # } do
  #   IO.puts(AOC.DayTwo.num_valid_passwords(problem_set, &AOC.DayTwo.is_valid_2/1))
  # end
end
