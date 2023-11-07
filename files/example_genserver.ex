defmodule ExampleGenserver do
  use GenServer

  def start_link(arg) do
    GenServer.start_link(__MODULE__, arg, name: :example_gen_server)
  end

  # Called by GenServer when starting a new server.
  def init(_arg) do
    IO.puts("gen_server start")
    {:ok, %{}}
  end

  # The function handle_call/3 is used to work with synchronous messages.
  # It takes 3 arguments: Request, From, and State.
  def handle_call({:get, key}, _from, state) do
    {:reply, Map.get(state, key), state}
  end

  def handle_call(:get_state, _from, state) do
    {:reply, state, state}
  end

  # The handle_cast/2 callback, it takes the parameters Message and State and
  # is used to handle asynchronous calls.
  def handle_cast({:put, key, value}, state) do
    {:noreply, Map.put(state, key, value)}
  end

  # import Supervisor
  # # child specifications
  # children = [
  #   %{
  #     id: ExampleGenserver,
  #     start: {ExampleGenserver, :start_link, [[]]}
  #   }
  # ]

  # {:ok, pid} = Supervisor.start_link(children, strategy: :one_for_one)
  # GenServer.call(:example_gen_server, {:get, :a})
  # GenServer.cast(:example_gen_server, {:put, :a, 10})
  # GenServer.cast(:example_gen_server, {:put, :b, "Elixir"})
  # GenServer.call(:example_gen_server, {:get, :a})
  # GenServer.call(:example_gen_server, {:get, :b})
  # GenServer.call(:example_gen_server, :get_state)

  # pid = Process.whereis(:example_gen_server)
  # Process.exit(pid, :kill)

end
