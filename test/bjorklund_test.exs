defmodule BjorklundTest do
  use ExUnit.Case
  doctest Bjorklund

  test "computes the right sequence" do
    assert Bjorklund.bjorklund(13, 5) == [0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0]
  end

  test "fails for k > n / 2" do
    assert Bjorklund.bjorklund(13, 7) == :error
  end

  test "P(Bjorklund(13, 5), -1) is evenly distributed" do
    assert Bjorklund.is_evenly_distributed([1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0]) == true
  end

  test "not evenly distributed sequence" do
    assert Bjorklund.is_evenly_distributed([0, 1, 1, 0, 1, 0]) == false
  end
end
