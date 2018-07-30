case File.open("ch12-eg-case.exs") do
  {:ok, file} -> IO.puts("First line: #{IO.read(file, :line)}")
  {:error, reason} -> IO.puts("Failed to open file: #{reason}")
end
