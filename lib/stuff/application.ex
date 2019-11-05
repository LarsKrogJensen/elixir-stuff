defmodule Stuff.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Stuff.Stack,
      Stuff.WorkerSupervisor,
      {Registry, [keys: :unique, name: :worker_registry]}
    ]
    opts = [strategy: :one_for_one, name: Stuff.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
