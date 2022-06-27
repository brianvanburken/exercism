defmodule LanguageList do
  def new(), do: []

  def add(list, language), do: [language] ++ list

  def remove(list), do: List.delete_at(list, 0)

  def first(list), do: List.first(list)

  def count(list), do: Enum.count(list)

  def functional_list?(list) do
    list
    |> Enum.any?(&Enum.member?(["Clojure", "Haskell", "Erlang", "F#", "Elixir"], &1))
  end
end
