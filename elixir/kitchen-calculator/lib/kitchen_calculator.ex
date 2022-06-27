defmodule KitchenCalculator do
  def get_volume({_, volume}), do: volume

  def to_milliliter({:milliliter, _} = pair), do: pair
  def to_milliliter({unit, volume}), do: {:milliliter, unit_in_milimeters(unit) * volume}

  def from_milliliter({:milliliter, _} = pair, :milliliter), do: pair
  def from_milliliter({_, volume}, unit), do: {unit, volume / unit_in_milimeters(unit)}

  def convert(volume_pair, unit) do
    volume_pair
    |> to_milliliter()
    |> from_milliliter(unit)
  end

  defp unit_in_milimeters(:milliliter), do: 1
  defp unit_in_milimeters(:cup), do: 240
  defp unit_in_milimeters(:fluid_ounce), do: 30
  defp unit_in_milimeters(:teaspoon), do: 5
  defp unit_in_milimeters(:tablespoon), do: 15
end
