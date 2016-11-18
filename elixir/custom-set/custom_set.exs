defmodule CustomSet do
  @opaque t :: %__MODULE__{map: map}

  defstruct map: []

  @spec new(Enum.t) :: t
  def new([]), do: %CustomSet{}
  def new(enumerable), do: %CustomSet{map: Enum.uniq(enumerable)}

  @spec empty?(t) :: boolean
  def empty?(%CustomSet{map: map}) when length(map) == 0, do: true
  def empty?(_), do: false

  @spec contains?(t, any) :: boolean
  def contains?(%CustomSet{map: []}, _), do: false
  def contains?(%CustomSet{map: map}, element), do: element in map

  @spec subset?(t, t) :: boolean
  def subset?(%CustomSet{map: []}, %CustomSet{map: []}), do: true
  def subset?(%CustomSet{map: []}, %CustomSet{map: _}), do: true
  def subset?(%CustomSet{map: _}, %CustomSet{map: []}), do: false
  def subset?(%CustomSet{map: map1}, custom_set2), do: Enum.all?(map1, &(contains?(custom_set2, &1)))

  @spec disjoint?(t, t) :: boolean
  def disjoint?(%CustomSet{map: []}, %CustomSet{map: []}), do: true
  def disjoint?(%CustomSet{map: []}, %CustomSet{map: _}), do: true
  def disjoint?(%CustomSet{map: _}, %CustomSet{map: []}), do: true
  def disjoint?(%CustomSet{map: map1}, custom_set2), do: !Enum.any?(map1, &(contains?(custom_set2, &1)))

  @spec equal?(t, t) :: boolean
  def equal?(%CustomSet{map: map}, %CustomSet{map: map}), do: true
  def equal?(%CustomSet{map: map1}, %CustomSet{map: map2}), do: Enum.sort(map1) == Enum.sort(map2)

  @spec add(t, any) :: t
  def add(%CustomSet{map: map}, element), do: new([element | map])

  @spec intersection(t, t) :: t
  def intersection(%CustomSet{map: []}, %CustomSet{map: []}), do: %CustomSet{}
  def intersection(%CustomSet{map: []}, %CustomSet{map: _}), do: %CustomSet{}
  def intersection(%CustomSet{map: _}, %CustomSet{map: []}), do: %CustomSet{}
  def intersection(%CustomSet{map: map}, custom_set2), do: Enum.filter(map, &(contains?(custom_set2, &1))) |> new()

  @spec difference(t, t) :: t
  def difference(%CustomSet{map: []}, %CustomSet{map: []}), do: %CustomSet{}
  def difference(%CustomSet{map: []}, %CustomSet{map: _}), do: %CustomSet{}
  def difference(%CustomSet{map: map}, %CustomSet{map: []}), do: new(map)
  def difference(%CustomSet{map: map}, custom_set2), do: Enum.filter(map, &(!contains?(custom_set2, &1))) |> new()

  @spec union(t, t) :: t
  def union(%CustomSet{map: []}, %CustomSet{map: []}), do: %CustomSet{}
  def union(%CustomSet{map: map}, %CustomSet{map: []}), do: new(map)
  def union(%CustomSet{map: []}, %CustomSet{map: map}), do: new(map)
  def union(%CustomSet{map: map1}, %CustomSet{map: map2}), do: new(map1 ++ map2)
end
