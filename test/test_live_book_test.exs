defmodule TestLiveBookTest do
  use ExUnit.Case
  doctest TestLiveBook

  test "greets the world" do
    assert TestLiveBook.hello() == :world
  end
end
