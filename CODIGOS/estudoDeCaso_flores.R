# ==============================================================================
#                         CLASSIFICAÇÃO DE FLORES - IRIS DATASET
# ==============================================================================
    # Diferente do caso um, esse caso usaremos uma biblioteca padrao do R.
    # Basta usar um data(iris) para acessar :)
    
    
    # Pacote para visualização de graficos:
    # install.packages("ggplot2")
    library(ggplot2)
    
    
    # ===================================================================
    # INTRODUCAO
    # ===================================================================
    # CASO DOIS. Adentrando na exploracao, criaremos graficos mais complexos!


    # ===================================================================
    # 1. Preparação dos Dados
    # ===================================================================
    set.seed(20102003)             # Semente para aleatoriedade controlada
    data(iris)                     # Carregando o dataset 'iris'
    View(iris)                     # Visualização da tabela completa
    iris <- iris[sample(nrow(iris)), ]  # Embaralhando linhas
    
    # Definindo divisão de treino e teste
    n <- round(0.8 * nrow(iris))   # 80% para treino
    treino <- iris[1:n, ]          # Conjunto de treino
    teste <- iris[-(1:n), ]        # Conjunto de teste

        
    # ===================================================================
    # 2. Visualização dos Dados
    # ===================================================================
    
    # 2.1 Gráfico de Barra: Contagem de Espécies no Treino
    ggplot(treino, aes(x = Species)) +
      geom_bar() +
      labs(title = "Contagem das Espécies no Conjunto de Treino")
    
    # 2.2 Histograma: Distribuição do Comprimento das Pétalas
    ggplot(treino, aes(x = Petal.Length)) +
      geom_histogram(bins = 20, fill = "pink") +
      theme_minimal() +
      labs(title = "Distribuição do Comprimento das Pétalas",
           x = "Comprimento da Pétala", y = "Frequência")
    
    # 2.3 BoxPlot Vertical: Comprimento das Pétalas por Espécie
    ggplot(treino, aes(y = Petal.Length)) +
      geom_boxplot(outlier.color = "red", fill = "green") +
      facet_wrap(~Species) +
      labs(title = "BoxPlot do Comprimento das Pétalas por Espécie",
           y = "Comprimento da Pétala")
    
    
    # Resumo estatístico do comprimento das pétalas
    summary(treino$Petal.Length)    # Exibe o resumo do BoxPlot
    
    
    
    # ===================================================================
    # 3. Estrutura e BoxPlot de Variáveis Numéricas
    # ===================================================================
    str(iris)   # Estrutura do conjunto de dados
    
    # 3.1 BoxPlot de Comprimento e Largura das Sépalas e Pétalas
    variaveis <- list("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")
    for (var in variaveis) {
      ggplot(treino, aes_string(y = var)) +
        geom_boxplot(outlier.color = "red", fill = "green") +
        facet_wrap(~Species) +
        labs(title = paste("BoxPlot de", var, "por Espécie"), y = var)
    }
    
    # 3.2 Gráfico de Dispersão: Relação entre Comprimento e Largura das Pétalas
    ggplot(treino, aes(x = Petal.Length, y = Petal.Width, color = Species)) +
      geom_point() +
      labs(title = "Relação entre Comprimento e Largura das Pétalas", x = "Comprimento da Pétala", y = "Largura da Pétala")
    
    
    
    # ===================================================================
    # 4. Classificação das Espécies
    # ===================================================================
    
    # Classificação manual baseada em Comprimento e Largura das Pétalas
    resultados <- character(nrow(teste))  # Inicializando vetor de previsões
    
    for (j in 1:nrow(teste)) {
      if (teste$Petal.Length[j] < 2.5) {
        resultados[j] <- "setosa"
      } else if (teste$Petal.Width[j] < 1.75) {
        resultados[j] <- "versicolor"
      } else {
        resultados[j] <- "virginica"
      }
    }
    
    # Atribuindo previsões e calculando taxa de acerto
    teste$Previsao <- resultados
    taxa_acerto <- mean(teste$Species == teste$Previsao) # Comparação entre previsões e valores reais
    print(paste("Taxa de acerto: ", taxa_acerto))
    
    
    # ===================================================================
    # Conclusão
    # ===================================================================
    # Exploramos mais graficos, e aprendemos uma forma de classificar.
    # Fizemos de forma manual, com base no que analisamos ao decorrer
    # do algoritmo.