defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2), do: calculate(strand1, strand2, 0)

  # This walks through both strands at the same time; character by character. The
  # first function will match the strands on the same character. In this case it
  # continues using the tail. If there is a difference in the characters on the
  # same position it adds one to the accumulator. If both strings are of the same
  # length it will match the third function and return the accumulator. If one of
  # the strands differ from the other it ends up matching the last function which
  # returns nil.
  defp calculate(strand1, strand2, _) when length(strand1) != length(strand2),
    do: {:error, "strands must be of equal length"}

  defp calculate([ha | ta], [ha | tb], acc), do: calculate(ta, tb, acc)
  defp calculate([_ | ta], [_ | tb], acc), do: calculate(ta, tb, acc + 1)
  defp calculate([], [], acc), do: {:ok, acc}
  defp calculate('', _, 0), do: {:error, "strands must be of equal length"}
  defp calculate(_, '', 0), do: {:error, "strands must be of equal length"}
  defp calculate(_, _, _), do: nil
end
