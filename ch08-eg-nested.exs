defmodule Customer do
  defstruct name: "", company: ""
end
defmodule BugReport do
  defstruct customer: %Customer{}, description: "", severity: 1
end
