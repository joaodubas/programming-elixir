defmodule Words do
  def anagram?(word1, word2) when length(word1) != length(word2), do: false
  def anagram?(word1, word2), do: Enum.all?(word1, &(&1 in word2))
end
