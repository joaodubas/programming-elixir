defmodule Times do
  def double(n) do
    n * 2
  end
  def quad(n) do
    double(double(n))
  end
  def square(n), do: n * n
end
