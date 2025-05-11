defmodule TopSecret do
  def to_ast(str),
    do:
      str
      |> Code.string_to_quoted()
      |> elem(1)

  def decode_secret_message_part({:def, _, [{:when, _, [fun_def, _]}, _]} = ast, acc),
    do: {ast, [extract_name(fun_def) | acc]}

  def decode_secret_message_part({:defp, _, [{:when, _, [fun_def, _]}, _]} = ast, acc),
    do: {ast, [extract_name(fun_def) | acc]}

  def decode_secret_message_part({:def, _, [fun_def, _]} = ast, acc),
    do: {ast, [extract_name(fun_def) | acc]}

  def decode_secret_message_part({:defp, _, [fun_def, _]} = ast, acc),
    do: {ast, [extract_name(fun_def) | acc]}

  def decode_secret_message_part(ast, acc), do: {ast, acc}

  defp extract_name({_, _, nil}), do: ""
  defp extract_name({_, _, []}), do: ""
  defp extract_name({name, _, args}), do: name |> to_string() |> String.slice(0, length(args))
  defp extract_name(_), do: ""

  def decode_secret_message(string) do
    string
    |> to_ast()
    |> extract_module_functions()
  end

  defp extract_module_functions({:__block__, _, body}) do
    body
    |> Enum.reduce(
      [],
      fn f_ast, acc ->
        [extract_module_functions(f_ast) | acc]
      end
    )
    |> IO.inspect()
    |> Enum.reverse()
    |> Enum.join()
  end

  defp extract_module_functions({:defmodule, _, [_, [{:do, {:__block__, _, body}}]]}) do
    body
    |> Enum.reduce(
      [],
      fn f_ast, acc ->
        [
          f_ast
          |> decode_secret_message_part([])
          |> elem(1)
          | acc
        ]
      end
    )
    |> Enum.reverse()
    |> Enum.join()
  end

  defp extract_module_functions({:defmodule, _, [_, [{:do, body}]]}) do
    body
    |> decode_secret_message_part([])
    |> elem(1)
    |> Enum.join()
  end

  defp extract_module_functions(ast),
    do: decode_secret_message_part(ast, []) |> elem(1) |> Enum.join()
end
