defmodule SecretHandshake do
  import Bitwise

  @masks [
    {0b00001, "wink"},
    {0b00010, "double blink"},
    {0b00100, "close your eyes"},
    {0b01000, "jump"}
  ]
  @reverse_mask 0b10000

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump
  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code), do: handshake(code)

  defp handshake(code, acc \\ [])
  defp handshake(0, acc), do: acc

  for {mask, label} <- @masks do
    defp handshake(code, acc) when (code &&& unquote(mask)) != 0,
      do: handshake(code &&& bnot(unquote(mask)), acc ++ [unquote(label)])
  end

  defp handshake(code, acc) when (code &&& unquote(@reverse_mask)) != 0,
    do: handshake(code &&& bnot(unquote(@reverse_mask)), Enum.reverse(acc))

  defp handshake(_, _), do: []
end
