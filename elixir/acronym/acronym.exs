defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    Regex.scan(~r{([A-Za-z])[a-z]+}, string, capture: :all_but_first)
    |> List.flatten
    |> Enum.join
    |> String.upcase
  end
end
