defmodule AOC.DayOne do
  defp find_match(numbers, n, target) when n >= 2 do
    [first_term | tail] = numbers
    remainder = target - first_term

    case n do
      2 ->
        cond do
          remainder in tail ->
            first_term * remainder

          length(tail) > 1 ->
            find_match(tail, n, target)

          length(tail) <= 1 ->
            nil
        end

      _ ->
        case find_match(tail, n - 1, remainder) do
          p when p != nil ->
            first_term * p

          _ ->
            nil
        end
    end
  end

  def get_product(numbers, n, target) when length(numbers) > 1 do
    case find_match(numbers, n, target) do
      product when product != nil ->
        product

      _ ->
        [_head | tail] = numbers

        if length(tail) > 1 do
          get_product(tail, n, target)
        end
    end
  end
end
