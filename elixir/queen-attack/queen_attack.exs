defmodule Queens do
  @type t :: %Queens{ black: {integer, integer}, white: {integer, integer} }
  defstruct white: {0, 3}, black: {7, 3}

  @size 7

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
  def to_string(queens) do
    for x <- 0..@size,
        y <- 0..@size,
        into: "",
        do: draw(x, y, queens) <> closing(x, y, @size)
  end

  # Outputs the repesentation of the queen or an empty space on the board for the
  # given position.
  defp draw(x, y, %Queens{black: {x, y}}), do: "B"
  defp draw(x, y, %Queens{white: {x, y}}), do: "W"
  defp draw(_, _, _), do: "_"

  # Outputs the closing character for the position. If the position is the end
  # of the board in the bottom left it returns an empty string. For edge of the
  # board it outputs a new line else for all the other position a spacer.
  defp closing(n, n, n), do: ""
  defp closing(_, n, n), do: "\n"
  defp closing(_, _, _), do: " "

  @doc """
  Checks if the queens can attack each other
  """
  @spec can_attack?(Queens.t()) :: boolean
  def can_attack?(%Queens{black: {x1,  _}, white: {x1,  _}}), do: true
  def can_attack?(%Queens{black: { _, y1}, white: { _, y1}}), do: true
  def can_attack?(%Queens{black: {x1, y1}, white: {x2, y2}}), do: abs(x1 - x2) == abs(y1 - y2)
end
