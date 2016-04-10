defmodule BracketPush do
  @brackets [{"{", "}"}, {"[", "]"}, {"(", ")"}]

  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    str
    |> String.replace(~r/[^\{\}\[\]\(\)]/, "")
    |> String.codepoints
    |> valid?([])
  end

  defp valid?([], []), do: true
  defp valid?([],  _), do: false
  for {open, close} <- @brackets do
    defp valid?([unquote(open) | tail], acc), do: valid?(tail, [unquote(close) | acc])
  end
  defp valid?([ x | tail ], [ x | rest ]), do: valid?(tail, rest)
  defp valid?(_, _), do: false
end
