defmodule Example do
  def format_float(a) when is_float(a) do
    :io.format("~.2f~n", [a])
  end
  def get_env(n) when is_bitstring(n) do
    System.get_env(n)
  end
  def file_ext(f) when is_bitstring(f) do
    Path.extname(f)
  end
  def cwd(), do: System.cwd()
  def exec(cmd, option), do: System.cmd(cmd, [option])
end
