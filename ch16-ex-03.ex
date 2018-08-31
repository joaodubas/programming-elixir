defmodule Ticker do
  @interval 2000 # 2 seconds
  @name :ticker

  def start do
    pid = spawn(__MODULE__, :generator, [{[], []}])
    :global.register_name(@name, pid)
  end

  def register(client_pid) do
    IO.puts("registering #{inspect(client_pid)}")
    send(:global.whereis_name(@name), {:register, client_pid})
  end

  def generator({clients, notifies}) do
    receive do
      {:register, pid} ->
        generator({[pid|clients], [pid|notifies]})
    after
      @interval ->
        tick(clients, notifies)
        |> generator
    end
  end

  defp tick([], []) do
    {[], []}
  end
  defp tick([notify|tail], []) do
    sender(notify)
    {[notify|tail], tail}
  end 
  defp tick(clients, [notify|tail]) do
    sender(notify)
    {clients, tail}
  end

  defp sender(client) do
    send(client, {"tick #{Time.utc_now}"})
  end
end

defmodule Client do
  def start do
    pid = spawn(__MODULE__, :receiver, [])
    Ticker.register(pid)
  end

  def receiver do
    receive do
      {msg} ->
        IO.puts(msg)
        receiver()
    end
  end
end
