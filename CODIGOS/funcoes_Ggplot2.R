# =======================================================================
#              GGPLOT : NOVAS VISUALIZAÇÕES PARA OS GRÁFICOS
# =======================================================================
#
# Por mais que o R possa ter uma forma nativa de fazer gráficos, eles
# não entregam uma estética tão elevada nem permitem um rigor mais rebuscado.
# Com isso, podemos contar com a poderosa e flexível biblioteca ggplot2!
#
# INSTALAÇÃO
# Caso ainda não tenha ggplot2 instalada, rode o seguinte comando:
# install.packages("ggplot2")
#
# Após a instalação, carregue a biblioteca com o comando abaixo:

    
    # ===================================================================
                              library(ggplot2)
    # ===================================================================
    #
    # Usaremos a ggplot2 para criar diferentes tipos de gráficos
    #
    
    # Criando valores de exemplo para os gráficos:
    #
      dados_disp <- data.frame(x = c(1, 2, 3, 4, 5), y = c(2, 3, 5, 7, 11))
    #
    # =============
    #
    # 2.A) Gráfico de Dispersão
    #
      ggplot(dados_disp, aes(x = x, y = y)) +
        geom_point(color = "blue", size = 3) +      # Adiciona pontos de cor azul
        labs(title = "Gráfico de Dispersão",        # Título do gráfico
             x = "Eixo X",                          # Rótulo do eixo X
             y = "Eixo Y")                          # Rótulo do eixo Y
    #
    # =============
    #
    # 2.B) Gráfico de Linhas
    #
      ggplot(dados_disp, aes(x = x, y = y)) +
        geom_line(color = "red") +                  # Adiciona uma linha vermelha
        labs(title = "Gráfico de Linhas", 
             x = "Eixo X", 
             y = "Eixo Y")
    #
    # =============
    #
    # 2.C) Gráfico de Barras
    #
      dados_bar <- data.frame(categorias = c("A", "B", "C", "D"),
                              valores = c(4, 7, 9, 6))
    #
      ggplot(dados_bar, aes(x = categorias, y = valores)) +
        geom_bar(stat = "identity", # Usa valores diretamente para altura das barras
                 fill = "purple") + 
        labs(title = "Gráfico de Barras", 
             x = "Categorias", 
             y = "Valores")
    #
    # =============
    #
    # 2.D) Histograma
    #
      dados_hist <- data.frame(valores = c(1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5))
    #
      ggplot(dados_hist, aes(x = valores)) +
        geom_histogram(binwidth = 1,        # Define largura das barras
                       fill = "lightblue",
                       color = "black") +  
        labs(title = "Histograma", 
             x = "Valores", 
             y = "Frequência")
    #
    # =============
    #
    # 2.E) Gráfico de Setores (Pizza)
    #
    # Curiosidade sobre! O ggplot2 foi projetado para visualizações baseadas
    # em coordenadas cartesianas (como gráficos de barras, linhas e dispersão),
    # por isso não tem uma função de gráfico de pizza dedicada.
    # Porém!!!!, ao transformar um gráfico de barras em coordenadas polares,
    # conseguimos criar um gráfico de pizza bem customizável hehehe.
    #
      dados_pizza <- data.frame(
        categorias = c("A", "B", "C", "D"),
        valores = c(10, 20, 30, 40)
      )
    #
    # Calculando proporções e posições para o gráfico de setores
      dados_pizza$fracao <- dados_pizza$valores / sum(dados_pizza$valores)
      dados_pizza$ymax <- cumsum(dados_pizza$fracao)
      dados_pizza$ymin <- c(0, head(dados_pizza$ymax, n = -1))
      
    # Criando o gráfico de setores
      ggplot(dados_pizza,
             aes(ymin = ymin,
                 ymax = ymax,
                 xmin = 0,
                 xmax = 1,
                 fill = categorias)) +
      geom_rect() +                              # Desenha as fatias
      coord_polar(theta = "y") +                 # Converte para coordenadas polares
      labs(title = "Gráfico de Setores") +       # Título do gráfico
      scale_fill_manual(values = c("red", "green", "blue", "yellow")) 
    #
    # =============
