defmodule Series do

  @doc """
  Finds the largest product of a given number of consecutive numbers in a given string of numbers.
  """
  @spec largest_product(String.t, non_neg_integer) :: non_neg_integer
  def largest_product(_, 0), do: 1
  def largest_product("", _), do: raise ArgumentError
  def largest_product(_, size) when size < 0, do: raise ArgumentError
  def largest_product(numbers, size) when size > byte_size(numbers), do: raise ArgumentError
  def largest_product(numbers, size) do
    numbers
    |> String.split("", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.chunk(size, 1)
    |> Enum.map(&(Enum.reduce(&1, 1, fn(x, acc) -> x * acc end)))
    |> Enum.max
  end
end
