defmodule Minesweeper do

  @doc """
  Annotate empty spots next to mines with the number of mines next to them.
  """
  @spec annotate([String.t]) :: [String.t]
  def annotate([]), do: []
  def annotate(board) do
    board = board |> Enum.map(&to_char_list/1)
    board
    |> Stream.with_index
    |> Enum.map(fn {row, i} ->
      row
      |> Stream.with_index
      |> Stream.map(fn {cell, j} -> annotate_cell(cell, {i, j}, board) end)
      |> Enum.join
    end)
  end

  # Do not annotate cells that contain mines. For the other cells it calculates
  # the neighbors and outputs based on the amount.
  defp annotate_cell(?*, _, _), do: "*"
  defp annotate_cell(_, pos, board), do: annotate_neighbors neighbors(pos, board)

  # Outputs a space if 0 else the number of neighbors that are mines.
  defp annotate_neighbors(neighbors) when length(neighbors) === 0, do: " "
  defp annotate_neighbors(neighbors), do: "#{length(neighbors)}"

  # To calculate the neighbors you must visualize a square around the position
  # where everything is one position above, below, back and forward. As shown
  # in the figure below. With this matrix each relative position in visited in
  # the board. It takes edges into account. If the cell contains the mine
  # character it's position is added to the list. In the end a list is returned
  # which contains all the positions of the surrounding mines.
  #
  #  --> y
  # | +--------+--------+---------+
  # v | -1, -1 | -1,  0 |  -1,  1 |
  # x +--------+--------+---------+
  #   |  0, -1 |        |   0,  1 |
  #   +--------+--------+---------+
  #   |  1, -1 | -1,  0 |   1,  1 |
  #   +--------+--------+---------+
  #   ^ Figure of the matrix relevant to center of a cell.
  positions = for x <- [-1, 0, 1], y <- [-1, 0, 1], x != 0 || y != 0, do: { x, y }
  defp neighbors({i, j}, board) do
    for { x, y }  <- unquote(positions),
        row = x + i,
        col = y + j,
        row >= 0 && row < length(board),
        col >= 0 && col < length(hd(board)),
        ?* === board |> Enum.at(row) |> Enum.at(col),
        do: {x, y}
  end
end
