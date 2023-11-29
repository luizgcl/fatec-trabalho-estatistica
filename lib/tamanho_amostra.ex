defmodule TamanhoAmostra do
  import Util
  import NivelConfianca

  def media(desejavel, amostra, nivel_confianca) do
    z_alfa = get_nivel_confianca(nivel_confianca)

    n = to_round((z_alfa * amostra) / desejavel)

    n
    |> :math.pow(2)
    |> ceil()
  end

  def proporcao(populacao_porcentagem, margem_de_erro, nivel_confianca) do
    z_alfa = get_nivel_confianca(nivel_confianca)

    p = to_round(populacao_porcentagem / 100)
    p_comp = 1 - p

    n = (:math.pow(z_alfa, 2) * p * p_comp) / :math.pow((margem_de_erro / 100), 2)

    n
    |> ceil()
  end
end
