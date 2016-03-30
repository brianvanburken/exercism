defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  4
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2), do: calculate(strand1, strand2, 0)

  @doc """
  This walks through both strands at the same time; character by character. The
  first function will match the strands on the same character. In this case it
  continues using the tail. If there is a difference in the characters on the
  same position it adds one to the accumulator. If both strings are of the same
  length it will match the third function and return the accumulator. If one of
  the strands differ from the other it ends up matching the last function which
  returns nil.
  """
  defp calculate([ ha | ta ], [ ha | tb ], acc), do: calculate(ta, tb, acc)
  defp calculate([ _  | ta ], [ _  | tb ], acc), do: calculate(ta, tb, acc + 1)
  defp calculate([], [], acc), do: acc
  defp calculate(_,  _, _), do: nil
end
