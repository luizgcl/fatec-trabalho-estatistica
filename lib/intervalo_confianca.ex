defmodule IntervaloConfianca do
  import Util
  import NivelConfianca

  @spec media(number(), number(), number(), any()) :: {float(), float()}
  def media(tamanho_da_amostra, media, desvio_padrao, nivel_confianca) do
    z_alfa = get_nivel_confianca(nivel_confianca)
    IO.inspect("z_alfa = #{z_alfa}")

    erro = to_round(z_alfa * (desvio_padrao / :math.sqrt(tamanho_da_amostra)))
    IO.inspect("margem_de_erro = #{erro}")

    valor_menor = to_round(media - erro)
    valor_maior = to_round(media + erro)

    {valor_menor, valor_maior}
  end

  def proporcao(amostra, populacao, nivel_confianca) do
    p = to_round(amostra / populacao)
    IO.inspect("p = #{p}")
    p_comp = 1 - p
    IO.inspect("(1 - p) = #{p_comp}")

    z_alfa = get_nivel_confianca(nivel_confianca)
    IO.inspect("z_alfa = #{z_alfa}")


    erro = to_round(z_alfa * :math.sqrt((p * p_comp) / populacao))
    IO.inspect("Margem de Erro = #{erro}")

    valor_menor = to_round(p - erro);
    valor_maior = to_round(p + erro);

    {valor_menor, valor_maior}
  end
end
