defmodule TrabalhoFinal do
  import IntervaloConfianca
  import TamanhoAmostra

  def intervalo_confianca() do
    {valor_menor, valor_maior} = calcular_intervalo_confianca(465, 500, 95)
    IO.puts("IC=(#{valor_menor}; #{valor_maior})")
  end

  def tamanho_amostra() do
    n = calcular_tamanho_amostra(100, 1250, 99)
    IO.puts("TA=#{n}")
  end
end
