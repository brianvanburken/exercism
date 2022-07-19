defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter | :saturn | :neptune | :uranus

  @year_in_seconds_on_earth 31_557_600
  @ratios [
    {:earth, 1.00000000},
    {:mercury, 0.24084670},
    {:venus, 0.61519726},
    {:mars, 1.88081580},
    {:jupiter, 11.8626150},
    {:saturn, 29.447498},
    {:uranus, 84.016846},
    {:neptune, 164.79132}
  ]

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  # This generates for each ratio a function that matches on the planet. This is
  # done on compile time. To add more planets it's a easy as adding a new ratio
  # tuple to the @ratios module attribute and compile.
  for {planet, ratio} <- @ratios do
    def age_on(unquote(planet), seconds) do
      {:ok, seconds / unquote(@year_in_seconds_on_earth) / unquote(ratio)}
    end
  end

  def age_on(_, _), do: {:error, "not a planet"}
end

