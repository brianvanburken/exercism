defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare([], []), do: :equal
  def compare([], _), do: :sublist
  def compare(_, []), do: :superlist
  def compare(list, list), do: :equal
  def compare(a, b) do
    cond do
      length(a) <= length(b) && sublist?(a, b)->
        :sublist
      sublist?(b, a) ->
        :superlist
      true ->
        :unequal
    end
  end
  # def compare(_, _), do: :unequal

  defp sublist?(a, b) do
    cond do
      length(a) > length(b) ->
        false
      a === Enum.take(b, length(a)) ->
        true
      true ->
        sublist?(a, tl(b))
    end
  end
end
