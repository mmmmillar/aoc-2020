defmodule AOC.DayThreeTest do
  use ExUnit.Case

  setup_all do
    [
      sample_set: %{
        map:
          "..##.........##.........##.........##.........##.........##.......
        #...#...#..#...#...#..#...#...#..#...#...#..#...#...#..#...#...#..
        .#....#..#..#....#..#..#....#..#..#....#..#..#....#..#..#....#..#.
        ..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#
        .#...##..#..#...##..#..#...##..#..#...##..#..#...##..#..#...##..#.
        ..#.##.......#.##.......#.##.......#.##.......#.##.......#.##.....
        .#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#
        .#........#.#........#.#........#.#........#.#........#.#........#
        #.##...#...#.##...#...#.##...#...#.##...#...#.##...#...#.##...#...
        #...##....##...##....##...##....##...##....##...##....##...##....#
        .#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#"
          |> String.split("\n")
          |> Enum.map(&String.trim/1),
        slopes: [%{x: 1, y: 1}, %{x: 3, y: 1}, %{x: 5, y: 1}, %{x: 7, y: 1}, %{x: 1, y: 2}]
      },
      problem_set: %{
        map: AOC.Helpers.get_problem_set(3),
        slopes: [%{x: 1, y: 1}, %{x: 3, y: 1}, %{x: 5, y: 1}, %{x: 7, y: 1}, %{x: 1, y: 2}]
      }
    ]
  end

  test "gets the number of trees in the sample set", %{sample_set: sample_set} do
    assert AOC.DayThree.num_trees(sample_set.map, %{x: 3, y: 1}) == 7
  end

  test "gets the product of the number of trees at different slopes in the sample set", %{
    sample_set: sample_set
  } do
    assert AOC.DayThree.num_trees_product(sample_set.map, sample_set.slopes) == 336
  end

  # test "gets the number of trees in the problem set", %{problem_set: problem_set} do
  #   IO.puts(AOC.DayThree.num_trees(problem_set.map, %{x: 3, y: 1}))
  # end

  # test "gets the product of the number of trees at different slopes in the problem set", %{
  #   problem_set: problem_set
  # } do
  #   IO.puts(AOC.DayThree.num_trees_product(problem_set.map, problem_set.slopes))
  # end
end
