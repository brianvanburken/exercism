defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, a), do: :equal
  def compare(a, []), do: :superlist
  def compare([], b), do: :sublist
  def compare(a, b) when length(a) >= length(b), do: is(b, a, b, :superlist)
  def compare(a, b), do: is(a, b, a, :sublist)

  defp is(_a, _b, [], type), do: type
  defp is(_a, [], _c, _parameter), do: :unequal
  defp is(a, b, c, type) when a == b, do: type
  defp is(a, [hb | tb], [hc | tc], parameter) when hb === hc, do: is(a, tb, tc, parameter)
  defp is(a, [hb | tb], _c, parameter), do: is(a, tb, a, parameter)
end
