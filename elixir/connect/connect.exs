defmodule Connect do
  @doc """
  Calculates the winner (if any) of a board
  using "O" as the white player
  and "X" as the black player
  """
  @spec result_for([String.t]) :: :none | :black | :white
  def result_for(board) do
    cells = board |> cells
    { start_o, start_x } = { start_for(cells, ?O), start_for(cells, ?X) }
    { height, width } = board |> dimensions

    fn_traverse_start = fn edge ->
      fn { position, piece } ->
        traverse(cells, position, piece, %{position => true}, edge)
      end
    end

    o_connected = Enum.flat_map(start_o, fn_traverse_start.(height))
    x_connected = Enum.flat_map(start_x, fn_traverse_start.(width))
    who_won(length(o_connected) > 0, length(x_connected) > 0)
  end

  defp who_won(true,  _), do: :white
  defp who_won(_,  true), do: :black
  defp who_won(_,     _), do: :none

  defp do_traverse(cells, position, piece, visited, edge) do
    position
    |> neighbors
    |> Enum.reject(&(visited[&1]))
    |> Enum.filter(&(cells[&1] == piece))
    |> Enum.flat_map(&(traverse(cells, &1, piece, Map.put(visited, &1, true), edge)))
  end

  defp traverse(cells, pos, ?X, visited, edge) do
    case {pos, cells[pos]} do
      {{_, ^edge}, ?X}-> [:black]
      _ -> do_traverse(cells, pos, ?X, visited, edge)
    end
  end

  defp traverse(cells, pos, ?O, visited, edge) do
    case {pos, cells[pos]} do
      {{^edge, _}, ?O}-> [:white]
      _ -> do_traverse(cells, pos, ?O, visited, edge)
    end
  end

  defp dimensions([row | _] = board), do: { length(board) - 1, String.length(row) - 1 }

  defp cells(board) do
    board_with_index = board
    |> Enum.map(&to_char_list/1)
    |> Enum.map(&Enum.with_index/1)
    |> Enum.with_index
    for { row, x } <- board_with_index,
        { col, y } <- row,
        into: %{},
        do: { { x, y }, col }
  end

  defp neighbors({x, y}) do
    [ {x-1, y-1}, {x, y-1}, {x+1, y-1},
      {x-1, y  },           {x+1, y  },
      {x-1, y+1}, {x, y+1}, {x+1, y+1} ]
  end

  defp start_for(cells, ?O), do: for {{0, _}, ?O} = position <- cells, do: position
  defp start_for(cells, ?X), do: for {{_, 0}, ?X} = position <- cells, do: position
end
