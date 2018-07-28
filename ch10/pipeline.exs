[0,1,2,3,4,5,6,7,8,9]
|> Enum.map(&(&1*&1))
|> Enum.with_index
|> Enum.map(fn ({v, i}) -> v - i end)
|> IO.inspect
