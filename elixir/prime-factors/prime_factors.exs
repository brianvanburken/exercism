defmodule PrimeFactors do
  @doc """
  Compute the prime factors for 'number'.

  The prime factors are prime numbers that when multiplied give the desired
  number.

  The prime factors of 'number' will be ordered lowest to highest.
  """
  @spec factors_for(pos_integer) :: [pos_integer]
  def factors_for(number, factor \\ 2, accumulator \\ [])
  def factors_for(1, _, acc), do: acc |> Enum.reverse
  def factors_for(number, factor, acc) when rem(number, factor) === 0 do
    factors_for(div(number, factor), factor, [ factor | acc ])
  end
  def factors_for(number, factor, acc), do: factors_for(number, factor + 1, acc)
end
