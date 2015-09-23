defmodule Teenager do
  def hey(input) do
    stripped  = String.strip(input)
    cond do
      silent?(stripped) -> "Fine. Be that way!"
      yelling?(stripped) -> "Whoa, chill out!"
      question?(stripped) -> "Sure."
      true -> "Whatever."
    end
  end

  defp silent?(""), do: true
  defp silent?(_), do: false

  defp yelling?(input) do
    String.upcase(input) === input && String.downcase(input) !== input
  end

  defp question?(input)  do
    String.ends_with?(input, "?")
  end
end
