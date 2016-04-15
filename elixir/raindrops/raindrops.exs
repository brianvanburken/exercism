defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(n) when rem(n, 3) === 0
                  and rem(n, 5) === 0
                  and rem(n, 7) === 0, do: "PlingPlangPlong"
  def convert(n) when rem(n, 5) === 0
                  and rem(n, 3) === 0, do: "PlingPlang"
  def convert(n) when rem(n, 3) === 0
                  and rem(n, 7) === 0, do: "PlingPlong"
  def convert(n) when rem(n, 5) === 0
                  and rem(n, 7) === 0, do: "PlangPlong"
  def convert(n) when rem(n, 3) === 0, do: "Pling"
  def convert(n) when rem(n, 5) === 0, do: "Plang"
  def convert(n) when rem(n, 7) === 0, do: "Plong"
  def convert(n), do: n |> to_string
end
