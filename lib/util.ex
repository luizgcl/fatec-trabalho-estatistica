defmodule Util do
  def to_round(num) do
    round(num * 100) / 100
  end

  def convert_percentage(line) do
    line
    |> String.replace("%", "")
    |> Integer.parse()
  end
end
