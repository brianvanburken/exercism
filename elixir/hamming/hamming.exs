defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  4
  """
  # This walks through both strands at the same time; character by character. The
  # first function will match the strands on the same character. In this case it
  # continues using the tail. If there is a difference in the characters on the
  # same position it adds one to the accumulator. If both strings are of the same
  # length it will match the third function and return the accumulator. If one of
  # the strands differ from the other it ends up matching the last function which
  # returns nil.
  @spec hamming_distance([char], [char]) :: non_neg_integer

  def hamming_distance(strand1, strand2, acc \\ 0)
  def hamming_distance([ ha | ta ], [ ha | tb ], acc), do: hamming_distance(ta, tb, acc)
  def hamming_distance([ _  | ta ], [ _  | tb ], acc), do: hamming_distance(ta, tb, acc + 1)
  def hamming_distance([], [], acc), do: acc
  def hamming_distance(_,  _, _), do: nil
end
