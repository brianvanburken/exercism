defmodule Hexadecimal do

  @doc """
    Accept a string representing a hexadecimal value and returns the
    corresponding decimal value.
    It returns the integer 0 if the hexadecimal is invalid.
    Otherwise returns an integer representing the decimal value.

    ## Examples

      iex> Hexadecimal.to_decimal("invalid")
      0

      iex> Hexadecimal.to_decimal("af")
      175

  """

  hex_table = [
    {"0", 0}, {"1", 1}, {"2", 2}, {"3", 3}, {"4", 4}, {"5", 5}, {"6", 6}, {"7", 7}, {"8", 8}, {"9", 9},
    {"a", 10}, {"b", 11}, {"c", 12}, {"d", 13}, {"e", 14}, {"f", 15},
    {"A", 10}, {"B", 11}, {"C", 12}, {"D", 13}, {"E", 14}, {"F", 15}
  ]

  @spec to_decimal(binary) :: integer
  def to_decimal(hex, acc \\ 0)
  for { char, index } <- hex_table do
    def to_decimal(unquote(char) <> tail, acc),
      do: to_decimal(tail, acc * 16 + unquote(index))
  end
  def to_decimal("", acc), do: acc
  def to_decimal(_, _), do: 0
end
