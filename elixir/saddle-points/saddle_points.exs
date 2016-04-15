defmodule Matrix do
  @doc """
  Parses a string representation of a matrix
  to a list of rows
  """
  @spec rows(String.t()) :: [[integer]]
  def rows(str) do
    str
    |> String.split("\n")
    |> Enum.map(&fetch_columns/1)
  end

  @doc """
  Parses a string representation of a matrix
  to a list of columns
  """
  @spec columns(String.t()) :: [[integer]]
  def columns(str), do: str |> rows |> transpose

  @doc """
  Calculates all the saddle points from a string
  representation of a matrix
  """
  @spec saddle_points(String.t()) :: [{integer, integer}]
  def saddle_points(str) do
    rows = str |> rows
    columns = rows |> transpose
    for x <- 0..length(rows) - 1,
        y <- 0..length(columns) - 1,
        row = Enum.at(rows, x),
        column = Enum.at(columns, y),
        element = Enum.at(row, y),
        Enum.max(row) === element,
        Enum.min(column) === element,
        do: { x, y }
  end

  defp fetch_columns(row) do
    row
    |> String.split
    |> Enum.map(&String.to_integer/1)
  end

  defp transpose(list) do
    list
    |> List.zip
    |> Enum.map(&Tuple.to_list/1)
  end
end
