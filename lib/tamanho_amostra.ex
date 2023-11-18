defmodule TamanhoAmostra do
  import NivelConfianca

  def calcular_tamanho_amostra(desejavel, amostra, nivel_confianca) do
    nivel_confianca = get_nivel_confianca(nivel_confianca)

    n = ceil(:math.pow((nivel_confianca * amostra) / desejavel, 2))

    n
  end
end
