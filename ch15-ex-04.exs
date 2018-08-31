defmodule Anthropometry do
  def bmi!(_, weight, height) when not is_integer(weight) or not is_integer(height) do
    raise "BMI can't be calculated with #{weight} and #{height}"
  end

  def run() do
    spawn_link(Anthropometry, :bmi!, [self(), "100", "168"])
    receive do
      msg ->
        IO.puts(inspect(msg))
    end
  end
end

Anthropometry.run
