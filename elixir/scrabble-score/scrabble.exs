defmodule Scrabble do
  @mapping [
    {"a", 1}, {"e", 1}, {"i", 1}, {"o", 1}, {"u", 1}, {"l", 1}, {"n", 1},
    {"r", 1}, {"s", 1}, {"t", 1}, {"d", 2}, {"g", 2}, {"b", 3}, {"c", 3},
    {"m", 3}, {"p", 3}, {"f", 4}, {"h", 4}, {"v", 4}, {"w", 4}, {"y", 4},
    {"k", 5}, {"j", 8}, {"x", 8}, {"q", 10}, {"z", 10}
  ]
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer

  # The bodyless function declares the default value for the accumulator. Which
  # starts at 0. Here is a nice article about bodyless functions in Elixir:
  # https://bordeltabernacle.github.io/2016/01/13/notes-on-elixir-bodyless-functions.html
  # Then it generates functions on compile time using the mapping of letter to
  # score. It generates a function for lower and uppercase characters. This is
  # for case-insensitivity. After that a function is defined to skip unkown
  # characters. When the whole string is walked through the accumulator
  # containing the score is returned.
  def score(word, acc \\ 0)
  for { letter, score } <- @mapping do
    capital_letter = letter |> String.upcase
    def score(unquote(capital_letter) <> tail, acc), do: score(tail, acc + unquote(score))
    def score(unquote(letter) <> tail, acc), do: score(tail, acc + unquote(score))
  end
  def score(<<_::binary-size(1), tail::binary>>, acc), do: score(tail, acc)
  def score(<<>>, acc), do: acc
end
