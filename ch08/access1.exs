n = [
  %{
    character: "Buttercup",
    actor: %{
      first: "Robin",
      last:  "Wright"
    },
    role: "princess"
  },
  %{
    character: "Westley",
    actor: %{
      first: "Carly",
      last:  "Elwes"
    },
    role: "farm boy"
  }
]
IO.inspect(get_in(n, [Access.all(), :character]))
IO.inspect(get_in(n, [Access.at(1), :actor, :last]))
IO.inspect(get_and_update_in(n, [Access.all(), :actor, :last], &({&1, String.upcase(&1)})))
