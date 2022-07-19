defmodule Roman do
  @mapping [
    { 1000, "M" },
    { 900,  "CM" },
    { 500,  "D" },
    { 400,  "CD" },
    { 100,  "C" },
    { 90,   "XC" },
    { 50,   "L" },
    { 40,   "XL" },
    { 10,   "X" },
    { 9,    "IX" },
    { 5,    "V" },
    { 4,    "IV" },
    { 1,    "I" }
  ]
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  # Using the bodyless function declaration the accumulator is set to an empty
  # binary string. Then, on compile time, functions are generated for each step
  # in the roman mapping. It start at the highest number and checks if it can
  # be subtracted from the given number without falling below zero. If it
  # matches the corresponding roman letter is added to the accumulator and it
  # recursively continues untill reaching zero.
  def numerals(n, acc \\ "")
  def numerals(0, acc), do: acc
  for { arabic, roman } <- @mapping do
    def numerals(n, acc) when n - unquote(arabic) >= 0 do
      numerals(n - unquote(arabic), acc <> unquote(roman))
    end
  end
end