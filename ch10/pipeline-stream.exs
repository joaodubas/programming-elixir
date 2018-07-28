[0,1,2,3,4,5,6,7,8,9]
|> Stream.map(&(&1*&1))
|> Stream.with_index
|> Stream.map(fn ({v, i}) -> v - i end)
|> Enum.to_list
|> IO.inspect
