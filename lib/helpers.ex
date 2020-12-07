defmodule AOC.Helpers do
  def get_problem_set(day) do
    path = Path.join(:code.priv_dir(:aoc), "#{day}.txt")

    case File.read(path) do
      {:ok, body} ->
        String.split(body, "\n")

      {:error, reason} ->
        reason
    end
  end
end
