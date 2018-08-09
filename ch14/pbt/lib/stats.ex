defmodule Stats do
  @moduledoc """
  Descriptive statistics in a nutshell.
  """

  @doc """
  Sum the values in a list of numbers.

  ## Examples

      iex> Stats.sum([0, 1, 2, 3])
      6

  """
  def sum(vals), do: vals |> Enum.reduce(0, &+/2)

  @doc """
  Count the values in a list of numbers.

  ## Examples

      iex> Stats.count([0, 1, 2, 3])
      4

  """
  def count(vals), do: vals |> length

  @doc """
  Average value in a list of numbers.

  ## Examples

      iex> Stats.average([0, 1, 2, 3])
      1.5

  """
  def average(vals), do: sum(vals) / count(vals)
end
