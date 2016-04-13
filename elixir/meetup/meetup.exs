defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @weekdays [
    {:monday, 1}, {:tuesday, 2}, {:wednesday, 3}, {:thursday, 4}, {:friday, 5},
    {:saturday, 6}, {:sunday, 7}
  ]
  @schedules [
    {:first, 1}, {:second, 8}, {:third, 15}, {:fourth, 22}, {:teenth, 13}
  ]

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  # Generate for each schedule a function that passes the correct values. These
  # functions are added on compile time. This doesn't require extra lookups and
  # is easably extensible by adding new schedules to module registery @schedules.
  # The :first, :second, :third, :fourth, :teenth are fixed offsets from the
  # first day of the month (which is always 1). That is why those are generated
  # and :last isn't.
  for {schedule, start} <- @schedules do
    def meetup(year, month, weekday, unquote(schedule)),
      do: calculate(year, month, unquote(start), weekday)
  end
  # For the last day of the month a separate function is added since this is a
  # relative day depending on the length of the given month.
  def meetup(year, month, weekday, :last),
    do: calculate(year, month, start_of_last_week(year, month), weekday)

  # Generate for each weekday a function that calculates the offset depending on
  # the day of the week. The day of the week starts on monday with 1 and ends on
  # sunday with 7. Taken that the weekday is monday and the schedule is the
  # second monday of the month the values are 1 for the monday and 8 for the
  # start_day. Using the :calendar module from Erlang it fetches the day of the
  # week for the start day, which returns between 1 for monday to 7 for sunday.
  # This weekday number is then subtracted from the weekday number asked. This
  # offset is then passed along to be added to the start day.
  for {weekday, number} <- @weekdays do
    defp calculate(year, month, start_day, unquote(weekday)) do
      offset = unquote(number) - :calendar.day_of_the_week(year, month, start_day)
      add_offset(year, month, start_day, offset)
    end
  end

  # Adds the offset to the startday. If the offset is negative it adds a week.
  defp add_offset(year, month, start_day, offset)
    when offset < 0,
    do: {year, month, start_day + offset + 7}
  defp add_offset(year, month, start_day, offset),
    do: {year, month, start_day + offset}

  # Given the year and month it calculates the last weekday exactly one week
  # before the last day of a month. For example: if the last day of the month
  # falls on a wedness day it calculates back to thursday the week before. It
  # uses the :calendar module from Erlang to fetch the last day of the month.
  defp start_of_last_week(year, month),
    do: :calendar.last_day_of_the_month(year, month) - 6
end
