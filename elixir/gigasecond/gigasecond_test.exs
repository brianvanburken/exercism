if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("gigasecond.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule GigasecondTest do
  use ExUnit.Case

  # @tag :pending
  test "from 4/25/2011" do
    assert Gigasecond.from({{2011, 4, 25}, {0, 0, 0}}) == {{2043, 1, 1}, {1, 46, 40}}
  end

  # @tag :pending
  test "from 6/13/1977" do
    assert Gigasecond.from({{1977, 6, 13}, {0, 0, 0}}) == {{2009, 2, 19}, {1, 46, 40}}
  end

  # @tag :pending
  test "from 7/19/1959" do
    assert Gigasecond.from({{1959, 7, 19}, {0, 0, 0}}) == {{1991, 3, 27}, {1, 46, 40}}
  end

  # @tag :pending
  test "yourself" do
    # customize these values for yourself
    your_birthday = {{1991, 9, 10}, {0, 0, 0}}
    assert Gigasecond.from(your_birthday) == {{2023, 5, 19}, {1, 46, 40}}
  end
end
