defmodule ASCII do
  def all?(str), do: Enum.all? str, &(&1 in ?\s..?~)
end
