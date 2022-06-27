defmodule DNA do
  mapping = %{
    ?\s => 0b0000,
    ?A => 0b0001,
    ?C => 0b0010,
    ?G => 0b0100,
    ?T => 0b1000
  }

  for {nucleotide, binary} <- mapping do
    def encode_nucleotide(unquote(nucleotide)), do: unquote(binary)
    def decode_nucleotide(unquote(binary)), do: unquote(nucleotide)
  end

  def encode(dna, acc \\ <<>>)
  def encode([], acc), do: acc
  def encode([dna | t], acc), do: encode(t, <<acc::bitstring, encode_nucleotide(dna)::4>>)

  def decode(dna, acc \\ [])
  def decode(<<>>, acc), do: acc |> reverse()

  def decode(<<n::4, t::bitstring>>, acc),
    do: decode(t, [decode_nucleotide(n) | acc])

  defp reverse(l), do: reverse(l, [])
  defp reverse([], acc), do: acc
  defp reverse([h | t], acc), do: reverse(t, [h | acc])
end
