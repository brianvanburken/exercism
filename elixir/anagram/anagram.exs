defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    word = base |> rearrange
    candidates
    |> Enum.reject(&same?(&1, base))
    |> Enum.filter(fn x -> word == rearrange(x) end)
  end

  def same?(a, a), do: true
  def same?(a, b), do: String.downcase(a) === String.downcase(b)

  defp rearrange(word) do
    word |> String.downcase |> String.codepoints |> Enum.sort
  end
end
