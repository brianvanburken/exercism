defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a dict of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t], pos_integer) :: map
  def frequency([], _), do: %{}
  def frequency([ text ], _), do: calculate(text)
  def frequency(texts, workers) do
    texts
    |> distribute(workers)
    |> Enum.map(&(Task.async(__MODULE__, :work, [&1])))
    |> Enum.flat_map(&Task.await/1)
    |> Enum.reduce(%{}, fn {k, c}, m ->
      Map.merge(m, %{k => c}, fn _, o, n -> o + n end)
    end)
  end

  def work(texts), do: texts |> Enum.join |> calculate

  defp distribute(texts, 1), do: [texts]
  defp distribute(texts, workers) when length(texts) < workers, do: Enum.chunk(texts, length(texts), length(texts))
  defp distribute(texts, workers), do: Enum.chunk(texts, workers, workers)

  defp calculate(text) do
    text
    |> String.downcase
    |> String.replace(~r/[!@%$^&* _,:0-9,\.\?\s]+/, "")
    |> String.codepoints
    |> Enum.reduce(%{}, &count/2)
  end

  defp count(letter, acc), do: Dict.update(acc, letter, 1, &(&1 + 1))
end
