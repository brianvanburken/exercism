defmodule CryptoSquare do
  @doc """
  Encode string square methods
  ## Examples

    iex> CryptoSquare.encode("abcd")
    "ac bd"
  """
  @spec encode(String.t) :: String.t
  def encode(""), do: ""
  def encode(str) do
    normalized = str
                 |> String.downcase()
                 |> String.replace(~r/[^0-9a-z]/, "")
                 |> String.graphemes()
    columns = normalized
              |> length()
              |> :math.sqrt()
              |> Float.ceil()
              |> trunc()

    normalized
    |> Enum.chunk(columns, columns, Stream.cycle([""]))
    |> List.zip()
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.join(" ")
  end
end
