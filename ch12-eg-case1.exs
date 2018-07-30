defmodule Users do
  joao = %{name: "João", state: "SP", likes: "volley"}

  case joao do
    %{state: some_state} = person ->
      IO.puts("#{person.name} lives in #{some_state}")
    _ ->
      IO.puts("No matches")
  end
end
