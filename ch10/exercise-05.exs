defmodule Iter do
  def all?(_, fun \\ fn (x) -> x end)
  def all?([], _fun), do: true
  def all?([head|tail], fun), do: !!fun.(head) and all?(tail, fun)

  def each([], _fun), do: :ok
  def each([head|tail], fun) do
    fun.(head)
    each(tail, fun)
  end

  def filter([], _fun), do: []
  def filter([head|tail], fun) do
    if fun.(head) do
      [head|filter(tail, fun)]
    else
      filter(tail, fun)
    end
  end

  def split([], _n), do: {[],[]}
  def split(l, n) when n < 0, do: split(l, remain(l, n))
  def split(l, n), do: split(l, n, [])

  defp split(l, 0, rs), do: {rs, l}
  defp split([], _n, rs), do: split([], 0, rs)
  defp split([head|tail], n, rs), do: split(tail, n-1, rs ++ [head])

  def take([],  _n), do: []
  def take(l, n) when n < 0, do: drop(l, remain(l, n))
  def take(l, n), do: take(l, n, [])

  defp take(_l, 0, rs), do: rs
  defp take([], _n, rs), do: take([], 0, rs)
  defp take([head|tail], n, rs), do: take(tail, n-1, rs++[head])

  defp drop(l, 0), do: l
  defp drop([], _n), do: []
  defp drop(l, n) when n < 0, do: take(l, remain(l, n))
  defp drop([_head|tail], n), do: drop(tail, n-1)

  defp remain(l, n) when n < 0, do: max(0, count(l)+n)

  defp count([]), do: 0
  defp count([_head|tail]), do: 1 + count(tail)
end
