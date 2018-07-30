joao = %{name: "João", age: 39}
case joao do
  person = %{age: age} when is_number(age) and age >= 21 ->
    IO.puts("You're cleared to enter Foo Bar, #{person.name}")
  _ -> IO.puts("Sorry, no admission")
end
