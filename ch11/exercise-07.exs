defmodule Orders do
  def parse(filename) do
    File.stream!(filename)
    |> Stream.drop(1)
    |> Stream.map(&line/1)
    |> Enum.to_list
  end

  defp line(l) do
    [id, city, amount] = String.trim(l) |> String.split(",")
    [id: to_id(id), ship_to: to_city(city), net_amount: to_amount(amount)]
  end

  defp to_id(id), do: String.to_integer(id)
  defp to_city(city), do: String.trim_leading(city, ":") |> String.to_atom
  defp to_amount(amount), do: String.to_float(amount)
end
