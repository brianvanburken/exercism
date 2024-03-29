defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map()
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.split(~r/[!@%$^&* _,:\n.]+/, trim: true)
    |> Enum.map(&String.trim(&1, "'"))
    |> Enum.reduce(%{}, &count_words/2)
  end

  defp count_words(word, acc), do: Map.update(acc, word, 1, &(&1 + 1))
end
