// Inicializa os ícones
lucide.createIcons();

// =============================================================================
// 1. CONFIGURAÇÃO DO GITHUB (FETCH DINÂMICO)
// =============================================================================
// Substituímos a variável 'fullCodes' fixa pela lógica de busca na internet.
const GITHUB_BASE_URL = "https://raw.githubusercontent.com/sthecss/EST-COMP-BCC/main/CODIGOS/";

// Cache para não gastar dados baixando o mesmo arquivo 2 vezes
const codeCache = {};

async function fetchCodeFromGitHub(filename) {
    const codeElement = document.getElementById('code-block');
    
    // Feedback visual enquanto carrega
    codeElement.textContent = `# ☁️ Conectando ao GitHub...\n# Buscando o arquivo: ${filename}...`;
    document.body.classList.add('full-code-mode');

    // Se já baixou antes, usa a memória (Cache)
    if (codeCache[filename]) {
        return codeCache[filename];
    }

    try {
        const response = await fetch(GITHUB_BASE_URL + filename);
        
        if (!response.ok) {
            throw new Error(`Erro ${response.status}: Arquivo não encontrado no repositório.`);
        }
        
        const text = await response.text();
        codeCache[filename] = text; // Salva no cache
        return text;
    } catch (error) {
        console.error("Erro no fetch:", error);
        return `# ❌ ERRO DE CONEXÃO\n# Não foi possível baixar o código.\n# Detalhe: ${error.message}`;
    }
}

