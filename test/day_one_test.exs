defmodule AOC.DayOneTest do
  use ExUnit.Case

  setup_all do
    [
      sample_set: [1721, 979, 366, 299, 675, 1456],
      problem_set: AOC.Helpers.get_problem_set(1) |> Enum.map(fn x -> String.to_integer(x) end)
    ]
  end

  test "gets the product from the sample set where n=2", %{sample_set: sample_set} do
    assert AOC.DayOne.get_product(sample_set, 2, 2020) == 514_579
  end

  test "gets the product from the sample set reversed where n=2", %{sample_set: sample_set} do
    assert AOC.DayOne.get_product(Enum.reverse(sample_set), 2, 2020) == 514_579
  end

  test "gets the product from the sample set where n=3", %{sample_set: sample_set} do
    assert AOC.DayOne.get_product(sample_set, 3, 2020) == 241_861_950
  end

  test "gets the product from the sample set reversed where n=3", %{sample_set: sample_set} do
    assert AOC.DayOne.get_product(Enum.reverse(sample_set), 3, 2020) == 241_861_950
  end

  # test "gets the product from the problem set where n=2", %{problem_set: problem_set} do
  #   IO.puts(
  #     AOC.DayOne.get_product(
  #       problem_set,
  #       2,
  #       2020
  #     )
  #   )
  # end

  # test "get the answer where n=3", %{problem_set: problem_set} do
  #   IO.puts(
  #     AOC.DayOne.get_product(
  #       problem_set,
  #       3,
  #       2020
  #     )
  #   )
  # end
end
