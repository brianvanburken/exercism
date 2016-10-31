defmodule Luhn do
  @doc """
  Calculates the total checksum of a number
  """
  @spec checksum(String.t()) :: integer
  def checksum(number) do
    number
    |> String.to_integer()
    |> Integer.digits()
    |> Enum.reverse()
    |> Enum.with_index()
    |> Enum.map(&check(&1))
    |> Enum.sum()
  end

  defp check({n, i}) when rem(i, 2) == 0, do: n
  defp check({n, _}) when n > 5, do: (n * 2) - 9
  defp check({n, _}), do: n * 2

  @doc """
  Checks if the given number is valid via the luhn formula
  """
  @spec valid?(String.t()) :: boolean
  def valid?(number) do
    number
    |> checksum()
    |> rem(10)
    |> Kernel.==(0)
  end

  @doc """
  Creates a valid number by adding the correct
  checksum digit to the end of the number
  """
  @spec create(String.t()) :: String.t()
  def create(number) do
    number
    |> Kernel.<>("0")
    |> checksum()
    |> rem(10)
    |> congruent(number)
  end

  defp congruent(0, number), do: number <> "0"
  defp congruent(n, number), do: number <> Integer.to_string(10 - n)
end
