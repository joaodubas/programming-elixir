defmodule Stringer do
  def capitalize_sentences(sentence, separator \\ ". "), do: String.split(sentence, separator) |> Enum.map(&String.capitalize/1) |> Enum.join(separator)
end
