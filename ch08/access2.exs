n = [
  %{
    character: "Buttercup",
    actor:     {"Robin", "Wright"},
    role:      "princess"
  },
  %{
    character: "Westley",
    actor:     {"Carly", "Elwes"},
    role:      "farm boy"
  }
]
IO.inspect(get_in(n, [Access.all(), :actor, Access.elem(1)]))
IO.inspect(get_and_update_in(n, [Access.all(), :actor, Access.elem(1)], &({&1, String.reverse(&1)})))
