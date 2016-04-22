defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    Regex.scan(~r/(\w)\1*/, string)
    |> Enum.map_join(&compress/1)
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(~r/([0-9]+)([A-Z])/, string, capture: :all_but_first)
    |> Enum.map_join(&decompress/1)
  end

  defp compress([section, character]) do
    section
    |> String.length
    |> to_string
    |> Kernel.<>(character)
  end

  defp decompress([number, character]) do
    number = String.to_integer(number)
    String.duplicate(character, number)
  end
end
