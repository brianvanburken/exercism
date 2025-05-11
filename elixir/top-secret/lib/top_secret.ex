defmodule TopSecret do
  def to_ast(str),
    do:
      str
      |> Code.string_to_quoted()
      |> elem(1)

  def decode_secret_message_part(
        {kind, _meta, [{:when, _, [fun_def, _cond]}, _]} = ast,
        acc
      )
      when kind in [:def, :defp],
      do: {ast, [extract_name(fun_def) | acc]}

  def decode_secret_message_part(
        {kind, _meta, [fun_def, _]} = ast,
        acc
      )
      when kind in [:def, :defp],
      do: {ast, [extract_name(fun_def) | acc]}

  def decode_secret_message_part(ast, acc), do: {ast, acc}

  defp extract_name({_, _, nil}), do: ""
  defp extract_name({_, _, []}), do: ""
  defp extract_name({name, _, args}), do: name |> to_string() |> String.slice(0, length(args))
  defp extract_name(_), do: ""

  def decode_secret_message(string) do
    string
    |> to_ast()
    |> flatten_ast()
    |> Enum.reduce("", fn node, acc ->
      {_, [name]} = decode_secret_message_part(node, [])
      acc <> name
    end)
  end

  defp flatten_ast({:__block__, _, body}), do: Enum.flat_map(body, &flatten_ast/1)
  defp flatten_ast({:defmodule, _, [_, [do: inner]]}), do: flatten_ast(inner)
  defp flatten_ast({:def, _, _} = fun), do: [fun]
  defp flatten_ast({:defp, _, _} = fun), do: [fun]
  defp flatten_ast(_), do: []
end
