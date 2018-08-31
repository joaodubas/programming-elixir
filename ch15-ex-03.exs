defmodule Anthropometry do
  def bmi(pid, weight, height) do
    send(pid, {weight, height, weight / :math.pow(height / 100, 2)})
    :timer.sleep(250)
    exit(:finish)
  end

  def run() do
    res = spawn_link(Anthropometry, :bmi, [self(), 108, 168])
    IO.puts(inspect(res))
    :timer.sleep(500)
    receive do
      msg ->
        IO.puts(inspect(msg))
    end
  end
end

Anthropometry.run()
