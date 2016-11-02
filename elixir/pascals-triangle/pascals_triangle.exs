defmodule PascalsTriangle do
  @doc """
  Calculates the rows of a pascal triangle
  with the given height
  """
  @spec rows(integer) :: [[integer]]
  def rows(num) when num > 0,
    do: Stream.unfold([1], &row/1) |> Enum.take(num)

  defp row(l),
    do: { l, Enum.reduce(l, [0], fn(n, [h | t]) -> [n | [h + n  | t]] end) }
end
