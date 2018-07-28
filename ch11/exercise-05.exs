defmodule Stringer do
  def center([]), do: IO.puts("")
  def center(strings), do: Enum.map_join(strings, "\n", &(center(&1, max(strings)))) |> IO.puts

  defp center(string, len), do: String.pad_leading(string, pad(String.length(string), len))

  defp max(strings), do: Enum.max_by(strings, &String.length/1) |> String.length

  defp pad(string_len, max_len), do: string_len + div(max_len-string_len, 2)
end
