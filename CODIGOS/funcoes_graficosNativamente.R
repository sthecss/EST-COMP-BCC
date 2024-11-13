# ===================================================================
#                           GRAFICOS VANILLA
# ===================================================================
# Veremos as diversas formas de projetar valores via de gráfico no R.
# Aqui terá as formas "cruas", sem a necessidade de importar alguma biblioteca.


    # Criando valores para projetarmos:
    #
      x <- c(1, 2, 3, 4, 5)  # Valores para o eixo X
      y <- c(2, 3, 5, 7, 11) # Valores para o eixo Y
    #
    # =============
    #
    # 1.A) Gráfico de Dispersão
    #
      plot(x, y, 
           main="Gráfico de Dispersão",  # Título do gráfico
           xlab="Eixo X",                # Rótulo do eixo X
           ylab="Eixo Y",                # Rótulo do eixo Y
           col="blue",                   # Cor dos pontos
           pch=19)                       # Tipo do ponto (pch=19 é círculo preenchido)
    #
    # =============
    #
    # 1.B) Gráfico de Linhas
    #
      plot(x, y, 
           type="l",                     # "l" indica linha (line)
           main="Gráfico de Linhas", 
           xlab="Eixo X", 
           ylab="Eixo Y", 
           col="red")                    # Cor da linha
    #
    # =============
    # 
    # 1.C) Gráfico de Barras
    # 
      valores <- c(4, 7, 9, 6)           # Valores das barras
      nomes <- c("A", "B", "C", "D")     # Nomes das categorias
    #
      barplot(valores, 
              names.arg=nomes,           # Rótulos das barras
              main="Gráfico de Barras", 
              col="purple",              # Cor das barras
              xlab="Categorias",         # Rótulo do eixo X
              ylab="Valores")            # Rótulo do eixo Y
    #
    # =============
    #
    # 1.D) Histograma
    #
      dados <- c(1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5)  # Frequência dos valores
    #
      hist(dados, 
           main="Histograma",            # Título do histograma
           xlab="Valores",               # Rótulo do eixo X
           ylab="Frequência",            # Rótulo do eixo Y
           col="lightblue",              # Cor das barras
           border="black")               # Cor da borda das barras
    #
    # =============
    #
    # 1.E) Gráfico de Setores (Pizza)
    #
      valores <- c(10, 20, 30, 40)        # Proporções das fatias
      categorias <- c("A", "B", "C", "D") # Rótulos das fatias
    #
      pie(valores, 
          labels=categorias,             # Rótulos de cada setor
          main="Gráfico de Setores", 
          col=c("red", "green", "blue", "yellow"))  # Cores das fatias
    #
    # =============