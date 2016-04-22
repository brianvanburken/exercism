defmodule BracketPush do
  # This function pattern matches on each opening/closing tag by using tail
  # recursion. For each opening bracket its corresponding closing bracket is
  # pushed to the accumulator. When a closing bracket is encounter it gets
  # matched with the head of the accumulator. If this matches, it recurses
  # further. If an incorrect bracket is encountered it doesn't match it returns
  # false. If there is an unclosed bracket it ends up matching the second
  # function and returns false. If in the end all is well we end up
  # with and empty binary string and empty accumulator list. For this we return
  # true. The last function definition is used to skip unknown characters we do
  # not parse.
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(string, accumulator \\ [])
  def check_brackets("", []), do: true
  def check_brackets("",  _), do: false
  def check_brackets(<<x::binary-size(1), tail::binary>>, [ x | rest ]), do: check_brackets(tail, rest)
  for {open, close} <- [{"{", "}"}, {"[", "]"}, {"(", ")"}] do
    def check_brackets(unquote(open) <> tail, acc), do: check_brackets(tail, [unquote(close) | acc])
    def check_brackets(unquote(close) <> _tail,  _), do: false
  end
  def check_brackets(<<_::binary-size(1), tail::binary>>, acc), do: check_brackets(tail, acc)
end
