# DICA ÚTIL: Documentação de Funções
# Acessando ajuda para uma função:
?sample

# =========================== RANDOMIZAÇÃO DE VALORES

# Controle de randomização:
set.seed(1)   # Define a semente para controle da aleatoriedade
runif(1)      # Gera um número aleatório uniforme


# Exemplo de uso da função sample:
sample(10)


# Exemplo com parâmetros:
sample(x = 1:6, size = 1, replace = TRUE)
sample(x = 1:100, size = 4, replace = TRUE)


# Simulação de lançamento de um dado:
dado <- sample(x = 1:6, size = 100000, replace = TRUE)
sum(dado == 3)       # Contagem de ocorrências do número 3
mean(dado == 3)      # Média de ocorrências do número 3


# Tabela de frequência de cada número no dado, será vista no seu console:
table(dado)
