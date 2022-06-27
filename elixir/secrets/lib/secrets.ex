defmodule Secrets do
  def secret_add(secret) do
    fn addition -> addition + secret end
  end

  def secret_subtract(secret) do
    fn subtraction -> subtraction - secret end
  end

  def secret_multiply(secret) do
    fn multi -> multi * secret end
  end

  def secret_divide(secret) do
    fn dividend -> div(dividend, secret) end
  end

  def secret_and(secret) do
    fn left -> Bitwise.band(left, secret) end
  end

  def secret_xor(secret) do
    fn left -> Bitwise.bxor(left, secret) end
  end

  def secret_combine(secret_function1, secret_function2) do
    fn n -> secret_function2.(secret_function1.(n)) end
  end
end
