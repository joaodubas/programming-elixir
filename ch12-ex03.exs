defmodule Raiser do
  def ok!({:ok, data}), do: data
  def ok!({_, reason}), do: raise "Something went wrong #{reason}"
end
