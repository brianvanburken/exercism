defmodule Lasagna do
  def expected_minutes_in_oven(), do: 40

  # Please define the 'remaining_minutes_in_oven/1' function
  def remaining_minutes_in_oven(time_in_oven) do
    expected_minutes_in_oven() - time_in_oven
  end

  def preparation_time_in_minutes(amount_of_layers) do
    2 * amount_of_layers
  end

  # Please define the 'total_time_in_minutes/2' function
  def total_time_in_minutes(amount_of_layers, time_in_oven) do
    preparation_time_in_minutes(amount_of_layers) + time_in_oven
  end

  # Please define the 'alarm/0' function
  def alarm do
    "Ding!"
  end
end
