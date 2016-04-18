defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    multiples(limit, factors) |> Enum.sum
  end

  def multiples(limit, factors) do
    for x <- 1..limit-1,
        Enum.any?(factors, fn(n) -> rem(x, n) == 0 end),
        do: x
  end
end
