n = %{
  buttercup: %{
    actor: %{
      first: "Robin",
      last:  "Wright"
    },
    role: "princess"
  },
  westley: %{
    actor: %{
      first: "Carly",
      last:  "Elwes"  # typo!
    },
    role: "farm boy"
  }
}
IO.inspect(get_in(n, [:buttercup]))
IO.inspect(get_in(n, [:buttercup, :actor]))
IO.inspect(get_in(n, [:buttercup, :actor, :first]))
IO.inspect(put_in(n, [:westley, :actor, :last], "Elwes"))
