defmodule Queens do
  @type t :: %Queens{ black: {integer, integer}, white: {integer, integer} }
  defstruct white: {0, 3}, black: {7, 3}

  @doc """
  Creates a new set of Queens
  """
  @spec new(nil | tuple, nil | tuple) :: Queens.t()
  def new(same, same), do: raise ArgumentError
  def new(white, black), do: %Queens{white: white, black: black}
  def new, do: %Queens{}

  @doc """
  Gives a string reprentation of the board with
  white and black queen locations shown
  """
  @spec to_string(Queens.t()) :: String.t()
  def to_string(%Queens{ white: white, black: black}) do
    "_"
    |> List.duplicate(8)
    |> List.duplicate(8)
    |> place_queen(white, "W")
    |> place_queen(black, "B")
    |> Enum.map(&Enum.join(&1, " "))
    |> Enum.join("\n")
  end

  defp place_queen(board, {x, y}, char) do
    List.update_at board, x, fn(row) ->
      List.replace_at row, y, char
    end
  end

  @doc """
  Checks if the queens can attack each other
  """
  @spec can_attack?(Queens.t()) :: boolean
  def can_attack?(%Queens{black: {x1,  _}, white: {x1,  _}}), do: true
  def can_attack?(%Queens{black: { _, y1}, white: { _, y1}}), do: true
  def can_attack?(%Queens{black: {x1, y1}, white: {x2, y2}}), do: abs(x1 - x2) == abs(y1 - y2)
end
