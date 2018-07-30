defmodule Flattener do
  def flatten([]), do: []
  def flatten([head|tail]) when is_list(head), do: flatten(head) ++ flatten(tail)
  def flatten([head|tail]), do: [head|flatten(tail)]

  defmodule Inner do
    def flatten(l), do: flatten(l, [])

    defp flatten([], flat), do: flat
    defp flatten([head|tail], flat) when is_list(head), do: flatten(head, flatten(tail, flat))
    defp flatten([head|tail], flat), do: [head|flatten(tail, flat)]
  end
end
