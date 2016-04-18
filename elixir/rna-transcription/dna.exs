defmodule DNA do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna, acc \\ [])
  def to_rna([], acc), do: acc |> Enum.reverse
  for { dna, rna } <- %{ ?G => ?C, ?C => ?G, ?T => ?A, ?A => ?U } do
    def to_rna([ unquote(dna) | tail ], acc) do
      to_rna(tail, [ unquote(rna) | acc ])
    end
  end
end
