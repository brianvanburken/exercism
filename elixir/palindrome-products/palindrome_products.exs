defmodule Palindromes do

  @doc """
  Generates all palindrome products from an optionally given min factor (or 1) to a given max factor.
  """
  @spec generate(non_neg_integer, non_neg_integer) :: map
  def generate(max_factor, min_factor \\ 1) do
    palindromes(min_factor, max_factor)
    |> Enum.reverse
    |> Enum.group_by(fn([x, y]) -> x * y end)
  end

  defp palindromes(min, max) do
    for x <- min..max,
        y <- x..max,
        palindrome?(x * y),
        do: [x, y]
  end

  defp palindrome?(number) do
    list = Integer.to_char_list(number)
    list === Enum.reverse(list)
  end
end
