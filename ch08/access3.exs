n = %{
  buttercup: %{
    actor:     {"Robin", "Wright"},
    role:      "princess"
  },
  westley: %{
    actor:     {"Carly", "Elwes"},
    role:      "farm boy"
  }
}
IO.inspect(get_in(n, [Access.key(:westley), :actor, Access.elem(1)]))
IO.inspect(get_and_update_in(n, [Access.key(:buttercup), :role], &({&1, "Queen"})))
