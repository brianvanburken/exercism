defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
    |> String.downcase
    |> String.split(~r/[!@%$^&* _,:]+/, trim: true)
    |> Enum.reduce(%{}, &count_words/2)
  end

  defp count_words(word, acc), do: Dict.update(acc, word, 1, &(&1 + 1))
end
