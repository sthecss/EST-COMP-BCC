# =======================================================================

#              FUNÇÕES DE GERAÇÃO E MANIPULAÇÃO DE DADOS

# =======================================================================
#
#                    ÍNDICE DE FUNÇÕES NO SCRIPT
#
# 1. sample()   - Amostragem aleatória de elementos de um conjunto
# 2. rep()      - Repetição de elementos de um vetor
# 3. seq()      - Geração de sequências numéricas
# 4. runif()    - Números aleatórios com distribuição uniforme
# 5. rnorm()    - Números aleatórios com distribuição normal
# 6. paste()    - Concatenação de strings e valores
# 7. unique()   - Extração de valores únicos
# 8. sort()     - Ordenação de elementos
# 9. table()    - Contagem de frequência de elementos
# 10. aggregate() - Agregação de dados por grupos
#
# Navegue pelas seções do script para ver exemplos práticos de uso!
#
# =======================================================================


    # ===================================================================
    #                     NAO NECESSITA BIBLIOTECAS
    # ===================================================================
    #
    # 1.Gera uma amostra aleatória de elementos de um conjunto especificado.
      ?sample
    #
    # Exemplo: Amostrando 5 valores aleatórios de um vetor de 1 a 10
      set.seed(1)  # assim como no Minecraft, garante a reprodutibilidade
    #  
    # Para amostras que não tem reposicao nos valores: 
      sample(1:10, size = 5, replace = FALSE)
    #
    # Para amostras que não tem reposicao nos valores: 
      sample(1:10, size = 5, replace = TRUE)  # Pode ter valores repetidos
    #  
    # ===========================
    #
    # 2. Repete valores de um vetor um número específico de vezes.
      ?rep
    #
    # Exemplo: Repetindo elementos de um vetor, dando 3 voltas
      rep(c("A", "B", "C"), times = 3)  # Repete os elementos 3 vezes
    #
    # Outra variação: Usando 'each' para repetir cada elemento individualmente
      rep(c("A", "B", "C"), each = 2)  # Repete cada elemento 2 vezes
    #
    # ============================
    #
    # 3, Cria uma sequência de números.
      ?seq
    #
    # Exemplo: Sequência de 1 a 10, com incremento de 1
      seq(1, 10, by = 1)
    #
    # Sequência de 0 a 1, com incremento de 0.2
      seq(0, 1, by = 0.2)
    #
    # Usando length.out para especificar o comprimento da sequência
      seq(1, 10, length.out = 5)  # Divide o intervalo em 5 partes
      seq(1, 10, length.out = 2)  # Divide o intervalo em 2 partes
    #
    # ===========================
    #
    # 4. Gera números aleatórios com distribuição uniforme.
      ?runif
    #
    # Exemplo: 5 números aleatórios entre 0 e 1
      set.seed(1)  # Para reprodutibilidade
      runif(5, min = 0, max = 1)
    #
    # Exemplo: 5 números aleatórios entre -5 e 5
      runif(5, min = -5, max = 5)
    #
    # ===========================
    #
    # 5. Gera números aleatórios com distribuição normal.
      ?rnorm
    #
    # Exemplo: 5 números aleatórios com média 0 e desvio padrão 1
      set.seed(1)  # Para reprodutibilidade
      rnorm(5, mean = 0, sd = 1)
    #
    # Exemplo: 5 números aleatórios com média 10 e desvio padrão 2
      rnorm(5, mean = 10, sd = 2)
    #
    # ===========================
    #
    # 6. Concatena strings ou valores com um separador.
      ?paste()
    #
    # Exemplo: Concatenando "Item" com números de 1 a 5
      paste("Item", 1:5, sep = "-")
    #
    # Outra variação: Concatenando valores com collapse
      paste(c("A", "B", "C"), collapse = ", ")  # Resultado: "A, B, C"
    #
    # ===========================
    #
    # 7. Extrai os valores únicos de um vetor.
      ? unique()
    #
    # Exemplo: Valores únicos em um vetor com duplicatas
      vetor <- c(1, 2, 2, 3, 4, 4, 5)
      unique(vetor)  # Retorna apenas os valores distintos
    #
    # ===========================
    #
    # 8. Ordena os elementos de um vetor.
      ?sort()
    #
    # Exemplo: Ordenando um vetor de números
      vetor <- c(3, 1, 4, 1, 5, 9, 2)
      sort(vetor)             # Ordena em ordem crescente
      sort(vetor, decreasing = TRUE)  # Ordena em ordem decrescente
    #
    # ===========================
    #
    # 9. Conta a frequência de cada elemento em um vetor.
      ?table()
    #
    # Exemplo: Frequência de valores em um vetor categórico
      categorias <- c("A", "B", "A", "C", "B", "A")
      table(categorias)  # Mostra a contagem de cada categoria
    #
    # ===========================
    #
    # 10. Agrega dados aplicando funções a subgrupos de dados.
      ?aggregate()
    #
    # Exemplo: Média de valores agrupados por uma categoria
      dados <- data.frame(grupo = c("A", "A", "B", "B", "C", "C"),
                        valor = c(10, 20, 30, 40, 50, 60))
      aggregate(valor ~ grupo, data = dados, FUN = mean)  # Média dos valores por grupo
    #