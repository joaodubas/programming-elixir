IO.puts(File.read("/usr/share/dict/words"))
|> IO.stream(:line)
|> Enum.max_by(&String.length/1)
