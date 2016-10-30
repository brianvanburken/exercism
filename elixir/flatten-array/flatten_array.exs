defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list, acc \\ [])
  def flatten([h | t], acc) when is_list(h), do: flatten(h, flatten(t, acc))
  def flatten([nil | t], acc), do: flatten(t, acc)
  def flatten([h | t], acc), do: [h | flatten(t, acc)]
  def flatten([], acc), do: acc
end
