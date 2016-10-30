defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    codepoints = sentence
                 |> String.replace(~r/\s|-/u, "")
                 |> String.codepoints
    Enum.uniq(codepoints) == codepoints
  end

end
