defmodule SpawnBasic do
  def greet() do
    IO.puts("Hello world!")
  end
end

# to use it run
# iex> c "ch15-eg-spawn-basic.ex"
# iex> spawn(SpawnBasic, :greet, [])
