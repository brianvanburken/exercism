defmodule AcronymTest do
  use ExUnit.Case

  test "it produces acronyms from title case" do
    assert Acronym.abbreviate("Portable Networks Graphic") === "PNG"
  end

  test "it produces acronyms from lower case" do
    assert Acronym.abbreviate("Ruby on Rails") === "ROR"
  end

  test "it ignores punctuation" do
    assert Acronym.abbreviate("First in, First out") === "FIFO"
  end

  test "it produces acronyms from phrases with acronyms" do
    assert Acronym.abbreviate("GNU Image Manipulation Program") === "GIMP"
  end

  test "it produces acronyms ignoring punctuation and casing" do
    assert Acronym.abbreviate("Complementary Metal-Oxide semiconductor") === "CMOS"
  end

  test "it produces a very long abbreviation" do
    assert Acronym.abbreviate(
             "Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me"
           ) === "ROTFLSHTMDCOALM"
  end

  test "it produces acronyms from phrases with consecutive delimiters" do
    assert Acronym.abbreviate("Something - I made up from thin air") === "SIMUFTA"
  end

  test "it produces acronyms from phrases with apostrophes" do
    assert Acronym.abbreviate("Halley's Comet") === "HC"
  end

  test "it produces acronyms from phrases with underscore emphasis" do
    assert Acronym.abbreviate("The Road _Not_ Taken") === "TRNT"
  end
end
