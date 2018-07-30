defmodule Operation do
  def parse([]), do: 0
  def parse(str), do: parse(str, 0, 0, :noop)

  defp parse([head|tail], infix, postfix, _) when head in '+-*/' do
    parse(tail, infix, postfix, List.to_atom([head]))
  end

  defp parse([head|tail], infix, postfix, :noop) when head in ?0..?9 do
    parse(tail, int(head, infix), postfix, :noop)
  end
  defp parse([head|tail], infix, postfix, op) when head in ?0..?9 do
    parse([], infix, parse(tail, int(head, postfix), 0, :noop), op)
  end

  defp parse([], infix, _, :noop) when infix > 0, do: infix
  defp parse([], _, postfix, :noop) when postfix > 0, do: postfix
  defp parse([], infix, postfix, op) do
    apply(Kernel, op, [infix, postfix])
  end

  defp int(digit, value), do: value * 10 + digit - ?0
end
