defmodule TrabalhoFinal do

  def main() do
    IO.puts("Trabalho Final - Estatística")
    IO.puts("======================================")
    IO.puts("Alunos: Luiz Gustavo e Lucas Fernando")
    IO.puts("======================================")
    IO.puts("[0] Intervalo de Confiança por Proporção")
    IO.puts("[1] Intervalo de Confiança por Média")
    IO.puts("[2] Tamanho da Amostra por Proporção")
    IO.puts("[3] Tamanho da Amostra por Média\n")
    IO.puts("[9] Sair do Programa")
    IO.puts("======================================")
    IO.puts("Informe qual das funções acima você quer utilizar:")
    {option, _} = Integer.parse(IO.read(:stdio, :line))

    option
    |> handle_statistic_function()
  end

  defp handle_statistic_function(0), do: intervalo_confianca_proporcao()
  defp handle_statistic_function(1), do: intervalo_confianca_media()
  defp handle_statistic_function(2), do: tamanho_amostra_proporcao()
  defp handle_statistic_function(3), do: tamanho_amostra_media()
  defp handle_statistic_function(9), do: :ok
  defp handle_statistic_function(_) do
    IO.puts("\n\n")
    IO.puts("[ERRO] Opção Inválida!")
    main()
  end

  # Proporção
  defp intervalo_confianca_proporcao() do
    IO.puts("Informe o Número de Sucesso: ")
    {amostra, _} = Integer.parse(IO.read(:stdio, :line))
    IO.puts("Informe o Tamanho da Amostra: ")
    {populacao, _} = Integer.parse(IO.read(:stdio, :line))
    IO.puts("Informe o Nível de Confiança em %: ")
    {nivel_confianca, _} = Integer.parse(IO.read(:stdio, :line))

    {valor_menor, valor_maior} = IntervaloConfianca.proporcao(amostra, populacao, nivel_confianca)
    IO.puts("IC=(#{valor_menor}; #{valor_maior})")

    IO.puts(" ")
    main()
  end

  # Média
  defp intervalo_confianca_media() do
    IO.puts("Informe o Tamanho da Amostra: ")
    {amostra, _} = Integer.parse(IO.read(:stdio, :line))
    IO.puts("Informe a Média: ")
    {media, _} = Float.parse(IO.read(:stdio, :line))
    IO.puts("Informe o Desvio Padrão: ")
    {desvio, _} = Float.parse(IO.read(:stdio, :line))
    IO.puts("Informe o Nível de Confiança em %: ")
    {nivel_confianca, _} = Integer.parse(IO.read(:stdio, :line))

    {valor_menor, valor_maior} = IntervaloConfianca.media(amostra, media, desvio, nivel_confianca)

    IO.puts("IC=(#{valor_menor}; #{valor_maior})")

    IO.puts(" ")
    main()
  end

  # Média
  defp tamanho_amostra_media() do
    IO.puts("Digite o valor da media amostral: ")
    {media_amostral, _} = Integer.parse(IO.read(:stdio, :line))
    IO.puts("Digite o valor do Desvio Padrão Populacional: ")
    {sigma, _} = Integer.parse(IO.read(:stdio, :line))
    IO.puts("Digite o nível de confiança em %: ")
    {nivel_confianca, _} = Integer.parse(IO.read(:stdio, :line))

    n = TamanhoAmostra.media(media_amostral, sigma, nivel_confianca)
    IO.puts("R=#{n}")

    IO.puts(" ")
    main()
  end

  # Proporção
  defp tamanho_amostra_proporcao() do
    IO.puts("Digite o valor da proporção %: ")
    {porcentagem, _} = Integer.parse(IO.read(:stdio, :line))
    IO.puts("Digite o nível de confiança em %: ")
    {nivel_confianca, _} = Integer.parse(IO.read(:stdio, :line))
    IO.puts("Digite o valor da Margem de Erro em %: ")
    {erro, _} = Integer.parse(IO.read(:stdio, :line))

    n = TamanhoAmostra.proporcao(porcentagem, erro, nivel_confianca)
    IO.puts("R=#{n}")

    IO.puts(" ")
    main()
  end
end
