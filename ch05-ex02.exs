fb = fn
  0, 0, _ -> IO.puts("FizzBuzz")
  0, _, _ -> IO.puts("Fizz")
  _, 0, _ -> IO.puts("Buzz")
  _, _, n -> IO.puts(n)
end

fizzbuzz = fn n -> fb.(rem(n, 3), rem(n, 5), n) end

fizzbuzz.(10)
fizzbuzz.(11)
fizzbuzz.(12)
fizzbuzz.(13)
fizzbuzz.(14)
fizzbuzz.(15)
fizzbuzz.(16)
