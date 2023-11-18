defmodule IntervaloConfianca do
  import Float
  import NivelConfianca

  def calcular_intervalo_confianca(amostra, populacao, nivel_confianca) do
    p = amostra / populacao
    p_comp = 1 - p
    z_alfa = get_nivel_confianca(nivel_confianca)

    margem_de_erro = floor(z_alfa * :math.sqrt(p * p_comp / populacao), 2)

    valor_menor = floor(p - margem_de_erro, 2)
    valor_maior = floor(p + margem_de_erro, 2)

    {valor_menor, valor_maior}
  end
end
