defmodule Prime do
  def span(from, to) do
    for n <- from..to, prime?(n), do: n
  end
  def prime?(n) when n == 0, do: false
  def prime?(n) when n <= 3, do: true
  def prime?(n) when rem(n, 2) == 0 or rem(n, 3) == 0, do: false
  def prime?(n), do: prime?(n, 5)
  defp prime?(n, i) when i * i > n, do: true
  defp prime?(n, i) when rem(n, i) == 0 or rem(n, i+2) == 0, do: false
  defp prime?(n, i), do: prime?(n, i+6)
end
