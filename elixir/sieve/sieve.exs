defmodule Sieve do

  @doc """
  Generates a list of primes up to a given limit.
  """
  @spec primes_to(non_neg_integer) :: [non_neg_integer]
  def primes_to(limit) when limit > 1,
    do: 2..limit |> Enum.to_list |> sieve

  defp sieve([]), do: []
  defp sieve([ head | tail ]),
    do: [head | tail |> Enum.reject(&rem(&1, head) == 0) |> sieve]
end
