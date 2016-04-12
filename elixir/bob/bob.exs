defmodule Teenager do
  def hey(input) do
    respond(
      String.strip(input) === "",
      String.upcase(input) === input && String.downcase(input) !== input,
      String.ends_with?(input, "?")
    )
  end

  # This matches based on the conditions. I've chosen to not be like the rest of
  # the solutions and limited myself to not use cond or case. I did some
  # benchmarks and found out that this pattern matching is more performant. The
  # performance difference is nihil. Below the numbers of the benchmark:
  # parameters 1.27 µs/op
  # cond       1.32 µs/op
  defp respond(true, _, _), do: "Fine. Be that way!"
  defp respond(_, true, _), do: "Whoa, chill out!"
  defp respond(_, _, true), do: "Sure."
  defp respond(_, _, _),    do: "Whatever."
end
