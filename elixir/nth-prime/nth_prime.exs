defmodule Prime do

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(0), do: raise ArgumentError
  def nth(count) do
    Stream.iterate(2, &(&1 + 1))
    |> Stream.filter(&is_prime?/1)
    |> Enum.take(count)
    |> List.last
  end

  def is_prime?(1), do: false
  def is_prime?(2), do: true
  def is_prime?(n), do: Enum.all?(2..(n - 1), &(rem(n, &1) != 0))

end
