defmodule StuffTest do
  use ExUnit.Case
  doctest Stuff

  test "greets the world" do
    assert Stuff.hello() == :world
  end
end
