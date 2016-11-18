defmodule Forth do
  @opaque evaluator :: any

  defstruct stack: [],
    definitions: %{},
    defining_word: false,
    current_word: nil,
    substituting_word: nil

  @doc """
  Create a new evaluator.
  """
  @spec new() :: evaluator
  def new(), do: %Forth{}

  @doc """
  Evaluate an input string, updating the evaluator state.
  """
  @spec eval(evaluator, String.t) :: evaluator
  def eval(%Forth{} = ev, s) do
    s
    # Split on anything that's not a letter, number, punctuation, or symbol
    |> String.split(~r/[^\p{L}\p{N}\p{P}\p{S}]/u, trim: true)
    |> Enum.map(&parse_int/1) # convert what we can to ints
    |> evaluate(ev)
  end

  defp evaluate([], %Forth{} = ev), do: ev

  # Until Elixir/Erlang support matching maps in function definitions,
  # had to add struct field for whether instruction was in definitions
  defp evaluate([instruction | tail], %Forth{defining_word: false, substituting_word: nil, definitions: definitions} = ev) do
    evaluate([instruction | tail], %Forth{ev | substituting_word: Map.has_key?(definitions, instruction)})
  end

  # Substitute a custom defined word with its instructions
  defp evaluate([instruction | tail], %Forth{substituting_word: true, definitions: definitions} = ev) do
    evaluate(Map.get(definitions, instruction) ++ tail, %Forth{ev | substituting_word: nil})
  end

  # Basic arithmetic
  defp evaluate([":", num | _], _) when is_number(num), do: raise Forth.InvalidWord
  defp evaluate([":", word | tail], %Forth{} = ev) when is_binary(word), do: evaluate(tail, %Forth{ ev | defining_word: true, current_word: word }, [])
  defp evaluate(["+" | tail], %Forth{stack: [opt2, op1 | stack]} = ev) when is_integer(op1) and is_integer(opt2), do: evaluate(tail, %Forth{ ev | stack: [op1 + opt2 | stack]})
  defp evaluate(["-" | tail], %Forth{stack: [opt2, op1 | stack]} = ev) when is_integer(op1) and is_integer(opt2), do: evaluate(tail, %Forth{ ev | stack: [op1 - opt2 | stack]})
  defp evaluate(["*" | tail], %Forth{stack: [opt2, op1 | stack]} = ev) when is_integer(op1) and is_integer(opt2), do: evaluate(tail, %Forth{ ev | stack: [op1 * opt2 | stack]})
  defp evaluate(["/" | _], %Forth{stack: [0, op1 | _]}) when is_integer(op1), do: raise Forth.DivisionByZero
  defp evaluate(["/" | tail], %Forth{stack: [opt2, op1 | stack]} = ev) when is_integer(op1) and is_integer(opt2), do: evaluate(tail, %Forth{ ev | stack: [div(op1, opt2) | stack]})

  # Built-in commands
  defp evaluate(["DUP" | tail], %Forth{stack: [op1 | stack]} = ev) when is_integer(op1), do: evaluate(tail, %Forth{ ev | stack: [op1, op1 | stack]})
  defp evaluate(["DUP" | _], _), do: raise Forth.StackUnderflow
  defp evaluate(["DROP" | tail], %Forth{stack: [op1 | stack]} = ev) when is_integer(op1), do: evaluate(tail, %Forth{ ev | stack: stack})
  defp evaluate(["DROP" | _], _), do: raise Forth.StackUnderflow
  defp evaluate(["SWAP" | tail], %Forth{stack: [op2, op1 | stack]} = ev) when is_integer(op1) and is_integer(op2), do: evaluate(tail, %Forth{ ev | stack: [op1, op2 | stack]})
  defp evaluate(["SWAP" | _], _), do: raise Forth.StackUnderflow
  defp evaluate(["OVER" | tail], %Forth{stack: [op2, op1 | stack]} = ev) when is_integer(op1) and is_integer(op2), do: evaluate(tail, %Forth{ ev | stack: [op1, op2, op1 | stack]})
  defp evaluate(["OVER" | _], _), do: raise Forth.StackUnderflow

  # Just push numbers onto the stack, or raise errors if undefined word given
  defp evaluate([head | tail], %Forth{} = ev) when is_number(head), do: evaluate(tail, %Forth{ev | stack: [head | ev.stack], substituting_word: nil})
  defp evaluate([head | _], _) when is_binary(head), do: raise Forth.UnknownWord

  # Defining custom words
  defp evaluate([";" | tail], %Forth{defining_word: true, current_word: word} = ev, definition) do
    evaluate(tail, %Forth{ ev | defining_word: false, current_word: nil, definitions: ev.definitions |> Map.put(word, definition |> Enum.reverse), substituting_word: nil })
  end
  defp evaluate([instruction | tail], %Forth{defining_word: true} = ev, definition), do: evaluate(tail, ev, [instruction | definition])

  defp parse_int(s), do: try_parsing_integer(s, Integer.parse(s))
  defp try_parsing_integer(s, :error), do: s |> String.upcase
  defp try_parsing_integer(_, {int, ""}), do: int
  defp try_parsing_integer(s, _), do: s |> String.upcase

  @doc """
  Return the current stack as a string with the element on top of the stack
  being the rightmost element in the string.
  """
  @spec format_stack(evaluator) :: String.t
  def format_stack(%Forth{stack: stack}), do: stack |> Enum.reverse() |> Enum.join(" ")

  defmodule StackUnderflow do
    defexception []
    def message(_), do: "stack underflow"
  end

  defmodule InvalidWord do
    defexception [word: nil]
    def message(e), do: "invalid word: #{inspect e.word}"
  end

  defmodule UnknownWord do
    defexception [word: nil]
    def message(e), do: "unknown word: #{inspect e.word}"
  end

  defmodule DivisionByZero do
    defexception []
    def message(_), do: "division by zero"
  end
end
