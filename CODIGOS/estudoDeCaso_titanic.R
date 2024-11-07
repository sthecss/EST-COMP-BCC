# ==============================================================================
#                            ANALISE - TITANIC TXT
# ==============================================================================
    # Dados do arquivo "titanic.txt", disponível na pasta "samples".
    # Agradecimentos ao professor Pedro Franklin!
    
    
    # Pacote para visualização: ggplot2
    # install.packages("ggplot2")
    library(ggplot2)


    # ===================================================================
    # INTRODUCAO
    # ===================================================================
    # CASO UM. Iniciando a exploracao!
    
    
    # ===================================================================
    # 1. Preparação dos Dados
    # ===================================================================
    
    # Carregando e visualizando os dados
    titanic <- read.table(file = "titanic.txt", sep = ",", header = TRUE)
    titanic <- titanic[ , -c(1, 9:12)]  # Removendo colunas desnecessárias
    
    # Convertendo variáveis para fator
    titanic$Survived <- as.factor(titanic$Survived)
    titanic$Pclass <- as.factor(titanic$Pclass)
    titanic$Sex <- as.factor(titanic$Sex)
    
    # Estrutura e resumo do conjunto de dados
    str(titanic)   # Exibindo estrutura após transformação
    summary(titanic)   # Exibindo resumo estatístico
    
    
    # ===================================================================
    # 2. Visualização dos Dados
    # ===================================================================
    
    # 2.1 Gráfico de Barra: Sobrevivência
    ggplot(data = titanic, aes(x = Survived)) + 
      geom_bar(fill = "pink") + 
      theme_minimal() +
      labs(title = "Distribuição de Sobreviventes", x = "Sobrevivência", y = "Frequência")
    
    # 2.2 Gráfico de Barra: Sobrevivência por Gênero
    ggplot(data = titanic, aes(x = Survived, fill = Sex)) +
      geom_bar() + 
      theme_minimal() +
      labs(title = "Sobrevivência por Gênero", x = "Sobrevivência", y = "Frequência")
    
    # 2.3 Gráfico de Barras: Comparação de Sobreviventes por Gênero
    ggplot(data = titanic, aes(x = Survived, fill = Sex)) +
      geom_bar() +
      scale_fill_manual(values = c("male" = "#522258", "female" = "#C63C51")) +
      labs(title = "Comparação de Sobrevivência entre Homens e Mulheres", x = "Sobrevivência", y = "Frequência")
    
    # 2.4 Gráfico de Barras: Sobrevivência por Gênero (Inverso)
    ggplot(data = titanic, aes(x = Sex, fill = Survived)) +
      geom_bar() +
      scale_fill_manual(values = c("0" = "#A02334", "1" = "#96CEB4")) +
      labs(title = "Sobrevivência por Gênero", x = "Gênero", y = "Frequência")
    
    # 2.5 Gráfico de Barras por Classe: Sobrevivência por Gênero
    ggplot(data = titanic, aes(x = Sex, fill = Survived)) + 
      geom_bar(color = "black") + 
      scale_fill_manual(values = c("0" = "#A02334", "1" = "#96CEB4"),
                        labels = c("0" = "não", "1" = "sim")) +
      facet_wrap(~Pclass) +
      scale_x_discrete(labels = c("female" = "moças", "male" = "moços")) +
      labs(title = "Sobrevivência de Homens e Mulheres por Classe",
           x = "Gênero", y = "Frequência", fill = "Sobrevivência") + 
      theme_classic()
    
    
    # ===================================================================
    # Conclusão
    # ===================================================================
    # Exploramos os gráficos básicos de análise estatística!
