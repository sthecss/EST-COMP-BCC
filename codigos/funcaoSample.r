?sample

sample(10)

# Exemplo detalhado com `sample`
sample(x = 1:6, size = 1, replace = TRUE)
sample(x = 1:100, size = 4, replace = TRUE)

# Simulação de lançamentos de dado:
dado <- sample(x = 1:6, size = 100000, replace = TRUE)
sum(dado == 3)
mean(dado == 3)

# Frequência de cada face:
table(dado)
