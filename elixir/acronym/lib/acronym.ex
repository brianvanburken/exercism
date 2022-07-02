defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    Regex.scan(~r{([a-z])[a-z']*}i, string, capture: :all_but_first)
    |> Enum.map_join(&List.first/1)
    |> String.upcase()
  end
end
