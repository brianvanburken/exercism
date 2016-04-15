defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string, acc \\ 0)
  def to_decimal("0" <> tail, acc), do: to_decimal(tail, acc)
  def to_decimal("1" <> tail, acc), do: to_decimal(tail, acc + :math.pow(2, String.length(tail)) |> round)
  def to_decimal("", acc), do: acc
  def to_decimal(_, _), do: 0
end
