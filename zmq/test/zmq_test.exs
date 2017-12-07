defmodule ZmqTest do
  use ExUnit.Case
  doctest Zmq

  test "greets the world" do
    assert Zmq.hello() == :world
  end
end
