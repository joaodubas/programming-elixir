defmodule Stack.Server do
  def init(initial_value) do
    {:ok, initial_value}
  end

  def handle_call(:pop, _from, []) do
    {:reply, nil, []}
  end
  def handle_call(:pop, _from, [h|t]) do
    {:reply, h, t}
  end
end
