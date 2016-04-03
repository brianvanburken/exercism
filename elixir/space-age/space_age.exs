defmodule SpaceAge do
  @year_in_seconds_on_earth 31_557_600
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(:earth,   seconds), do: (seconds / @year_in_seconds_on_earth) / 1.00000000
  def age_on(:mercury, seconds), do: (seconds / @year_in_seconds_on_earth) / 0.24084670
  def age_on(:venus,   seconds), do: (seconds / @year_in_seconds_on_earth) / 0.61519726
  def age_on(:mars,    seconds), do: (seconds / @year_in_seconds_on_earth) / 1.88081580
  def age_on(:jupiter, seconds), do: (seconds / @year_in_seconds_on_earth) / 11.8626150
  def age_on(:saturn,  seconds), do: (seconds / @year_in_seconds_on_earth) / 29.447498
  def age_on(:uranus,  seconds), do: (seconds / @year_in_seconds_on_earth) / 84.016846
  def age_on(:neptune, seconds), do: (seconds / @year_in_seconds_on_earth) / 164.79132
end
