defmodule BMI do
  def value({weight, height}) do
    send(BMI.run, {weight, height})
    receive do
      bmi -> IO.puts("BMI: #{bmi}")
    end
  end

  def run(), do: spawn(BMI, :calc, [self()])

  def calc(receiver) do
    receive do
      {weight, height} ->
        send(receiver, weight / :math.pow(height/100, 2))
    end
  end
end
