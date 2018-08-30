defmodule Spawn do
  def greet() do
    receive do
      {sender, msg} ->
        send(sender, {:ok, "Hello #{msg}"})
        # NOTE: recursive call to process another message
        greet()
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

# NOTE: add pseudo pattern `after`, to avoid for a service that isn't available
send(pid, {self(), "paulo"})
receive do
  {:ok, msg} ->
    IO.puts(msg)
  after 500 ->
    IO.puts("Greeter has gone away")
end
