defmodule TailRecursive do
  def factorial(n), do: fact(n, 1)

  # NOTE: to use tail-call optimization, the last call must be to self,
  # without any other operation
  defp fact(0, acc), do: acc
  defp fact(n, acc), do: fact(n-1, acc*n)
end
