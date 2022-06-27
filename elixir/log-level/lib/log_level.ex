defmodule LogLevel do
  def to_label(0, true), do: :unknown
  def to_label(5, true), do: :unknown

  def to_label(level, _) do
    case level do
      0 -> :trace
      1 -> :debug
      2 -> :info
      3 -> :warning
      4 -> :error
      5 -> :fatal
      _ -> :unknown
    end
  end

  def alert_recipient(4, _), do: :ops
  def alert_recipient(6, false), do: :dev2

  def alert_recipient(level, true) do
    case level do
      0 -> :dev1
      5 -> :dev1
      6 -> :dev1
      _ -> false
    end
  end

  def alert_recipient(level, false) do
    case level do
      5 -> :ops
      _ -> false
    end
  end
end
