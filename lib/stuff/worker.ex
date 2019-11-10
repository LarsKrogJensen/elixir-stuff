defmodule Stuff.Worker do
  use GenServer
  require Logger

  # Client
  def start_link(name) do
    GenServer.start_link(__MODULE__, name, name: via_tuple(name))
  end

  def stop(name) do
    GenServer.stop(via_tuple(name))
  end

  def crash(name) do
    GenServer.cast(via_tuple(name), :crash)
  end

  def work(name) do
    GenServer.cast(via_tuple(name), :work)
  end

  # Server

  def child_spec(name) do
    # child_spec is called by worker supervisor automatically
    %{
      id: "Worker-#{name}",
      start: {__MODULE__, :start_link, [name]},
      restart: :transient
    }
  end

  def init(name) do
    Logger.info("Starting #{inspect name}")
    {:ok, name}
  end

  def handle_cast(:work, name) do
    Logger.info("Working at #{inspect name}")
    {:noreply, name}
  end

  def handle_cast(:crash, name) do
    Logger.info("Crashing worker #{inspect name}")
    raise(RuntimeError, message: "Worker crashed #{inspect name}")
  end

  def terminate(reason, name) do
    Logger.info("Terminated worker #{inspect name} with reason #{reason}")
  end

  # Private
  defp via_tuple(name) do
    {:via, Registry, {:worker_registry, name}}
  end
end
