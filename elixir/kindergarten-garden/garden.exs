defmodule Garden do
  names = ~w(alice bob charlie david eve fred ginny harriet ileana joseph kincaid larry)a 

  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """

  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ unquote(names)) do
    [first_row, second_row] = info_string |> String.split("\n")
      
    student_names
    |> Enum.sort
    |> Enum.with_index
    |> Enum.into(%{}, fn {name, index} -> {name, index*2..index*2+1} end)
    |> Enum.into(%{}, fn {name, range} ->
       {name,
        String.slice(first_row, range) <> String.slice(second_row, range)
        |> String.codepoints
        |> Enum.map(&plant/1)
        |> List.to_tuple
        }
    end)
  end

  defp plant("G"), do: :grass
  defp plant("C"), do: :clover
  defp plant("R"), do: :radishes
  defp plant("V"), do: :violets
end
