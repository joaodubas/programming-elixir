defmodule StatsPropertyTest do
  use ExUnit.Case
  use ExUnitProperties

  describe "Stats on list of int" do
    property "count is not negative" do
      check all l <- list_of(integer()) do
        assert Stats.count(l) >= 0
      end
    end

    property "single element lists are their own sum" do
      check all number <- integer() do
        assert Stats.sum([number]) == number
      end
    end

    property "sum equals average times count (nonempty)" do
      check all l <- list_of(integer()) |> nonempty do
        assert_in_delta(
          Stats.sum(l),
          Stats.average(l) * Stats.count(l),
          1.0e-6
        )
      end
    end
  end
end
