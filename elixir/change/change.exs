defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns :error if it is not possible to compute the right amount of coins.
    Otherwise returns the tuple {:ok, map_of_coins}

    ## Examples

      iex> Change.generate(3, [5, 10, 15])
      :error

      iex> Change.generate(18, [1, 5, 10])
      {:ok, %{1 => 3, 5 => 1, 10 => 1}}

  """

  @spec generate(integer, list) :: {:ok, map} | :error
  def generate(_, []), do: :error
  def generate(amount, values) do
    values
    |> Enum.sort(&>/2)
    |> change(amount)
    |> ensure_all(values)
  end

  defp change([], 0), do: %{}
  defp change([], _), do: :error
  defp change([head | tail], amount) do
    largest = div(amount, head)
    remainder = rem(amount, head)
    case change(tail, remainder) do
      :error -> change(tail, amount)
      change -> Map.put(change, head, largest)
    end
  end

  defp ensure_all(:error, _), do: :error
  defp ensure_all(result, values) do
    {:ok, Map.merge(Map.new(values, &({&1, 0})), result)}
  end
end
