defmodule Tax do
  def calc(orders, taxes) do
    for order <- orders, do: Enum.into([total_amount: total(order, taxes)], order)
  end
  defp total(order, taxes), do: Keyword.get(order, :net_amount) * tax(order, taxes)
  defp tax(order, taxes), do: Keyword.get(taxes, Keyword.get(order, :ship_to), 0.0) + 1.0
end

"""
tax_rates = [NC: 0.075, TX:  0.08]
orders = [
  [id: 123, ship_to: :NC, net_amount: 100.00],
  [id: 124, ship_to: :OK, net_amount: 35.50],
  [id: 125, ship_to: :TX, net_amount: 24.00],
  [id: 126, ship_to: :TX, net_amount: 44.80],
  [id: 127, ship_to: :NC, net_amount: 25.00],
  [id: 128, ship_to: :MA, net_amount: 10.00],
  [id: 129, ship_to: :CA, net_amount: 102.00],
  [id: 130, ship_to: :NC, net_amount: 50.00],
]
IO.inspect(Tax.calc(orders, tax_rates))
"""
