defmodule ElxrTest do
  use ExUnit.Case
  doctest Elxr

  test "greets the world" do
    assert Elxr.hello() == :world
  end
end
