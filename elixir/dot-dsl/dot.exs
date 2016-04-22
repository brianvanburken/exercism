defmodule Graph do
  defstruct attrs: [], nodes: [], edges: []

  def sorted(%Graph{} = g) do
    %Graph{ g |
      attrs: g.attrs |> Enum.sort,
      nodes: g.nodes |> Enum.sort,
      edges: g.edges |> Enum.sort,
    }
  end
end

defmodule Dot do
  defmacro graph(ast) do
    ast |> parse |> Graph.sorted |> Macro.escape
  end

  # Initial AST with DO block
  defp parse(ast, graph \\ %Graph{})
  defp parse([do: nil], graph), do: graph
  defp parse([do: ast], graph), do: parse(ast, graph)

  # Recurse through the blocks
  defp parse({:__block__, _, []}, graph), do: graph
  defp parse({:__block__, _, [head | tail]}, graph), do: parse({:__block__, [], tail}, parse(head, graph))

  # Recurse through the graph attribute AST.
  defp parse({:graph, _, nil}, graph), do: add_attr(graph, [])
  defp parse({:graph, _, [[]]}, graph), do: add_attr(graph, [])
  defp parse({:graph, _, [kw_val]}, graph), do: add_attr(graph, kw_val)

  # Recurse through the graph vertices AST.
  defp parse({vertex, _, nil}, graph), do: add_vertex(graph, vertex, [])
  defp parse({vertex, _, [[]]}, graph), do: add_vertex(graph, vertex, [])
  defp parse({vertex, _, [[kw_val]]}, graph), do: add_vertex(graph, vertex, [kw_val])

  # Recurs through the graph edges AST.
  defp parse({:--, _, [{v1, _, _}, {v2, _, nil}]}, graph), do: add_edge(graph, v1, v2, [])
  defp parse({:--, _, [{v1, _, _}, {v2, _, [[]]}]}, graph), do: add_edge(graph, v1, v2, [])
  defp parse({:--, _, [{v1, _, _}, {v2, _, [kw_val]}]}, graph), do: add_edge(graph, v1, v2, kw_val)

  defp parse(_, _), do: raise ArgumentError

  defp add_vertex(graph, vertex, kw_val), do: Map.update(graph, :nodes, [{vertex, kw_val}], &[{vertex, kw_val} | &1])
  defp add_attr(graph, kw_val), do: Map.update(graph, :attrs, kw_val, &(&1 |> Enum.concat(kw_val)))
  defp add_edge(graph, v1, v2, kw_val), do: Map.update(graph, :edges, [{v1, v2, kw_val}], &[{v1, v2, kw_val} | &1])
end
