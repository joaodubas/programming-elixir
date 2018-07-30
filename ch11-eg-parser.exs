defmodule Parse do
  def number([?-|tail]), do: number_digits(tail, 0) * -1
  def number([?+|tail]), do: number_digits(tail, 0)
  def number(str), do: number_digits(str, 0)

  defp number_digits([], v), do: v
  defp number_digits([digit|tail], v) when digit in '0123456789' do
    number_digits(tail, v * 10 + digit - ?0)
  end
  defp number_digits([non_digit|_], _), do: raise "Invalid digit '#{[non_digit]}'"
end
