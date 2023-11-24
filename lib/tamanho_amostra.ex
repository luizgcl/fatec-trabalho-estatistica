defmodule TamanhoAmostra do
  import NivelConfianca

  def media(desejavel, amostra, nivel_confianca) do
    z_alfa = get_nivel_confianca(nivel_confianca)

    n = ceil(:math.pow((z_alfa * amostra) / desejavel, 2))

    n
  end

  def proporcao(populacao_porcentagem, margem_de_erro, nivel_confianca) do
    z_alfa = get_nivel_confianca(nivel_confianca)

    p = populacao_porcentagem / 100
    p_comp = 1 - p

    n = (:math.pow(z_alfa, 2) * p * p_comp) / :math.pow((margem_de_erro / 100), 2)

    n
    |> ceil()
  end
end
