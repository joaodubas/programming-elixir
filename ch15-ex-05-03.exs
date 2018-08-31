defmodule Anthropometry do
  def bmi(pid, weight, height) do
    send(pid, {weight, height, weight / :math.pow(height / 100, 2)})
    exit(:finish)
  end

  def run() do
    res = spawn_monitor(Anthropometry, :bmi, [self(), 108, 168])
    IO.puts(inspect(res))
    :timer.sleep(500)
    receive do
      msg ->
        IO.puts(inspect(msg))
    end
    receive do
      msg ->
        IO.puts(inspect(msg))
    after
      1000 -> IO.puts("Nothing was received")
    end
  end
end

Anthropometry.run()
