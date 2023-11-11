defmodule ExampleConcurrent do

  # Simple function run in one process

  def main do
    func_a()
    func_b()
  end

  def func_a do
    :timer.sleep(5000)
    IO.puts "doing function a"
  end

  def func_b do
    IO.puts "doing function b"
  end

  # Function run in a separate process with spawn function.
  # When we call spawn, it creates a new process to run the code we specify.

  def main_1 do
    spawn(fn -> func_a_1() end)
    func_b()
  end

  def func_a_1 do
    :timer.sleep(5000)
    IO.puts "doing function a"
  end

  def func_b_1 do
    IO.puts "doing function b"
  end

  # Message Passing
  # send(dest, message): Sends a message to the given dest and returns the message.
  # To listen we use receive to match messages.

  # Server
  def loop do
    # The function uses receive to wait for a message,
    # and then matches the message in the block.
    receive do
      # In this case, the only pattern is a two-element tuple,
      # where the first element is the original sender’s PID and the second
      # is the message
      {sender, msg} ->
        send(sender, { :ok, "Hello, #{msg}" })
        # Handle multiple messages by making it loop.
        # Without recursion our process would exit after handling the first message.
        loop()
    end
  end

  # Client
  # here's a client run on iex shell
  # pid = spawn(ExampleConcurrent, :loop, [])
  # send(pid, {self(), "World!"})
  # receive do
  #    {:ok, message} -> IO.puts message
  # end

end
