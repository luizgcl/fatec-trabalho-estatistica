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

  defp handle_statistic_function(0), do: handle_intervalo(%{type: :proporcao})
  defp handle_statistic_function(1), do: handle_intervalo(%{type: :media})
  defp handle_statistic_function(2), do: tamanho_amostra(%{type: :proporcao})
  defp handle_statistic_function(3), do: tamanho_amostra(%{type: :media})
  defp handle_statistic_function(9), do: :ok

  defp handle_statistic_function(_) do
    IO.puts("\n\n")
    IO.puts("[ERRO] Opção Inválida!")
    main()
  end

  # Intervalo de Confiança
  defp handle_intervalo(params) do
    {valor_menor, valor_maior} = IntervaloConfianca.call(params)
    IO.puts("IC=(#{valor_menor}; #{valor_maior})")

    IO.puts(" ")
    main()
  end

  # Tamanho da Amostra
  defp tamanho_amostra(params) do
    n = TamanhoAmostra.call(params)
    IO.puts("Tamanho da Amostra = #{n}")

    IO.puts(" ")
    main()
  end
end
