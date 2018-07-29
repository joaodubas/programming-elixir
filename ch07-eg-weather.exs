defmodule WeatherHistory do
  def for_location([], _target_loc), do: []
  def for_location([head=[_, target_loc, _, _] | tail], target_loc), do: [head | for_location(tail, target_loc)]
  def for_location([_|tail], target_loc), do: for_location(tail, target_loc)
  def for_location_27(l), do: for_location(l, 27)
  def test_data() do
    [
      [1366225622, 26, 15, 0.152],
      [1366225622, 27, 15, 0.450],
      [1366225622, 28, 21, 0.250],
      [1366225622, 26, 19, 0.081],
      [1366225622, 27, 17, 0.468],
      [1366225622, 28, 15, 0.600],
      [1366225622, 26, 22, 0.025],
      [1366225622, 27, 21, 0.095],
      [1366225622, 28, 24, 0.050],
      [1366225622, 26, 17, 0.030],
    ]
  end
end
