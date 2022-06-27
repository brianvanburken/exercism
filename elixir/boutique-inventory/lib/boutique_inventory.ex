defmodule BoutiqueInventory do
  def sort_by_price(inventory),
    do: Enum.sort_by(inventory, &1.price)

  def with_missing_price(inventory),
    do: Enum.filter(inventory, &(&1.price == nil))

  def update_names(inventory, old_word, new_word),
    do: Enum.map(inventory, &update_name(&1, old_word, new_word))

  defp update_name(item, old_word, new_word),
    do: Map.update(item, :name, nil, &String.replace(&1, old_word, new_word))

  def increase_quantity(item, count),
    do: Map.update!(item, :quantity_by_size, &Map.new(&1, fn {k, v} -> {k, v + count} end))

  def total_quantity(%{quantity_by_size: quantity_by_size}),
    do: Enum.reduce(quantity_by_size, 0, &(elem(&1, 1) + &2))
end
