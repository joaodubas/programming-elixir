authors = [
  %{ name: "João",  language: "Perl" },
  %{ name: "Paulo", language: "Ruby" },
  %{ name: "Dubas", language: "Elixir" },
]

languages_with_r = fn (:get, collection, next_fn) ->
  for row <- collection do
    if String.contains?(row.language, "r") do
      next_fn.(row)
    end
  end
end

IO.inspect(get_in(authors, [languages_with_r, :name]))
