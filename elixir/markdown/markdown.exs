defmodule Markdown do
  @doc """
    Parses a given string with Markdown syntax and returns the associated HTML for that string.

    ## Examples

    iex> Markdown.parse("This is a paragraph")
    "<p>This is a paragraph</p>"

    iex> Markdown.parse("#Header!\n* __Bold Item__\n* _Italic Item_")
    "<h1>Header!</h1><ul><li><em>Bold Item</em></li><li><i>Italic Item</i></li></ul>"
  """

  @spec parse(String.t) :: String.t
  def parse(markdown) do
    markdown
    |> String.split("\n")
    |> Enum.chunk_by(&String.first/1)
    |> Enum.map(&process/1)
    |> Enum.join
  end

  defp process(["*" <> _ | _] = lines) do
    [ "<ul>" ]
    ++ Enum.map(lines, fn("* " <> line)-> "<li>#{inlines(line)}</li>" end)
    ++ [ "</ul>" ]
    |> Enum.join
  end

  defp process(lines) do
    lines
    |> Enum.map(&inlines/1)
    |> Enum.map(&headers/1)
  end

  defp headers(<<"# ", title::binary>>), do: "<h1>#{title}</h1>"
  defp headers(<<"## ", title::binary>>), do: "<h2>#{title}</h2>"
  defp headers(<<"### ", title::binary>>), do: "<h3>#{title}</h3>"
  defp headers(<<"#### ", title::binary>>), do: "<h4>#{title}</h4>"
  defp headers(<<"##### ", title::binary>>), do: "<h5>#{title}</h5>"
  defp headers(<<"###### ", title::binary>>), do: "<h6>#{title}</h6>"
  defp headers(markdown), do: "<p>#{markdown}</p>"

  defp inlines(markdown) do
    markdown
    |> String.replace("__", "<strong>", global: false)
    |> String.replace("__", "</strong>")
    |> String.replace("_", "<em>", global: false)
    |> String.replace("_", "</em>")
  end
end
