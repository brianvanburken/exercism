defmodule Atbash do
  @doc """
  Encode a given plaintext to the corresponding ciphertext

  ## Examples

  iex> Atbash.encode("completely insecure")
  "xlnko vgvob rmhvx fiv"
  """
  @spec encode(String.t) :: String.t
  def encode(plaintext, acc \\ "", chunk_size \\ 0)
  def encode(plaintext, acc, size) when size === 5, do: encode(plaintext, acc <> " ", 0)
  mapping = Enum.zip(?a..?z, ?z..?a) ++
            Enum.zip(?A..?Z, ?z..?a) ++
            Enum.zip(?0..?9, ?0..?9)
  for { char, encoding } <- mapping do
    def encode(unquote("#{[char]}") <> tail, acc, size) do
      encode(tail, acc <> unquote("#{[encoding]}"), size + 1)
    end
  end
  def encode(<<_::binary-size(1), tail::binary>>, acc, size), do: encode(tail, acc, size)
  def encode(_, acc, _size), do: acc |> String.strip
end
