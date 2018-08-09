defmodule StatsTest do
  use ExUnit.Case
  doctest Stats

  test "calculate sum" do
    l = [1, 3, 5, 7, 9]
    assert Stats.sum(l) == 25
  end

  test "calculate count" do
    l = [1, 3, 5, 7, 9]
    assert Stats.count(l) == 5
  end

  test "calculate average" do
    l = [1, 3, 5, 7, 9]
    assert Stats.average(l) == 5
  end
end
