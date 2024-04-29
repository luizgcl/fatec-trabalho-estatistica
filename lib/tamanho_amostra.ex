defmodule TamanhoAmostra do
  import Util
  import NivelConfianca

  def call(%{type: :proporcao}), do: handle_proporcao()
  def call(%{type: :media}), do: handle_media()

  defp handle_proporcao() do
    IO.puts("Digite o valor da proporção %: ")
    {porcentagem, _} = Integer.parse(IO.read(:stdio, :line))
    IO.puts("Digite o nível de confiança em %: ")
    {nivel_confianca, _} = Integer.parse(IO.read(:stdio, :line))
    IO.puts("Digite o valor da Margem de Erro em %: ")
    {erro, _} = Integer.parse(IO.read(:stdio, :line))

    proporcao(porcentagem, erro, nivel_confianca)
  end

  defp handle_media() do
    IO.puts("Digite o valor do Erro: ")
    {media_amostral, _} = Integer.parse(IO.read(:stdio, :line))
    IO.puts("Digite o valor do Desvio Padrão Populacional: ")
    {sigma, _} = Integer.parse(IO.read(:stdio, :line))
    IO.puts("Digite o nível de confiança em %: ")
    {nivel_confianca, _} = Integer.parse(IO.read(:stdio, :line))

    media(media_amostral, sigma, nivel_confianca)
  end

  defp media(desejavel, amostra, nivel_confianca) do
    z_alfa = get_nivel_confianca(nivel_confianca)

    n = to_round(z_alfa * amostra / desejavel)

    n
    |> :math.pow(2)
    |> ceil()
  end

  defp proporcao(populacao_porcentagem, margem_de_erro, nivel_confianca) do
    z_alfa = get_nivel_confianca(nivel_confianca)

    p = to_round(populacao_porcentagem / 100)
    p_comp = 1 - p

    n = :math.pow(z_alfa, 2) * p * p_comp / :math.pow(margem_de_erro / 100, 2)

    n
    |> ceil()
  end
end
