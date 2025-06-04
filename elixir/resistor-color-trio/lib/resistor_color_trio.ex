defmodule ResistorColorTrio do
  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label([c1, c2, c3]), do: to_unit(c1, c2, c3)
  def label([c1, c2, c3, _]), do: to_unit(c1, c2, c3)
  def label(_), do: raise("need exactly three colors")

  defp to_unit(c1, c2, c3) do
    zeroes = resistance(c3)
    base = resistance(c1) * 10 + resistance(c2)

    (base * Integer.pow(10, zeroes))
    |> reduce_to_prefix()
  end

  @resistors [
    {:black, 0},
    {:brown, 1},
    {:red, 2},
    {:orange, 3},
    {:yellow, 4},
    {:green, 5},
    {:blue, 6},
    {:violet, 7},
    {:grey, 8},
    {:white, 9}
  ]

  for {color, value} <- @resistors do
    defp resistance(unquote(color)), do: unquote(value)
  end

  defp resistance(_), do: raise("unkown color")

  @metric_prefix [
    {:gigaohms, 1_000_000_000},
    {:megaohms, 1_000_000},
    {:kiloohms, 1000}
  ]

  for {unit, mult} <- @metric_prefix do
    defp reduce_to_prefix(v) when v >= unquote(mult),
      do: {v / unquote(mult), unquote(unit)}
  end

  defp reduce_to_prefix(v), do: {v, :ohms}
end
