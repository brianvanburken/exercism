defmodule Allergies do
  @allergens [
    { "cats", 128 }, { "pollen", 64 }, { "chocolate", 32 }, { "tomatoes", 16 },
    { "strawberries", 8 }, { "shellfish", 4 }, { "peanuts", 2 }, { "eggs", 1}
  ]

  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t]
  def list(n, acc \\ [])
  def list(0, acc), do: acc
  for { allergy, score } <- @allergens do
    def list(n, acc) when rem(n, unquote(score)) === 0 do
      list(n - unquote(score), [ unquote(allergy) | acc ])
    end
  end

  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t) :: boolean
  def allergic_to?(flags, allergy) do
    flags |> list |> Enum.any?(&(&1 === allergy))
  end
end
