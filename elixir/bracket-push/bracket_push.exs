defmodule BracketPush do
  @brackets [{"{", "}"}, {"[", "]"}, {"(", ")"}]

  @doc """
  Checks that all the brackets and braces in the string are matched correctly,
  and nested correctly. It strips out all the non bracket characters so those
  will be ignored. Then the string is split into its codepoints and all the
  codepoints are validated for each opening and closing bracket.
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    str
    |> String.replace(~r/[^\{\}\[\]\(\)]/, "")
    |> valid?
  end

  # This function pattern matches on each opening/closing tag by using tail
  # recursion. For each opening bracket its corresponding closing bracket is
  # pushed to the accumulator. When a closing bracket is encounter it gets matched
  # with the head of the accumulator. If this matches, it recurses further. If an
  # incorrect bracket is encountered it doesn't match and ends up with the last
  # match that returns false. If there is an unclosed bracket it ends up matching
  # the second function and returns false. If in the end all is well we end up
  # with and empty binary stringt and empty accumulator list. For this we return
  # true.
  defp valid?(string, accumulator \\ [])
  defp valid?("", []), do: true
  defp valid?("",  _), do: false
  for {open, close} <- @brackets do
    defp valid?(unquote(open) <> tail, acc), do: valid?(tail, [unquote(close) | acc])
  end
  defp valid?(<<x::binary-size(1), tail::binary>>, [ x | rest ]), do: valid?(tail, rest)
  defp valid?(_, _), do: false
end
