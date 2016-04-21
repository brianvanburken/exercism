defmodule Minesweeper do

  @doc """
  Annotate empty spots next to mines with the number of mines next to them.
  """
  @spec annotate([String.t]) :: [String.t]
  def annotate([]), do: []
  def annotate(board) do
    board = board |> Enum.map(&String.codepoints/1)
    board
    |> Enum.with_index
    |> Enum.map(fn {row, i} ->
      row
      |> Enum.with_index
      |> Enum.map_join(fn {cell, j} ->
        annotate_cell(cell, {i, j}, board)
      end)
    end)
  end

  defp annotate_cell("*", _, _), do: "*"
  defp annotate_cell(_, pos, board), do: annotate_for(neighbors(pos, board))

  defp annotate_for(neighbors) when length(neighbors) === 0, do: " "
  defp annotate_for(neighbors), do: to_string length(neighbors)

  #  --> y
  # | +--------+--------+---------+
  # v | -1, -1 | -1,  0 |  -1,  1 |
  # x +--------+--------+---------+
  #   |  0, -1 |        |   0,  1 |
  #   +--------+--------+---------+
  #   |  1, -1 | -1,  0 |   1,  1 |
  #   +--------+--------+---------+
  positions = for x <- [-1, 0, 1], y <- [-1, 0, 1], x != 0 || y != 0, do: { x, y }
  defp neighbors({i, j}, board) do
    for { x, y }  <- unquote(positions),
        row = x + i,
        col = y + j,
        row >= 0 && row < length(board),
        col >= 0 && col < length(hd(board)),
        "*" === board |> Enum.at(row) |> Enum.at(col),
        do: {x, y}
  end
end
