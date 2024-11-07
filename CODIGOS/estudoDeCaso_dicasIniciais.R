# ✨ Análise de Dados do Titanic ✨
# =================================
# Este exercício utiliza o arquivo "titanic.txt" (disponível na pasta "samples").
# Agradecimentos ao professor Pedro Franklin!


    # 🔹 Biblioteca necessária: ggplot2
    # install.packages("ggplot2") # Execute se necessário
    
    library(ggplot2)



    # ================================================
    # 🔍 INÍCIO: Importando e analisando os dados do Titanic
    # ================================================
    # Carregamos o arquivo e exploramos a estrutura inicial dos dados.
    dados <- read.table(file = "titanic.txt", header = TRUE, sep = ",")
    summary(dados)   # Resumo geral dos dados
    str(dados)       # Estrutura das variáveis

    
    
    # ================================================
    # 🛠️ PREPARAÇÃO E MANIPULAÇÃO DOS DADOS
    # ================================================
    
    # Abaixo, exemplos de manipulação de colunas e tipos de dados.
    
    ## 🔹 A) EXCLUINDO COLUNAS.
    dadosAUm <- dados[, -1]  # Removendo uma única coluna (a primeira)
    dadosADois <- dados[, -c(1, 12)]  # Removendo várias colunas (PassengerID e Embarked)
    
    ## 🔹 B) CONTAGEM DE UMA VARIAVEL.
    ##    Calculamos o número de sobreviventes a partir da coluna 'Survived':
    sobreviventes <- dados[, "Survived"]
    total_sobreviventes <- sum(sobreviventes)
    print(total_sobreviventes)
    
    ## 🔹 C) ACESSANDO COLUNAS VIA NOME.
    ##    A forma mais direta para evitar problemas de posicionamento de colunas:
    dados$Survived
    
    ## 🔹 D) AJUSTE NO TIPO DA VARIAVEL
    ##    Transformamos 'Survived' de numérica para categórica (fator).
    dadosD <- dados
    dadosD$Survived <- as.factor(dadosD$Survived)
    
    # Comparando antes e depois do ajuste:
    summary(dados)    # Antes (numérico)
    summary(dadosD)   # Depois (fator)
    
    
    
    # ================================================
    # ⚙️ AJUSTES NAS VARIÁVEIS CATEGÓRICAS
    # ================================================
    # Convertemos 'Pclass' e 'Sex' para fatores, já que são variáveis categóricas.
    dadosMod <- dados
    dadosMod$Pclass <- as.factor(dadosMod$Pclass)
    dadosMod$Sex <- as.factor(dadosMod$Sex)
    
    # Verificação das variáveis ajustadas
    str(dadosMod)

    
    
    # ================================================
    # 📊 GERAÇÃO DE GRÁFICOS
    # ================================================
    # Abaixo, alguns gráficos para visualizar a relação entre sexo, classe e sobrevivência.
    
    ## 🔹 A) Gráficos de sobrevivência por gênero
    # Filtramos os dados por gênero e criamos gráficos de barras.
    
    # Homens
    homens <- dadosMod[dadosMod$Sex == "male",]
    barplot(table(homens$Survived),
            main = "Sobrevivência dos Homens",
            col = c("red", "blue"))
    
    # Mulheres
    mulheres <- dadosMod[dadosMod$Sex == "female",]
    barplot(table(mulheres$Survived),
            main = "Sobrevivência das Mulheres",
            col = c("red", "blue"))
    
    
    ## 🔹 B) Filtrando e somando sobreviventes por categoria
    # Exemplo: somamos sobreviventes entre os homens e entre as mulheres.
    total_homens_sobreviventes <- sum(homens$Survived == 1)
    total_mulheres_sobreviventes <- sum(mulheres$Survived == 1)
    
    
    # 🔹 C) Análise dos homens da terceira classe
    # Aqui filtramos homens da terceira classe e criamos um gráfico de barras.
    terceiraHomens <- homens[homens$Pclass == 3,]
    ggplot(data = terceiraHomens, aes(x = Pclass, fill = factor(Survived))) +
      geom_bar() +
      labs(title = "Sobrevivência de Homens na Terceira Classe", x = "Classe", fill = "Sobrevivência") +
      scale_fill_manual(values = c("red", "blue")) +
      theme_minimal()
    
    
    # 🎉 Fim da Análise! Agora você tem uma base para trabalhar com dados.