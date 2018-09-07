defmodule Stack.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {Stack.Stash, [1, 2, 3]},
      {Stack.Server, nil},
    ]

    opts = [strategy: :rest_for_one, name: Stack.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
