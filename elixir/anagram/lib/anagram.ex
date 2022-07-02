defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    anagram = base |> rearrange

    for word <- candidates,
        word !== base,
        String.downcase(word) !== String.downcase(base),
        anagram === rearrange(word),
        into: [],
        do: word
  end

  defp rearrange(word) do
    word |> String.downcase() |> Kernel.to_charlist() |> Enum.sort()
  end
end
