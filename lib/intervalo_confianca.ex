defmodule IntervaloConfianca do
  import Util
  import NivelConfianca

  def call(%{type: :proporcao}), do: handle_proporcao()
  def call(%{type: :media}), do: handle_media()

  defp handle_proporcao() do
    IO.puts("Informe o Número de Sucesso: ")
    line = IO.read(:stdio, :line)

    amostra =
      case String.contains?(line, "%") do
        true ->
          {amostra, _} = convert_percentage(line)
          amostra / 100

        false ->
          {amostra, _} = Integer.parse(line)
          amostra
      end

    IO.puts("Informe o Tamanho da Amostra: ")
    {populacao, _} = Integer.parse(IO.read(:stdio, :line))

    amostra =
      if amostra < 1 do
        populacao * amostra
      else
        amostra
      end

    IO.puts("Informe o Nível de Confiança em %: ")
    {nivel_confianca, _} = Integer.parse(IO.read(:stdio, :line))

    proporcao(amostra, populacao, nivel_confianca)
  end

  defp handle_media() do
    IO.puts("Informe o Tamanho da Amostra: ")
    {amostra, _} = Integer.parse(IO.read(:stdio, :line))
    IO.puts("Informe a Média: ")
    {media, _} = Float.parse(IO.read(:stdio, :line))
    IO.puts("Informe o Desvio Padrão: ")
    {desvio, _} = Float.parse(IO.read(:stdio, :line))
    IO.puts("Informe o Nível de Confiança em %: ")
    {nivel_confianca, _} = Integer.parse(IO.read(:stdio, :line))

    media(amostra, media, desvio, nivel_confianca)
  end

  defp media(tamanho_da_amostra, media, desvio_padrao, nivel_confianca) do
    z_alfa = get_nivel_confianca(nivel_confianca)
    IO.inspect("z_alfa = #{z_alfa}")

    erro = to_round(z_alfa * (desvio_padrao / :math.sqrt(tamanho_da_amostra)))
    IO.inspect("Margem de Erro = #{erro}")

    valor_menor = to_round(media - erro)
    valor_maior = to_round(media + erro)

    {valor_menor, valor_maior}
  end

  defp proporcao(amostra, populacao, nivel_confianca) do
    p = to_round(amostra / populacao)
    IO.inspect("p = #{p}")
    p_comp = 1 - p
    IO.inspect("(1 - p) = #{p_comp}")

    z_alfa = get_nivel_confianca(nivel_confianca)
    IO.inspect("z_alfa = #{z_alfa}")

    erro = to_round(z_alfa * :math.sqrt(p * p_comp / populacao))
    IO.inspect("Margem de Erro = #{erro}")

    valor_menor = to_round(p - erro)
    valor_maior = to_round(p + erro)

    {valor_menor, valor_maior}
  end
end
