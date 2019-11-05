defmodule Stuff.Stack do
  use GenServer

  # server
  @impl true
  def init(stack) do
    IO.puts "Starting stack" <> inspect stack
    schedule_work()
    {:ok, stack}
  end

  @impl true
  def handle_call(:pop, _from, [h | t]) do
    IO.puts("popping")
    {:reply, h, t}
  end

  @impl true
  def handle_cast({:push, element}, state) do
    {:noreply, [element | state]}
  end

  @impl true
  def handle_info(:work, state) do
    schedule_work()
#    IO.puts("handling work")
    {:noreply, state}
  end

  @impl true
  def terminate(reason, state) do
    IO.puts("Stopped #{inspect reason} - #{inspect state}")
  end

  defp schedule_work do
    Process.send_after(self(), :work, 2000)
  end

  # client
  def start_link(initial \\ []) do
    GenServer.start_link(__MODULE__, initial, name: MyStack)
  end

  def push(element) do
    GenServer.cast(MyStack, {:push, element})
  end

  def pop() do
    GenServer.call(MyStack, :pop)
  end
end
