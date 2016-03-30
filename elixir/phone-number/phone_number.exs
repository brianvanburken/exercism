defmodule Phone do
  @invalid_number "0000000000"

  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number(raw) when length(raw) < 10, do: @invalid_number
  def number(raw), do: raw |> sanitize |> validate

  defp sanitize(phone), do: phone |> String.replace(~r/[^0-9a-z]/, "")

  defp validate(number) when byte_size(number) == 10, do: number
  defp validate("1" <> tail = number) when byte_size(number) == 11, do: tail
  defp validate(_), do: @invalid_number

  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    raw |> sanitize |> validate |> slice |> hd
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("123-456-7890")
  "(123) 456-7890"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    raw
    |> sanitize
    |> validate
    |> separate
    |> format
  end

  defp separate(number) do
    [ String.slice(number, 0..2),
      String.slice(number, 3..5),
      String.slice(number, 6..9) ]
  end

  defp format([ area, prefix, line ]), do: "(#{area}) #{prefix}-#{line}"
end
