defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) when nucleotide in @nucleotides do
    strand |> validate! |> nucleotides |> Map.get(nucleotide)
  end
  def count(_strand, _nucleotide), do: raise ArgumentError


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    strand |> validate! |> nucleotides
  end

  defp validate!(strand) do
    unless Enum.all?(strand, &(&1 in @nucleotides)), do: raise ArgumentError
    strand
  end

  defp nucleotides(strand) do
    strand |> Enum.reduce(%{?A => 0, ?T => 0, ?C => 0, ?G => 0}, fn(char, acc) ->
      count = Map.get(acc, char) || 0
      Map.put(acc, char, count+1)
    end)
  end
end