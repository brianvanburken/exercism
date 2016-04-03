defmodule Grains do
  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer) :: pos_integer
  def square(n), do: do_square(2, n - 1)

  defp do_square(_, 0),        do: 1
  defp do_square(n, 1),        do: n
  defp do_square(n, exponent), do: n * do_square(n, exponent-1)

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: pos_integer
  def total do
    1..64 |> Enum.reduce(0, &(&2 + square(&1)))
  end
end
