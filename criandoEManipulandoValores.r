set.seed(1)  # Controla a randomização

runif(1)     # Gera um número aleatório

# Duas formas de guardar valores:
testeA <- 3 * 2
4 * 8 -> testeB


# checando tipo das variaveis:
testeD <- TRUE
class(testeD) # checando de que tipo é o testeD

vet <- "Hello World!"
class(vet)


x1 <- c(2, 6, 20)
length(x1)        # Tamanho do vetor
sum(x1)           # Soma dos elementos
mean(x1)          # Média dos elementos

# Acessando elementos
x1[2]
x1[c(2,3)]     # Elementos nas posições 2 e 3
x1[c(2,3,2,1)] 

# Operações com vetores
x2 <- c(x1, 67, 90)
x2

x2 < 70       # Verifica quais elementos são menores que 70
sum(x2 < 70)  # Conta os elementos menores que 70
x2[x2 < 70]   # Filtra o vetor, mostrando apenas os menores que 70
sum(x2[x2 < 70]) # Soma os valores abaixo de 70

# Outras operações lógicas
x2 > 54
x2 == 10
x2 != 10
