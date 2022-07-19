defmodule SumOfMultiplesTest do
  use ExUnit.Case

  test "no multiples within limit" do
    assert SumOfMultiples.to(1, [3, 5]) == 0
  end

  test "one factor has multiples within limit" do
    assert SumOfMultiples.to(4, [3, 5]) == 3
  end

  test "more than one multiple within limit0" do
    assert SumOfMultiples.to(7, [3]) == 9
  end

  test "more than one factor with multiples within limit" do
    assert SumOfMultiples.to(10, [3, 5]) == 23
  end

  test "each multiple is only counted once" do
    assert SumOfMultiples.to(100, [3, 5]) == 2318
  end

  test "a much larger limit" do
    assert SumOfMultiples.to(1000, [3, 5]) == 233_168
  end

  test "three factors" do
    multiples = [7, 13, 17]
    assert SumOfMultiples.to(20, multiples) == 51
  end

  test "factors not relatively prime" do
    multiples = [4, 6]
    assert SumOfMultiples.to(15, multiples) == 30
  end

  test "some pairs of factors relatively prime and some not" do
    multiples = [5, 6, 8]
    assert SumOfMultiples.to(150, multiples) == 4419
  end

  test "one factor is a multiple of another" do
    multiples = [5, 25]
    assert SumOfMultiples.to(51, multiples) == 275
  end

  test "much larger factors" do
    multiples = [43, 47]
    assert SumOfMultiples.to(10000, multiples) == 2_203_160
  end

  test "all numbers are multiples of 1" do
    multiples = [1]
    assert SumOfMultiples.to(100, multiples) == 4950
  end

  test "no factors means an empty sum" do
    multiples = []
    assert SumOfMultiples.to(10000, multiples) == 0
  end

  test "the only multiple of 0 is 0" do
    multiples = [0]
    assert SumOfMultiples.to(1, multiples) == 0
  end

  test "the factor 0 does not affect the sum of multiples of other factors" do
    multiples = [3, 0]
    assert SumOfMultiples.to(4, multiples) == 3
  end

  test "solutions using include-exclude must extend to cardinality greater than 3" do
    multiples = [2, 3, 5, 7, 11]
    assert SumOfMultiples.to(10000, multiples) == 39_614_537
  end
end
