defmodule Spawn do
  def greet() do
    receive do
      {sender, msg} ->
        send(sender, {:ok, "Hello #{msg}"})
    end
  end
end

# here is the client
pid = spawn(Spawn, :greet, [])
send(pid, {self(), "joão"})
receive do
  {:ok, msg} ->
    IO.puts(msg)
end

# NOTE: this won't be processed, because :greet only process one message
send(pid, {self(), "paulo"})
receive do
  {:ok, msg} ->
    IO.puts(msg)
end
