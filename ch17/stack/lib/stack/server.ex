defmodule Stack.Server do
  use GenServer

  ###
  # API

  def start_link(initial_value) do
    GenServer.start_link(__MODULE__, initial_value, name: __MODULE__)
  end

  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def push(item) do
    GenServer.cast(__MODULE__, {:push, item})
  end

  ###
  # GenServer

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

  def terminate(reason, state) do
    IO.puts("Terminating: reason #{inspect reason} | state #{inspect state}")
  end
end
