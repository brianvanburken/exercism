defmodule Grains do
  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer) :: pos_integer
  # This calculates the values for each square on compile time. This reduces the
  # fetching of a value only to a function lookup. This improves runtime
  # performance (which happens multiple times) in favor of decreased compile
  # time (which is done only once). The calculations are returned and summed up
  # from which the total method is generated. This is done so the total function
  # just returns the total and doesn't have to calculate the total on runtime.
  # With all this the bonus points are achieved!
  sum = for n <- 1..64 do
    calculation = :math.pow(2, n - 1) |> round
    def square(unquote(n)), do: unquote(calculation)
    calculation
  end |> Enum.sum

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: pos_integer
  def total, do: unquote(sum)
end
