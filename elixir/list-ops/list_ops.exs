defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic funcs
  # yourself.
  #
  # Note that `++` is a func from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count([]), do: 0
  def count([_|tail]), do: 1 + count(tail)

  @spec reverse(list) :: list
  def reverse(list), do: reverse(list, [])
  defp reverse([], acc), do: acc
  defp reverse([head|tail], acc), do: reverse(tail, [head|acc])

  @spec map(list, (any -> any)) :: list
  def map([], _), do: []
  def map([head|tail], func), do: [ func.(head) | map(tail, func) ]

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _), do: []
  def filter([head|tail], func) do
    cond do
      func.(head) -> [head | filter(tail, func)]
      true -> filter(tail, func)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _), do: acc
  def reduce([head|tail], acc, func), do: reduce(tail, func.(head, acc), func)

  @spec append(list, list) :: list
  def append(list, []), do: list
  def append([], list), do: list
  def append([head|tail], list), do: [head | append(tail, list)]

  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat([head|tail]), do: append(head, concat(tail))
end
