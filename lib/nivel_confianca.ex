defmodule NivelConfianca do

  def get_nivel_confianca(confianca) do
    confianca
    |> nivel_confianca()
  end

  defp nivel_confianca(90), do: 1.645
  defp nivel_confianca(95), do: 1.96
  defp nivel_confianca(99), do: 2.576
  defp nivel_confianca(_), do: "Não suportado. Utilize: 90, 95 ou 99"
end
