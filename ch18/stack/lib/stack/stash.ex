defmodule Stack.Stash do
  use GenServer

  @me __MODULE__

  ###
  # Public API

  def start_link(initial_value) do
    GenServer.start_link(__MODULE__, initial_value, name: @me)
  end

  def get do
    GenServer.call(@me, {:get})
  end

  def update(new_value) do
    GenServer.cast(@me, {:update, new_value})
  end

  ###
  # GenServer impl

  def init(initial_value) do
    {:ok, initial_value}
  end

  def handle_call({:get}, _from, current_value) do
    {:reply, current_value, current_value}
  end

  def handle_cast({:update, new_value}, _current_value) do
    {:noreply, new_value}
  end
end
