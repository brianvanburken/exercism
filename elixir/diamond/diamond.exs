defmodule Diamond do
  @doc """
  Given a letter, it prints a diamond starting with 'A',
  with the supplied letter at the widest point.
  """
  @spec build_shape(char) :: String.t
  def build_shape(letter) do
    letter
    |> char_lines()
    |> Enum.map(&line(&1, letter - &1))
    |> Enum.join
  end

  defp line(?A, margin) do
    margin_str = String.duplicate " ", margin
    margin_str <> <<?A>> <> margin_str <> "\n"
  end

  defp line(char, margin) do
    middle_str = String.duplicate " ", (((char - ?A) * 2) - 1)
    margin_str = String.duplicate " ", margin
    margin_str <> <<char>> <> middle_str <> <<char>> <> margin_str <> "\n"
  end

  defp char_lines(?A) do
    [?A]
  end

  defp char_lines(char) do
    left = Enum.to_list(?A..char - 1)
    right = Enum.reverse(left)
    left ++ [char] ++ right
  end
end
