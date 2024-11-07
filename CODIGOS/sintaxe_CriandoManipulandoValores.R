# ===================================== CRIAÇÃO DE VALORES

# Atribuição de valores:
testeA <- 3 * 2
4 * 8 -> testeB


# =========================== LIDANDO COM PALAVRAS

# Trabalhando com strings:
vet <- "Hello World!"
class(vet)     # Tipo da variável 'vet'


# ===================================== CRIANDO VETORES

# Operações com vetores:
x1 <- c(2, 6, 20)   # Função 'c' para concatenar
length(x1)          # Tamanho do vetor
sum(x1)             # Soma dos elementos do vetor
mean(x1)            # Média dos elementos do vetor

c(1, 6, "Teste")    # Vetor misto, converte tudo para caractere

# Acessando elementos do vetor:
x1[2]
x1[c(2, 3)]         # Elementos nas posições 2 e 3
x1[c(2, 3, 2, 1)]   # Acessa posições específicas repetidamente

# Expansão do vetor:
x2 <- c(x1, 67, 90) # Adiciona elementos ao vetor x1
x2                  # Exibe o novo vetor

# Operações lógicas com vetores:
x2 < 70             # Vetor lógico, verifica se cada elemento é menor que 70
sum(x2 < 70)        # Quantidade de elementos menores que 70
x2[x2 < 70]         # Filtragem: exibe apenas os elementos menores que 70
sum(x2[x2 < 70])    # Soma dos elementos menores que 70

x2 > 54             # Verifica se cada elemento é maior que 54
x2 == 10            # Verifica se há elementos iguais a 10
x2 != 10            # Verifica se há elementos diferentes de 10
