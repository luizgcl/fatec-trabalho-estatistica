defmodule TrabalhoFinal do
  import IntervaloConfianca
  import TamanhoAmostra

  # Proporção
  def intervalo_confianca() do
    IO.puts("Digite o valor da amostra: ")
    {amostra, _} = Integer.parse(IO.read(:stdio, :line))
    IO.puts("Digite o valor da população: ")
    {populacao, _} = Integer.parse(IO.read(:stdio, :line))
    IO.puts("Digite o nível de confiança em %: ")
    {nivel_confianca, _} = Integer.parse(IO.read(:stdio, :line))

    {valor_menor, valor_maior} = calcular_intervalo_confianca(amostra, populacao, nivel_confianca)
    IO.puts("IC=(#{valor_menor}; #{valor_maior})")
  end

  #Proporção
  def tamanho_amostra() do
    IO.puts("Digite o valor da media amostral: ")
    {media_amostral, _} = Integer.parse(IO.read(:stdio, :line))
    IO.puts("Digite o valor do Desvio Padrão Populacional: ")
    {sigma, _} = Integer.parse(IO.read(:stdio, :line))
    IO.puts("Digite o nível de confiança em %: ")
    {nivel_confianca, _} = Integer.parse(IO.read(:stdio, :line))

    n = calcular_tamanho_amostra(media_amostral, sigma, nivel_confianca)
    IO.puts("TA=#{n}")
  end
end
