defmodule Sequence.Server do
  use GenServer

  def init(initial_value) do
    {:ok, initial_value}
  end

  def handle_call(:next_number, _from, current_value) do
    {:reply, current_value, current_value+1}
  end

  def handle_call({:set_number, new_value}, _from, _current_value) do
    {:reply, new_value, new_value}
  end

  def handle_cast({:increment_number, delta}, current_value) do
    {:noreply, current_value + delta}
  end
end
