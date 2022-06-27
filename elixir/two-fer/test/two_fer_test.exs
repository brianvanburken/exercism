defmodule TwoFerTest do
  use ExUnit.Case

  test "no name given" do
    assert TwoFer.two_fer() == "One for you, one for me."
  end

  test "a name given" do
    assert TwoFer.two_fer("Alice") == "One for Alice, one for me."
  end

  test "another name given" do
    assert TwoFer.two_fer("Bob") == "One for Bob, one for me."
  end

  test "when the parameter is a number" do
    assert_raise FunctionClauseError, fn ->
      TwoFer.two_fer(10)
    end
  end

  test "when the parameter is an atom" do
    assert_raise FunctionClauseError, fn ->
      TwoFer.two_fer(:bob)
    end
  end

  test "when the parameter is a charlist" do
    assert_raise FunctionClauseError, fn ->
      refute TwoFer.two_fer('Jon Snow')
    end
  end
end
