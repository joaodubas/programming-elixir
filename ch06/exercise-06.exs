defmodule Guess do
  def guess(to_guess, lower..upper) when lower <= to_guess and to_guess <= upper do
    guessed(guesser(lower, upper), to_guess, lower, upper)
  end
  defp guessed(educated, to_guess, _, _) when educated == to_guess do
    educated
  end
  defp guessed(educated, to_guess, lower, _) when educated > to_guess do
    educated = educated-1
    guessed(guesser(lower, educated), to_guess, lower, educated)
  end
  defp guessed(educated, to_guess, _, upper) when educated < to_guess do
    educated = educated+1
    guessed(guesser(educated, upper), to_guess, educated, upper)
  end
  defp guesser(lower, upper) do
    to_guess = div(upper + lower, 2)
    IO.puts("it is #{to_guess}")
    to_guess 
  end
end
