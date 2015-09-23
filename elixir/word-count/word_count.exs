defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
    |> String.downcase
    |> extract_words
    |> count_words
  end

  defp extract_words(string), do: Regex.scan(~r/(*UTF)[\p{L}0-9-]+/i, string)

  defp count_words(words) do
    Enum.reduce(words, %{}, fn([word], dict) ->
      Dict.update(dict, word, 1, &(&1 + 1))
    end)
  end
end