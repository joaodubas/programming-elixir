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

  def handle_cast({:push, item}, current_value) do
    {:noreply, [item|current_value]}
  end
end
