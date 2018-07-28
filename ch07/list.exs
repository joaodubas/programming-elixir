defmodule MyList do
  def len([]), do: 0
  def len([_head|tail]), do: 1 + len(tail)
  def square([]), do: []
  def square([head|tail]), do: [head*head|square(tail)]
  def add_1([]), do: []
  def add_1([head|tail]), do: [head+1|add_1(tail)]
  def map([], _func), do: []
  def map([head|tail], func), do: [func.(head)|map(tail, func)]
  def reduce([], value, _func), do: value
  def reduce([head|tail], value, func) do
    reduce(tail, func.(head, value), func)
  end
  def mapsum([], _func), do: 0
  def mapsum([head|tail], func) do
    reduce(map([head|tail], func), 0, &(&1 + &2))
  end
  def max([]), do: nil
  def max([head|tail]), do: reduce([head|tail], 0, &(max(&1, &2)))
  # TODO (jpd): add exercise 3
  def caeser([], _), do: []
  def caeser([head|tail], n) when head+n > ?z do
    [?` + (head+n-?z) | caeser(tail, n)] # tick mark comes before a in ascii table
  end
  def caeser([head|tail], n), do: [head+n | caeser(tail, n)]
  def span(from, to) when from > to do
    []
  end
  def span(from, to), do: [from | span(from + 1, to)]
end
