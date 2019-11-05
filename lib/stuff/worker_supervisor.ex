defmodule Stuff.WorkerSupervisor do
  use DynamicSupervisor
  alias Stuff.Worker

  def start_link(_args) do
    DynamicSupervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_args) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  def start_child(name) do
    DynamicSupervisor.start_child(__MODULE__, {Worker, name})
  end

end
