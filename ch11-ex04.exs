defmodule Operation do
  def parse([]), do: 0
  def parse(str), do: parse(str, 0, 0, :noop)

  defp parse([head|tail], infix, postfix, _) when head in '+-*/' do
    op = case head do
      ?+ -> :sum
      ?- -> :sub
      ?* -> :mul
      ?/ -> :div
    end
    parse(tail, infix, postfix, op)
  end
  defp parse([head|tail], infix, postfix, op) when head in '0123456789' do
    if op == :noop do
      parse(tail, int(head, infix), postfix, op)
    else
      parse([], infix, parse(tail, int(head, postfix), 0, :noop), op)
    end
  end
  defp parse([], infix, postfix, op) do
    case op do
      :noop -> if infix > 0, do: infix, else: postfix
      :sum -> infix + postfix
      :sub -> infix - postfix
      :mul -> infix * postfix
      :div -> infix / postfix
    end
  end

  defp int(digit, value), do: value * 10 + digit - ?0
end
