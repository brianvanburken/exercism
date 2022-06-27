defmodule NameBadge do
  def print(id, name, department), do:
    "#{get_id(id)}#{name}#{get_department(department)}"

  def get_id(nil), do: ""
  def get_id(id), do: "[#{id}] - "

  def get_department(nil), do: " - OWNER"
  def get_department(d), do: " - " <> String.upcase(d)
end
