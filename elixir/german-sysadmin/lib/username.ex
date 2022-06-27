defmodule Username do
  mapping = %{?ä => 'ae', ?ö => 'oe', ?ü => 'ue', ?ß => 'ss'}

  def sanitize([]), do: []

  for {german, latin} <- mapping do
    def sanitize([unquote(german) | tail]), do: unquote(latin) ++ sanitize(tail)
  end

  def sanitize([?_ | tail]), do: '_' ++ sanitize(tail)
  def sanitize([c | tail]) when c >= ?a and c <= ?z, do: [c] ++ sanitize(tail)
  def sanitize([_ | tail]), do: [] ++ sanitize(tail)
end
