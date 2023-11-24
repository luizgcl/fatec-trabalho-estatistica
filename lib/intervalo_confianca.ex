defmodule IntervaloConfianca do
  import Float
  import NivelConfianca

  def media(tamanho_da_amostra, media, desvio_padrao, nivel_confianca) do
    z_alfa = get_nivel_confianca(nivel_confianca)

    n = floor(z_alfa * (desvio_padrao / :math.sqrt(tamanho_da_amostra)), 2)

    valor_maior = media + n
    valor_menor = media - n

    {valor_menor, valor_maior}
  end

  def proporcao(amostra, populacao, nivel_confianca) do
    p = amostra / populacao
    p_comp = 1 - p
    z_alfa = get_nivel_confianca(nivel_confianca)

    margem_de_erro = floor(z_alfa * :math.sqrt(p * p_comp / populacao), 2)

    valor_menor = floor(p - margem_de_erro, 2)
    valor_maior = floor(p + margem_de_erro, 2)

    {valor_menor, valor_maior}
  end
end
