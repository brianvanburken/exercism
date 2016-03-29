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
    Regex.scan(~r{(\w)\1*}, string)
    |> Enum.map(&compress/1)
    |> Enum.join
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(~r{([0-9]+)([A-Z])}, string)
    |> Enum.map(&decompress/1)
    |> Enum.join
  end

  defp compress([section, character]) do
    section
    |> String.length
    |> to_string
    |> Kernel.<>(character)
  end

  defp decompress([_section, number, character]) do
    number = String.to_integer(number)
    String.duplicate(character, number)
  end
end