// =============================================================================
// 2. ROTEIRO DA APRESENTAÇÃO
// =============================================================================
const presentationData = {
    // MÓDULO INTRODUTÓRIO:
    "intro": [
        { 
            title: "👋 Olá, Mundo!", 
            code: "# Bem-vindo ao meu Portfolio de Estatística Computacional!\n\n# Aqui reúno minhas anotações sobre R, cobrindo desde\n# a sintaxe básica até algoritmos de Inteligência Artificial.\n\nprint('Seja bem-vindo!')", 
            tip: "Este projeto foi criado para facilitar o acesso às minhas anotações de aula."
        },
        { 
            title: "A Ementa do Curso", 
            code: "topicos_estudados <- c(\n  'Leitura e Manipulação de Arquivos',\n  'Purificação de Dados e Web Scraping',\n  'Algoritmos: KNN e Árvores de Decisão',\n  'Florestas de Decisão (Random Forest)'\n)", 
            tip: "Exploraremos esses tópicos nos módulos ao lado, com exemplos reais e práticos." 
        },
        { 
            title: "Tecnologia Live", 
            code: "# Aviso Técnico:\n\n# Todos os códigos apresentados aqui são carregados\n# em TEMPO REAL diretamente do meu GitHub.\n\n# Repositório: sthecss/EST-COMP-BCC", 
            tip: "Isso garante que você esteja vendo sempre a versão mais atualizada dos meus estudos!"
        }
    ],

    // MÓDULO 1: SINTAXE (Expandido passo a passo)
    "basico": [
        { 
            title: "1. A 'Setinha' (Atribuição)", 
            code: "# No R, usamos <- para guardar valores\ntesteA <- 3 * 2\n\n# Ler-se: 'testeA RECEBE 6'", 
            tip: "Diferente de outras linguagens que usam '=', o R prefere '<-' para indicar direção. O valor vai para a variável." 
        },
        { 
            title: "2. O Poder do c()", 
            code: "# c() significa 'Combinar'\nmeus_numeros <- c(2, 6, 20)\n\n# O vetor sabe matemática:\nsum(meus_numeros)   # Soma tudo (28)\nmean(meus_numeros)  # Tira a média (9.33)", 
            tip: "No R, quase tudo é um vetor. A função c() cola vários valores em uma única variável." 
        },
        { 
            title: "3. Acessando Posições []", 
            code: "x <- c(10, 20, 30, 40)\n\n# Quero apenas o segundo número:\nx[2] \n# Resultado: 20", 
            tip: "Cuidado! O R começa a contar do 1. Em Python ou Java, começaria do 0." 
        },
        { 
            title: "4. Perguntas Lógicas", 
            code: "notas <- c(5, 9, 4, 10)\n\n# Quem passou de ano (nota > 6)?\nnotas > 6\n# O R responde com TRUE ou FALSE para CADA um.", 
            tip: "Isso gera um 'Vetor Lógico'. O R verifica elemento por elemento e diz se é Verdadeiro ou Falso." 
        },
        { 
            title: "5. A Mágica do Filtro", 
            code: "# Me dê as notas ONDE a nota é maior que 6\nnotas[notas > 6]\n\n# O R usa os TRUEs do passo anterior para selecionar.", 
            tip: "Esta é a sintaxe mais usada em Data Science: Dados[Condição]. A condição vai dentro dos colchetes!" 
        },
        { 
            title: "Mão na Massa: Sintaxe", 
            filename: "sintaxe_CriandoManipulandoValores.R", 
            getFullCode: true, 
            tip: "Este código foi baixado agora do seu GitHub. Copie e teste no RStudio!"
        }
    ],

    // MÓDULO 2: GERAÇÃO DE DADOS (Expandido para explicar padrões e distribuições)
    "geracao": [
        { 
            title: "1. Controlando o Acaso", 
            code: "set.seed(1)\n# Agora o 'aleatório' será sempre igual\n# Se rodar de novo, dará o mesmo número.", 
            tip: "Em ciência, precisamos que nossos resultados sejam reproduzíveis. O 'seed' garante isso." 
        },
        { 
            title: "2. Criando Sequências (Seq)", 
            code: "# De 0 a 10, pulando de 2 em 2\nseq(from = 0, to = 10, by = 2)\n# Resultado: 0, 2, 4, 6, 8, 10", 
            tip: "A função seq() é muito usada para criar eixos de tempo ou faixas de valores em gráficos." 
        },
        { 
            title: "3. Repetição de Padrões (Rep)", 
            code: "# Repete o vetor todo 3 vezes\nrep(c('A', 'B'), times = 3)\n# Resultado: 'A', 'B', 'A', 'B', 'A', 'B'", 
            tip: "Use rep() quando precisar preencher colunas de categorias (ex: Grupo Controle, Grupo Controle...)." 
        },
        { 
            title: "4. Sorteio (Sample)", 
            code: "# Sorteia 3 números entre 1 e 100\nsample(1:100, size = 3, replace = FALSE)", 
            tip: "É como tirar nomes de um chapéu. 'replace=FALSE' significa que não sorteamos o mesmo número duas vezes." 
        },
        { 
            title: "5. Tipos de Aleatoriedade", 
            code: "# Uniforme (Dado): Chances iguais\nrunif(5, min=0, max=1)\n\n# Normal (Curva): Maioria na média\nrnorm(5, mean=0, sd=1)", 
            tip: "Diferença crucial: 'runif' é plano (tudo pode acontecer). 'rnorm' concentra valores no centro (como altura de pessoas)." 
        },
        { 
            title: "Mão na Massa: Gerando Dados", 
            filename: "funcoes_gerandoDados.R", 
            getFullCode: true, 
            tip: "Rode o script completo e compare os resultados das funções 'runif' e 'rnorm' no console!" 
        }
    ],

    // MÓDULO 3: TITANIC
    "titanic": [
        { 
            title: "Limpeza de Dados", 
            code: "titanic <- read.table('titanic.txt', sep=',', header=TRUE)\n\n# Removendo colunas inúteis\ntitanic <- titanic[ , -c(1, 9:12)]", 
            tip: "O primeiro passo de qualquer análise é limpar o que não serve." 
        },
        // --- INÍCIO DA EXPLICAÇÃO GGPLOT ---
        {
            title: "1. A Base (Canvas)",
            code: "ggplot(data = titanic, aes(x = Survived, fill = Sex))",
            tip: "Parte 1: 'ggplot' cria o fundo. 'aes' (estética) define que o Eixo X é a sobrevivência e a Cor (fill) é o sexo."
        },
        {
            title: "2. A Geometria (Forma)",
            code: "ggplot(data = titanic, aes(x = Survived, fill = Sex)) +\n  geom_bar()",
            tip: "Parte 2: O sinal '+' adiciona uma camada visual. 'geom_bar' diz ao R para desenhar barras com os dados anteriores."
        },
        {
            title: "3. Personalização (Labels)",
            code: "ggplot(...) + geom_bar() +\n  labs(title = \"Sobreviventes\", y = \"Contagem\")",
            tip: "Parte 3: Podemos adicionar mais camadas com '+', como 'labs' para mudar os títulos do gráfico."
        },
        // --- FIM DA EXPLICAÇÃO GGPLOT ---
        { 
            title: "Mão na Massa: Análise Titanic", 
            filename: "estudoDeCaso_titanic.R", 
            getFullCode: true, 
            tip: "Rode o script completo para ver os gráficos coloridos de sobrevivência!" 
        }
    ],

    // MÓDULO 4: FLORES
    "flores": [
        { 
            title: "Lógica Manual (If/Else)", 
            code: "if (petala < 2.5) {\n  especie <- 'setosa'\n} else {\n  especie <- 'virginica'\n}", 
            tip: "Antes de usar IA, tentamos classificar as flores com regras simples manuais." 
        },
        { 
            title: "Lógica de Decisão", 
            code: "for (j in 1:nrow(teste)) {\n  if (teste$Petal.Length[j] < 2.5) {\n    resultados[j] <- 'setosa'\n  } else if (teste$Petal.Width[j] < 1.75) {\n    resultados[j] <- 'versicolor'\n  } else {\n    resultados[j] <- 'virginica'\n  }\n}", 
            tip: "Aqui o computador percorre cada flor e aplica as regras manuais que definimos." 
        },
        { 
            title: "Mão na Massa: Algoritmo Manual", 
            filename: "estudoDeCaso_flores.R", 
            getFullCode: true, 
            tip: "Verifique a 'Taxa de Acerto' no final do script. Quão bom foi nosso algoritmo manual?" 
        }
    ],

    // MÓDULO 5: PENGUINS (Refatorado para explicar passo a passo)
    "penguins": [
        { 
            title: "O Conceito: Vizinhos", 
            code: "# Pergunta: Qual a espécie desse pinguim novo?\n\n# Lógica do KNN:\n# Se ele tem o peso e bico parecidos com o Pinguim A,\n# provavelmente ele é da mesma espécie que o A.", 
            tip: "KNN significa 'K-Vizinhos Mais Próximos'. Classificamos baseado na semelhança física." 
        },
        { 
            title: "A Matemática (Pitágoras)", 
            code: "# Distância Euclidiana (famoso Teorema de Pitágoras)\n\ndistancia <- sqrt( (x2 - x1)^2 + (y2 - y1)^2 )", 
            tip: "Para saber se é parecido, calculamos a distância entre os pontos no gráfico." 
        },
        { 
            title: "Calculando as Distâncias", 
            code: "# Comparamos o pinguim NOVO com TODOS os conhecidos\n\nfor (k in 1:nrow(treino)) {\n  distancias[k] <- sqrt(\n    (teste$peso - treino$peso[k])^2 +\n    (teste$bico - treino$bico[k])^2\n  )\n}", 
            tip: "O loop 'for' calcula a distância matemática do nosso pinguim misterioso para CADA pinguim que já conhecemos." 
        },
        { 
            title: "Achando o Mais Próximo", 
            code: "# Qual foi a menor distância encontrada?\nmin(distancias)\n\n# Qual pinguim é esse?\nwhich.min(distancias)", 
            tip: "A função min() nos diz a distância e which.min() nos diz qual é o pinguim 'gêmeo' do nosso teste." 
        },
        { 
            title: "Mão na Massa: Machine Learning", 
            filename: "estudoDeCaso_penguins.R", 
            getFullCode: true, 
            tip: "Este código implementa 'na unha' o que algoritmos de IA fazem automaticamente. Rode para ver!" 
        }
    ]
};

