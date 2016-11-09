defmodule RailFenceCipher do
  @doc """
  Encode a given plaintext to the corresponding rail fence ciphertext
  """
  @spec encode(String.t, pos_integer) :: String.t
  def encode(str, rails) do
    str
    |> String.graphemes()
    |> fence(rails)
    |> Enum.join()
  end

  defp fence(chars, rails) do
    chars
    |> Enum.zip(cycle(rails))
    |> Enum.group_by(&group_key/1, &group_val/1)
    |> Map.values()
  end

  defp cycle(1), do: Stream.cycle([0])
  defp cycle(rails) do
    0..rails-1
    |> Enum.to_list()
    |> Enum.concat(Enum.to_list(rails-2..1))
    |> Stream.cycle()
  end

  defp group_key({_letter, rail}), do: rail
  defp group_val({letter, _rail}), do: letter

  @doc """
  Decode a given rail fence ciphertext to the corresponding plaintext
  """
  @spec decode(String.t, pos_integer) :: String.t
  def decode(str, rails) do
    range = 0..String.length(str) - 1
    range
    |> Enum.to_list()
    |> fence(rails)
    |> List.flatten()
    |> unpack(str, range)
  end

  defp unpack(fence, str, range) do
    range
    |> Enum.map(&(String.at(str, spot(fence, &1))))
    |> Enum.join()
  end

  defp spot(fence, num), do: Enum.find_index(fence, &(&1 == num))
end
