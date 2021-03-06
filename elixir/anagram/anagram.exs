defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    anagram = base |> rearrange
    for word <- candidates,
        String.downcase(word) !== base,
        anagram === rearrange(word),
        do: word
  end

  defp rearrange(word) do
    word |> String.downcase |> to_char_list |> Enum.sort
  end
end
