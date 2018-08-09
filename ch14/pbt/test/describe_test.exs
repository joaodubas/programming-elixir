defmodule StatsTest do
  use ExUnit.Case
  doctest Stats

  describe "Stats on list of ints" do
    setup do
      [
        list:  [1, 3, 5, 7, 9],
        sum:   25,
        count: 5
      ]
    end

    test "calculate sum", fixture do
      assert Stats.sum(fixture.list) == fixture.sum
    end

    test "calculate count", fixture do
      assert Stats.count(fixture.list) == fixture.count
    end

    test "calculate average", fixture do
      assert Stats.average(fixture.list) == fixture.sum/fixture.count
    end
  end
end
