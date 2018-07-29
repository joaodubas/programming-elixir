defmodule Greeter do
  def for(name, greeting) do
    fn
      ^name -> "#{greeting} #{name}"
      _ -> "Quem tu é???"
    end
  end
end

mr = Greeter.for("João", "Olá")
IO.puts(mr.("João"))
IO.puts(mr.("Tatiana"))