// =============================================================================
// 3. LÓGICA DE CONTROLE DA PÁGINA
// (Atualizada para usar fetchCodeFromGitHub)
// =============================================================================

let currentQueue = presentationData["intro"];
let currentIndex = 0;

const slideTitle = document.getElementById('slide-title');
const slideCode = document.getElementById('code-block');
const slideTip = document.getElementById('slide-tip');
const slideCounter = document.getElementById('slide-counter');

function renderSlide() {
    const item = currentQueue[currentIndex];
    
    // Atualiza Textos
    slideTitle.innerText = item.title;
    slideTip.innerText = item.tip;
    if (slideCounter) slideCounter.innerText = `${currentIndex + 1} / ${currentQueue.length}`;
    
    // Lógica Dinâmica (Fetch do GitHub)
    if (item.getFullCode) {
        // Chama a função que busca na internet
        fetchCodeFromGitHub(item.filename).then(code => {
            // Verifica se o usuário ainda está no mesmo slide
            if (currentQueue[currentIndex] === item) {
                slideCode.textContent = code;
                highlightCode();
            }
        });
    } else {
        // Slide normal (Texto estático)
        slideCode.textContent = item.code;
        document.body.classList.remove('full-code-mode');
        highlightCode();
    }
}

function highlightCode() {
    slideCode.className = 'language-r code-font text-sm leading-relaxed';
    if (window.Prism) {
        Prism.highlightElement(slideCode);
    }
}

// Navegação
function loadModule(moduleKey) {
    if (presentationData[moduleKey]) {
        currentQueue = presentationData[moduleKey];
        currentIndex = 0;
        
        // Feedback visual nos botões (opcional)
        document.querySelectorAll('aside button').forEach(btn => {
             // Resetar estilos se necessário
        });
        
        renderSlide();
    }
}

function nextSlide() {
    if (currentIndex < currentQueue.length - 1) {
        currentIndex++;
        renderSlide();
    }
}

function prevSlide() {
    if (currentIndex > 0) {
        currentIndex--;
        renderSlide();
    }
}

function copyCode() {
    const codeText = document.getElementById('code-block').textContent;
    navigator.clipboard.writeText(codeText).then(() => {
        const btnText = document.querySelector('button[onclick="copyCode()"] span');
        if(btnText) {
            const original = btnText.innerText;
            btnText.innerText = "Copiado!";
            setTimeout(() => btnText.innerText = original, 2000);
        }
    });
}

// Inicia
renderSlide();
