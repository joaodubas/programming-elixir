defmodule FizzBuzz do
  def upto(n) when n > 0, do: 1..n |> Enum.map(&fizzbuzz/1)

  defp fizzbuzz(n), do: fizzbuzz(n, rem(n, 3), rem(n, 5))

  defp fizzbuzz(_, 0, 0), do: "FizzBuzz"
  defp fizzbuzz(_, 0, _), do: "Fizz"
  defp fizzbuzz(_, _, 0), do: "Buzz"
  defp fizzbuzz(n, _, _), do: n
end
