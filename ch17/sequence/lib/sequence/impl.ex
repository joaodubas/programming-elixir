defmodule Sequence.Impl do
  def next(number), do: number + 1

  def increment(number, delta), do: number + delta

  def format_state(state), do: "My current state is '#{inspect state}', and I'm happy"
end
