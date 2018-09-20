defmodule Duper.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Duper.Results,
      {Duper.PathFinder, "."},
      Duper.WorkerSupervisor,
      {Duper.Gatherer, 1},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_all, name: Duper.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
