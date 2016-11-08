defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  # Source: https://en.wikipedia.org/wiki/Binary_search_algorithm
  def search(list, key), do: guess(list, key, 0, tuple_size(list))

  defp guess(_, _, lo, hi) when hi < lo, do: :not_found
  defp guess(_, _, lo, hi) when lo == hi, do: :not_found
  defp guess(list, key, s, e) do
    mid_index = div(s + e, 2)
    mid = elem(list, mid_index)
    cond do
      key > mid && mid_index == s -> :not_found
      key > mid -> guess(list, key, mid_index, e)
      key < mid && mid_index == e -> :not_found
      key < mid -> guess(list, key, s, mid_index)
      true -> {:ok, mid_index}
    end
  end
end
