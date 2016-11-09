defmodule Wordy do

  @doc """
  Calculate the math problem in the sentence.
  """
  @spec answer(String.t) :: integer

  def answer("What is " <> question) do
    question
    |> String.replace("?", "")
    |> String.replace(" by", "")
    |> String.split()
    |> parse()
  end
  def answer(_), do: raise ArgumentError

  defp parse(words, acc \\ 0)
  defp parse([], acc), do: acc
  defp parse(["plus", num | tail], acc), do: parse(tail, acc + String.to_integer(num))
  defp parse(["minus", num | tail], acc), do: parse(tail, acc - String.to_integer(num))
  defp parse(["multiplied", num | tail], acc), do: parse(tail, acc * String.to_integer(num))
  defp parse(["divided", num | tail], acc), do: parse(tail, div(acc, String.to_integer(num)))
  defp parse([head | tail], acc) do
    case Integer.parse(head) do
      :error -> raise ArgumentError
      {num, _} -> parse(tail, num)
    end
  end
end
