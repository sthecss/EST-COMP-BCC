# ==============================================================================
#                   CLASSIFICAÇÃO DE PINGUINS - PeNGUINs DATASET
# ==============================================================================
    # Este tutorial tem como objetivo construir um modelo de classificação usando KNN,
    # capaz de prever a espécie de um pinguim a partir de suas características físicas,
    # como peso, tamanho da asa, comprimento e profundidade do bico.
    
    # Pacote para visualização: ggplot2
    # install.packages("ggplot2")
    library(ggplot2)
    
    # Pacote para termos os dados: palmerpenguins
    # install.packages("palmerpenguins")
    library(palmerpenguins)


    # ===================================================================
    # INTRODUCAO
    # ===================================================================
    # CASO TRES. Adentrando formalismos, e aprendendo sobre KNN, um modelo
    # de classificacao.


    
    # ==============================================================================
    # 1. Preparando o Conjunto de Dados
    # ==============================================================================
    
    # Carregando o conjunto de dados "penguins" e explorando sua estrutura inicial
    pinguins <- penguins
    str(pinguins)
    summary(pinguins)
    
    # Removendo valores faltantes para garantir uma análise consistente
    pinguins <- na.omit(pinguins)
    summary(pinguins)
    
    
    # ==============================================================================
    # 2. Divisão do Conjunto em Treino e Teste
    # ==============================================================================
    
    # Configurando uma semente para garantir reprodutibilidade e embaralhando os dados
    set.seed(20240823)
    pinguins <- pinguins[sample(nrow(pinguins)),]
    
    # Definindo 80% dos dados para treino e 20% para teste
    n <- round(0.8 * nrow(pinguins))
    treino <- pinguins[1:n, ]
    teste <- pinguins[-(1:n), ]
    
    
    # ==============================================================================
    # 3. Visualização dos Dados
    # ==============================================================================
    
    # 3.1 Boxplot: Distribuição do Tamanho da Asa por Espécie
    ggplot(treino, aes(x = species, y = flipper_length_mm)) +
      geom_boxplot(outlier.color = "red", fill = "green") +
      labs(title = "Distribuição do Tamanho da Asa por Espécie",
           x = "Espécie",
           y = "Tamanho da Asa (mm)") +
      theme_minimal()
    
    # 3.2 Gráfico de Dispersão: Peso vs Comprimento do Bico por Espécie
    ggplot(treino, aes(x = body_mass_g, y = bill_length_mm, color = species)) +
      geom_point() +
      labs(title = "Peso vs Comprimento do Bico",
           x = "Peso (g)",
           y = "Comprimento do Bico (mm)") +
      theme_minimal()
    
    
    # ==============================================================================
    # 4. Classificação do Primeiro Pinguim do Conjunto de Teste (KNN)
    # ==============================================================================
    
    # Calculando a distância euclidiana entre o primeiro pinguim do conjunto de
    # teste e cada pinguim do conjunto de treino
    distancias <- numeric(nrow(treino))
    
    for (k in 1:nrow(treino)) {
      distancias[k] <- sqrt((teste$body_mass_g[1] - treino$body_mass_g[k])^2 +
                              (teste$bill_length_mm[1] - treino$bill_length_mm[k])^2)
    }
    
    # Exibindo as distâncias calculadas
    distancias
    
    
    
    # ===================================================================
    # Conclusão
    # ===================================================================
    # Aprendemos sobre KNN! No caso 4 iremos avancar para algo tao (ou mais)
    # babadeiro.