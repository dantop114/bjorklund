defmodule BjorklundTest do
  use ExUnit.Case
  doctest Bjorklund

  test "greets the world" do
    assert Bjorklund.hello() == :world
  end
end
