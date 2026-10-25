# Ficha do Projeto: Motor de Busca do Centro Antigo de São Vicente
*criada na Aula 01 (Parte D) em 2026-10-24 · última atualização: Aula 03 Parte D, 2026-10-25, motor03*

## 1. Identidade
- Grupo: Predicarga
- Integrantes:
  - Andre Cesar Franco R.A: 0051352511037
  - Diego de Farias Carazo Prieto R.A: 0051352511007
  - Kaykhy Donizete Freitas de Oliveira R.A: 0051352511036
- Endereço do Repositório: https://github.com/andrecesar00/predicarga_andre_diego_kaykhy
- Ambiente: R (Google Colab)

## 2. Tema e Justificativa
- Tema: O patrimônio histórico, monumentos e a história do centro antigo de São Vicente.
- Ligação com a Baixada Santista: São Vicente é a primeira vila do Brasil, situada na Baixada Santista, possuindo alta relevância histórica, arquitetônica e fundacional para a região.
- Público-alvo / Quem usaria: Estudantes de história, moradores locais, pesquisadores e turistas interessados no patrimônio histórico-cultural da primeira vila do Brasil.
- Três perguntas que o motor responde:
  1. Quais são os monumentos históricos do centro de São Vicente?
  2. História da fundação da Vila de São Vicente e Martim Afonso
  3. Arquitetura e pontos turísticos culturais no centro antigo

## 3. Fonte e Critério de Documento
- Origem dos dados: Wikipédia em português (pt.wikipedia.org) via API com pacote httr2.
- Licença: Creative Commons Atribuição-CompartilhaIgual 4.0 Internacional (CC BY-SA 4.0).
- Títulos das páginas utilizadas:
  - São Vicente (São Paulo)
  - Martim Afonso de Sousa
  - Ponte Pênsil de São Vicente
- O que é um documento e por quê: Cada parágrafo dos artigos extraídos que possui comprimento superior a 200 caracteres (conforme `cfg$minimo`). O parágrafo é a menor unidade textual autônoma capaz de responder a uma consulta de forma direta sem diluir termos relevantes.

## 4. A Cara do Corpus
- Quantidade de documentos: 64 documentos (parágrafos).
- Distribuição por origem:
  - Martim Afonso de Sousa: 29
  - São Vicente (São Paulo): 23
  - Ponte Pênsil de São Vicente: 12
- Tamanhos dos documentos no corpus bruto:
  - Mínimo: 34 tokens
  - Máximo: 277 tokens
  - Média: 86 tokens
- Vocabulário: 2.136 termos brutos · 1.831 depois da limpeza e remoção das stopwords (Aula 03).
- Aspectos observados no vocabulário bruto: Presença de pontuação grudada nos termos, caracteres especiais, números e acentuação, além de alta dominância de palavras funcionais.
- Idioma, acentos, caixa e pontuação: Português; transliteração dos acentos antes da limpeza; conversão para minúsculas; caracteres fora de a-z, dígitos e espaço substituídos por espaços; espaços repetidos reduzidos e espaços das pontas removidos.
- Comparação no documento d1: 76 tokens antes e 78 depois da limpeza. Os números `148,151` e `226,86` foram separados em dois tokens cada.
- Conversão de acentos: Nenhum documento apresentou falha na conversão com iconv; resultado da verificação: 0.
- Três consultas de trabalho:
  1. "monumentos historicos centro"
  2. "fundacao vila martim afonso"
  3. "ponte pensil arquitetura"
- Índice invertido: 1.831 termos indexados, igual ao vocabulário limpo.
- Buscas AND verificadas:
  - "fundacao vila": retorna d4, do artigo São Vicente (São Paulo). O documento contém os dois termos.
  - "historicos centro": não retorna documentos. "historicos" aparece em d2 e d4; "centro" aparece em d6; não há interseção.
- Testes adicionais:
  - "monumentos historicos centro": sem resultado; "monumentos" não possui entrada no índice.
  - "fundacao vila martim afonso": sem resultado; "fundacao" aparece somente em d4, que não consta nas listas de "martim" e "afonso".
- Peculiaridades e limitações observadas: O modelo vetorial de cosseno não reconhece variações morfológicas nem sinônimos automaticamente. A limpeza da Aula 03 não resolve essas limitações. A busca AND exige que todos os termos preparados apareçam no mesmo documento.

## 5. Matriz de Entregas da Disciplina
- Aula 01 (Corpus, config.R, Tokenização + TDM): ok
- Aula 02 (TF-IDF e Similaridade Cosseno): ok (`estrutura/codigo/aula02.ipynb`)
- Aula 03 (Limpeza + stopwords do grupo): ok; notebook a salvar em `estrutura/codigo/aula03.ipynb`.
- Aula 03 (Índice invertido + busca AND): ok; notebook a salvar em `estrutura/codigo/aula03.ipynb`.
- Decisões para o R: campos `minimo`, `grupo`, `limpar`, `acentos` e `stopwords` definidos no config.R local; publicação no GitHub pendente no fechamento.
- Aula 04 (Stemming e Eficiência): —
- Aula 05 (Expansão do Corpus): —

## 6. Decisões do Projeto
- Tema: Focado na história e patrimônio de São Vicente pela relevância regional e facilidade de obtenção de dados abertos.
- Fonte: API da Wikipédia em português com texto limpo sem tags HTML.
- Critério de documento: `cfg$minimo = 200` caracteres por parágrafo para eliminar ruídos, listas curtas e referências vazias.
- Aula 02: Consultas de trabalho definidas (q1 "monumentos historicos centro", q2 "fundacao vila martim afonso", q3 "ponte pensil arquitetura") — sem campo novo no config.R.
- Aula 03: Nome do grupo confirmado como Predicarga, substituindo Pessoa na ficha; `cfg$grupo = "Predicarga"`.
- Aula 03: Acentos — transliteração, para evitar palavras partidas e confusão nos termos; `cfg$limpar = TRUE`, `cfg$acentos = "translit"`. A mesma preparação vale para documentos e consultas.
- Aula 03: Stopwords do projeto — de, e, a, o, em, da, do, que, foi, no, para, com. Mantida a palavra "sao" porque faz parte do nome São Vicente; `cfg$stopwords = c("de", "e", "a", "o", "em", "da", "do", "que", "foi", "no", "para", "com")`.

## 7. Linha do Tempo e Histórico
- Aula 01 (Parte D): Criação do corpus de 64 parágrafos, indexação vetorial com vocabulário de 2.136 termos, validação da busca booleana e estruturação inicial dos diretórios do repositório.
- Aula 02 (Parte D): Implementação do motor02, cálculo de normas vetoriais, definição das três consultas de trabalho, análise de relevância via produto escalar (cosseno) e mapeamento das limitações de variação morfológica.
- Aula 03 (Parte D), 2026-10-25:
  - Presentes: Andre Cesar Franco, Diego de Farias Carazo Prieto e Kaykhy Donizete Freitas de Oliveira.
  - Quem digitou: Andre Cesar Franco nos módulos 10, 11 e 12.
  - Feito: Carregamento do motor03 e dos 64 documentos; decisão pela transliteração; escolha das 12 stopwords; manutenção de "sao"; aplicação da limpeza; construção do índice invertido e testes de busca AND.
  - Produzido: Vocabulário limpo e índice com 1.831 termos; consulta "fundacao vila" com resultado d4; consulta "historicos centro" sem resultado, explicada pelas listas de postagens.
  - Configuração: Nome Predicarga e decisões da Aula 03 confirmados na saída de cfg.
  - Pendente: Acrescentar o estado do R aos documentos com anexar_estado(), baixar os arquivos e publicar a ficha, o consolidado, o config.R e o notebook no GitHub.

---

<!-- estado-R:inicio -->
## Estado do R ao fim da sessão
*gerado por `anexar_estado()` em 2026-10-25 05:17 · R version 4.6.1 (2026-06-24) · motor03 v1 2026-10-01 · não edite à mão*

### Objetos

| objeto | tipo | tamanho | valor / amostra |
|---|---|---|---|
| `cfg$minimo` | numeric | 1 | 200 |
| `cfg$limpar` | logical | 1 | TRUE |
| `cfg$acentos` | character | 1 | translit |
| `cfg$stopwords` | character | 12 | de, e, a, o, em, da, ... |
| `cfg$grupo` | character | 1 | Predicarga |
| `d` | character | 1 | d64 |
| `docs` | character, nomeado | 64 | d1 São Vicente, oficialmente E..., d2 São Vicente marca o início ..., d3 Com um PIB de mais de 6 bil..., d4 São Vicente preserva divers..., d5 A Ilha de Gohayó foi descob..., d6 Nas primeiras décadas do sé..., ... |
| `ix$tokens` | list | 64 | elementos: d1, d2, d3, d4, d5, d6, d7, d8, ... |
| `ix$vocab` | character | 2136 | -, –, —, "berço, "bica, "biquinha"., ... |
| `ix$tf` | matrix | 2136 × 64 | linhas: -, –, —, ... \| colunas: d1, d2, d3, d4, ... |
| `ix$N` | integer | 1 | 64 |
| `ix$df` | numeric, nomeado | 2136 | - 2, – 2, — 2, "berço 1, "bica 1, "biquinha". 1, ... |
| `ix$idf_tfidf` | numeric, nomeado | 2136 | - 3.466, – 3.466, — 3.466, "berço 4.159, "bica 4.159, "biquinha". 4.159, ... |
| `ix$w` | matrix | 2136 × 64 | linhas: -, –, —, ... \| colunas: d1, d2, d3, d4, ... |
| `ix$wn` | matrix | 2136 × 64 | linhas: -, –, —, ... \| colunas: d1, d2, d3, d4, ... |
| `ix$postings` | list | 1831 | elementos: sao, vicente, oficialmente, estancia, balnearia, um, municipio, brasileiro, ... |
| `MOTOR_VERSAO` | character | 1 | motor03 v1 2026-10-01 |
| `origem` | character, nomeado | 64 | d1 São Vicente (São Paulo), d2 São Vicente (São Paulo), d3 São Vicente (São Paulo), d4 São Vicente (São Paulo), d5 São Vicente (São Paulo), d6 São Vicente (São Paulo), ... |
| `postings$sao` | character | 36 | d1, d2, d3, d4, d5, d6, ... |
| `postings$vicente` | character | 30 | d1, d2, d3, d4, d5, d6, ... |
| `postings$oficialmente` | character | 1 | d1 |
| `postings$estancia` | character | 2 | d1, d4 |
| `postings$balnearia` | character | 2 | d1, d4 |
| `postings$um` | character | 25 | d1, d3, d4, d6, d7, d12, ... |
| `postings$municipio` | character | 3 | d1, d3, d53 |
| `postings$brasileiro` | character | 3 | d1, d2, d21 |
| `postings$estado` | character | 7 | d1, d26, d29, d45, d47, d54, ... |
| `postings$paulo` | character | 12 | d1, d3, d6, d13, d17, d22, ... |
| `postings$primeira` | character | 12 | d1, d2, d4, d31, d34, d35, ... |
| `postings$cidade` | character | 9 | d1, d2, d3, d7, d21, d22, ... |
| `postings$brasil` | character | 17 | d1, d2, d3, d4, d9, d21, ... |
| `postings$pertencente` | character | 1 | d1 |
| `postings$regiao` | character | 10 | d1, d9, d11, d13, d20, d37, ... |
| `postings$metropolitana` | character | 2 | d1, d54 |
| `postings$baixada` | character | 2 | d1, d54 |
| `postings$santista` | character | 2 | d1, d54 |
| `postings$sua` | character | 19 | d1, d3, d4, d18, d24, d26, ... |
| `postings$populacao` | character | 2 | d1, d15 |
| `postings$censo` | character | 2 | d1, d21 |
| `postings$2022` | character | 2 | d1, d21 |
| `postings$era` | character | 7 | d1, d21, d25, d28, d30, d31, ... |
| `postings$329` | character | 1 | d1 |
| `postings$911` | character | 1 | d1 |
| `postings$habitantes` | character | 4 | d1, d11, d12, d39 |
| `postings$sendo` | character | 9 | d1, d4, d6, d8, d45, d51, ... |
| `postings$terceira` | character | 1 | d1 |
| `postings$mais` | character | 10 | d1, d2, d3, d4, d12, d18, ... |
| `postings$populosa` | character | 1 | d1 |
| `postings$litoral` | character | 6 | d1, d6, d18, d22, d37, d40 |
| `postings$paulista` | character | 6 | d1, d13, d22, d23, d42, d53 |
| `postings$atras` | character | 1 | d1 |
| `postings$apenas` | character | 1 | d1 |
| `postings$santos` | character | 8 | d1, d13, d15, d19, d21, d53, ... |
| `postings$praia` | character | 6 | d1, d3, d4, d19, d54, d55 |
| `postings$grande` | character | 6 | d1, d3, d19, d30, d54, d55 |
| `postings$area` | character | 2 | d1, d22 |
| `postings$territorial` | character | 1 | d1 |
| `postings$148` | character | 1 | d1 |
| `postings$151` | character | 1 | d1 |
| `postings$km2` | character | 1 | d1 |
| `postings$lhe` | character | 6 | d1, d8, d40, d43, d45, d46 |
| `postings$confere` | character | 1 | d1 |
| `postings$uma` | character | 21 | d1, d3, d4, d6, d11, d12, ... |
| `postings$densidade` | character | 1 | d1 |
| `postings$demografica` | character | 1 | d1 |
| `postings$2` | character | 5 | d1, d4, d21, d23, d46 |
| `postings$226` | character | 1 | d1 |
| `postings$86` | character | 1 | d1 |
| `postings$por` | character | 26 | d1, d2, d3, d5, d8, d11, ... |
| `postings$marca` | character | 2 | d2, d4 |
| `postings$inicio` | character | 4 | d2, d4, d10, d56 |
| `postings$efetivo` | character | 1 | d2 |
| `postings$colonizacao` | character | 3 | d2, d10, d25 |
| `postings$torna` | character | 1 | d2 |
| `postings$se` | character | 24 | d2, d3, d4, d6, d11, d12, ... |
| `postings$primeiro` | character | 6 | d2, d11, d24, d49, d52, d63 |
| `postings$nucleo` | character | 1 | d2 |
| `postings$institucionalizado` | character | 1 | d2 |
| `postings$todo` | character | 4 | d2, d8, d20, d37 |
| `postings$territorio` | character | 3 | d2, d25, d40 |
| `postings$estando` | character | 1 | d2 |
| `postings$entre` | character | 13 | d2, d3, d4, d6, d7, d11, ... |
| `postings$as` | character | 20 | d2, d7, d8, d9, d11, d14, ... |
| `postings$cidades` | character | 3 | d2, d3, d19 |
| `postings$antigas` | character | 2 | d2, d51 |
| `postings$continuadamente` | character | 1 | d2 |
| `postings$habitadas` | character | 1 | d2 |
| `postings$continente` | character | 5 | d2, d3, d7, d53, d54 |
| `postings$americano` | character | 2 | d2, d7 |
| `postings$fundada` | character | 2 | d2, d13 |
| `postings$1532` | character | 6 | d2, d7, d35, d37, d38, d40 |
| `postings$pelo` | character | 16 | d2, d3, d4, d6, d7, d15, ... |
| `postings$militar` | character | 3 | d2, d24, d63 |
| `postings$administrador` | character | 2 | d2, d24 |
| `postings$colonial` | character | 2 | d2, d24 |
| `postings$portugues` | character | 5 | d2, d6, d7, d24, d29 |
| `postings$martim` | character | 20 | d2, d7, d8, d9, d17, d24, ... |
| `postings$afonso` | character | 21 | d2, d7, d8, d9, d17, d24, ... |
| `postings$sousa` | character | 16 | d2, d7, d24, d25, d27, d28, ... |
| `postings$na` | character | 34 | d2, d3, d4, d7, d8, d9, ... |
| `postings$capitania` | character | 9 | d2, d4, d9, d17, d24, d25, ... |
| `postings$criacao` | character | 1 | d2 |
| `postings$vila` | character | 19 | d2, d3, d4, d7, d8, d11, ... |
| `postings$atendeu` | character | 1 | d2 |
| `postings$ordens` | character | 1 | d2 |
| `postings$rei` | character | 13 | d2, d25, d26, d30, d33, d34, ... |
| `postings$dom` | character | 1 | d2 |
| `postings$joao` | character | 12 | d2, d25, d27, d29, d30, d33, ... |
| `postings$iii` | character | 9 | d2, d25, d27, d30, d33, d40, ... |
| `postings$portugal` | character | 10 | d2, d25, d26, d30, d33, d43, ... |
| `postings$ilha` | character | 8 | d2, d5, d7, d11, d35, d53, ... |
| `postings$onde` | character | 11 | d2, d4, d6, d12, d26, d30, ... |
| `postings$estabeleceu` | character | 1 | d2 |
| `postings$havia` | character | 5 | d2, d4, d46, d48, d63 |
| `postings$sido` | character | 5 | d2, d4, d14, d26, d38 |
| `postings$descoberta` | character | 2 | d2, d5 |
| `postings$anteriormente` | character | 1 | d2 |
| `postings$1502` | character | 4 | d2, d5, d6, d35 |
| `postings$durante` | character | 5 | d2, d20, d38, d46, d61 |
| `postings$expedicao` | character | 7 | d2, d5, d7, d25, d34, d38, ... |
| `postings$gaspar` | character | 4 | d2, d5, d35, d43 |
| `postings$lemos` | character | 3 | d2, d5, d35 |
| `postings$americo` | character | 2 | d2, d5 |
| `postings$vespucio` | character | 2 | d2, d5 |
| `postings$batizaram` | character | 1 | d2 |
| `postings$homenagem` | character | 2 | d2, d35 |
| `postings$martir` | character | 4 | d2, d4, d5, d35 |
| `postings$tornando` | character | 3 | d2, d42, d47 |
| `postings$america` | character | 3 | d2, d25, d38 |
| `postings$portuguesa` | character | 9 | d2, d5, d10, d24, d25, d31, ... |
| `postings$22` | character | 4 | d2, d5, d7, d35 |
| `postings$agosto` | character | 2 | d2, d7 |
| `postings$realizou` | character | 1 | d2 |
| `postings$ali` | character | 2 | d2, d7 |
| `postings$eleicao` | character | 1 | d2 |
| `postings$qual` | character | 7 | d2, d4, d7, d27, d28, d34, ... |
| `postings$foram` | character | 13 | d2, d11, d12, d16, d36, d40, ... |
| `postings$escolhidos` | character | 1 | d2 |
| `postings$os` | character | 30 | d2, d3, d4, d6, d7, d8, ... |
| `postings$primeiros` | character | 1 | d2 |
| `postings$oficiais` | character | 1 | d2 |
| `postings$camara` | character | 3 | d2, d7, d36 |
| `postings$funcao` | character | 2 | d2, d34 |
| `postings$atualmente` | character | 2 | d2, d10 |
| `postings$equivalente` | character | 1 | d2 |
| `postings$ao` | character | 19 | d2, d3, d9, d13, d16, d20, ... |
| `postings$cargo` | character | 1 | d2 |
| `postings$vereador` | character | 1 | d2 |
| `postings$todos` | character | 4 | d2, d36, d45, d46 |
| `postings$esses` | character | 1 | d2 |
| `postings$marcos` | character | 1 | d2 |
| `postings$historicos` | character | 2 | d2, d4 |
| `postings$reconhecida` | character | 2 | d2, d4 |
| `postings$como` | character | 20 | d2, d4, d5, d6, d7, d10, ... |
| `postings$berco` | character | 3 | d2, d7, d17 |
| `postings$tambem` | character | 11 | d2, d3, d9, d19, d33, d36, ... |
| `postings$democracia` | character | 3 | d2, d7, d17 |
| `postings$americana` | character | 1 | d2 |
| `postings$tendo` | character | 5 | d2, d26, d50, d51, d58 |
| `postings$inclusive` | character | 2 | d2, d11 |
| `postings$servido` | character | 1 | d2 |
| `postings$inspiracao` | character | 1 | d2 |
| `postings$modelos` | character | 1 | d2 |
| `postings$democraticos` | character | 1 | d2 |
| `postings$posteriores` | character | 1 | d2 |
| `postings$dos` | character | 25 | d2, d4, d7, d10, d11, d14, ... |
| `postings$estados` | character | 1 | d2 |
| `postings$unidos` | character | 1 | d2 |
| `postings$pib` | character | 1 | d3 |
| `postings$6` | character | 4 | d3, d21, d46, d58 |
| `postings$bilhoes` | character | 1 | d3 |
| `postings$reais` | character | 2 | d3, d51 |
| `postings$economia` | character | 3 | d3, d12, d39 |
| `postings$baseada` | character | 1 | d3 |
| `postings$nos` | character | 6 | d3, d4, d11, d37, d51, d63 |
| `postings$servicos` | character | 1 | d3 |
| `postings$comercio` | character | 1 | d3 |
| `postings$turismo` | character | 2 | d3, d4 |
| `postings$boa` | character | 2 | d3, d46 |
| `postings$infraestrutura` | character | 1 | d3 |
| `postings$hoteleira` | character | 1 | d3 |
| `postings$gastronomica` | character | 1 | d3 |
| `postings$segundo` | character | 6 | d3, d18, d21, d43, d51, d52 |
| `postings$indice` | character | 1 | d3 |
| `postings$empreendedoras` | character | 1 | d3 |
| `postings$ice` | character | 1 | d3 |
| `postings$2023` | character | 1 | d3 |
| `postings$das` | character | 14 | d3, d11, d15, d18, d20, d25, ... |
| `postings$melhores` | character | 1 | d3 |
| `postings$empreender` | character | 1 | d3 |
| `postings$parte` | character | 4 | d3, d21, d38, d56 |
| `postings$estende` | character | 1 | d3 |
| `postings$duas` | character | 2 | d3, d15 |
| `postings$porcoes` | character | 1 | d3 |
| `postings$distintas` | character | 1 | d3 |
| `postings$bairro` | character | 1 | d3 |
| `postings$japui` | character | 4 | d3, d53, d54, d63 |
| `postings$ligado` | character | 2 | d3, d31 |
| `postings$ponte` | character | 13 | d3, d4, d53, d54, d55, d57, ... |
| `postings$construida` | character | 3 | d3, d4, d58 |
| `postings$1914` | character | 3 | d3, d53, d57 |
| `postings$engenheiro` | character | 3 | d3, d54, d56 |
| `postings$saturnino` | character | 4 | d3, d54, d55, d56 |
| `postings$brito` | character | 4 | d3, d54, d55, d56 |
| `postings$caminho` | character | 1 | d3 |
| `postings$ruma` | character | 1 | d3 |
| `postings$distrito` | character | 1 | d3 |
| `postings$samarita` | character | 1 | d3 |
| `postings$inclui` | character | 1 | d3 |
| `postings$bairros` | character | 1 | d3 |
| `postings$humaita` | character | 1 | d3 |
| `postings$parque` | character | 2 | d3, d4 |
| `postings$continental` | character | 1 | d3 |
| `postings$bandeiras` | character | 1 | d3 |
| `postings$jardim` | character | 1 | d3 |
| `postings$rio` | character | 6 | d3, d14, d34, d37, d42, d48 |
| `postings$branco` | character | 1 | d3 |
| `postings$nova` | character | 3 | d3, d15, d63 |
| `postings$ema` | character | 1 | d3 |
| `postings$quarentenario` | character | 1 | d3 |
| `postings$situados` | character | 1 | d3 |
| `postings$longo` | character | 1 | d3 |
| `postings$rodovia` | character | 1 | d3 |
| `postings$padre` | character | 4 | d3, d10, d41, d42 |
| `postings$manoel` | character | 1 | d3 |
| `postings$nobrega` | character | 2 | d3, d41 |
| `postings$cubatao` | character | 2 | d3, d19 |
| `postings$contrafortes` | character | 1 | d3 |
| `postings$serra` | character | 2 | d3, d11 |
| `postings$mar` | character | 9 | d3, d12, d33, d36, d43, d44, ... |
| `postings$estendendo` | character | 1 | d3 |
| `postings$ate` | character | 9 | d3, d19, d24, d26, d34, d37, ... |
| `postings$terra` | character | 2 | d3, d6 |
| `postings$indigena` | character | 1 | d3 |
| `postings$divisa` | character | 2 | d3, d19 |
| `postings$municipios` | character | 2 | d3, d18 |
| `postings$itanhaem` | character | 2 | d3, d17 |
| `postings$preserva` | character | 1 | d4 |
| `postings$diversos` | character | 1 | d4 |
| `postings$sitios` | character | 1 | d4 |
| `postings$edificios` | character | 2 | d4, d7 |
| `postings$construidos` | character | 1 | d4 |
| `postings$desde` | character | 5 | d4, d34, d40, d43, d59 |
| `postings$seculo` | character | 7 | d4, d6, d13, d18, d31, d51, ... |
| `postings$xvi` | character | 3 | d4, d6, d13 |
| `postings$quais` | character | 3 | d4, d14, d64 |
| `postings$testemunham` | character | 1 | d4 |
| `postings$processo` | character | 1 | d4 |
| `postings$ocupacao` | character | 1 | d4 |
| `postings$desenvolvimento` | character | 1 | d4 |
| `postings$pais` | character | 1 | d4 |
| `postings$eles` | character | 1 | d4 |
| `postings$destaca` | character | 1 | d4 |
| `postings$casa` | character | 5 | d4, d12, d30, d36, d45 |
| `postings$taipa` | character | 1 | d4 |
| `postings$1516` | character | 3 | d4, d25, d30 |
| `postings$1520` | character | 1 | d4 |
| `postings$cultural` | character | 1 | d4 |
| `postings$ha` | character | 2 | d4, d47 |
| `postings$apresentacoes` | character | 1 | d4 |
| `postings$teatro` | character | 1 | d4 |
| `postings$jose` | character | 5 | d4, d10, d19, d41, d42 |
| `postings$anchieta` | character | 3 | d4, d10, d42 |
| `postings$espaco` | character | 2 | d4, d8 |
| `postings$artisticas` | character | 1 | d4 |
| `postings$oficinas` | character | 1 | d4 |
| `postings$culturais` | character | 1 | d4 |
| `postings$homenageia` | character | 1 | d4 |
| `postings$jesuita` | character | 1 | d4 |
| `postings$pioneiro` | character | 1 | d4 |
| `postings$dramaturgia` | character | 1 | d4 |
| `postings$brasileira` | character | 3 | d4, d7, d34 |
| `postings$igreja` | character | 4 | d4, d7, d12, d21 |
| `postings$matriz` | character | 2 | d4, d12 |
| `postings$local` | character | 2 | d4, d19 |
| `postings$engenho` | character | 2 | d4, d16 |
| `postings$erasmos` | character | 1 | d4 |
| `postings$cultura` | character | 3 | d4, d9, d13 |
| `postings$canavieira` | character | 3 | d4, d9, d13 |
| `postings$nacional` | character | 1 | d4 |
| `postings$iniciou` | character | 2 | d4, d33 |
| `postings$biquinha` | character | 2 | d4, d10 |
| `postings$pensil` | character | 2 | d4, d53 |
| `postings$encenacao` | character | 1 | d4 |
| `postings$fundacao` | character | 1 | d4 |
| `postings$considerada` | character | 1 | d4 |
| `postings$guinness` | character | 1 | d4 |
| `postings$world` | character | 1 | d4 |
| `postings$records` | character | 1 | d4 |
| `postings$maior` | character | 3 | d4, d8, d48 |
| `postings$espetaculo` | character | 1 | d4 |
| `postings$teatral` | character | 1 | d4 |
| `postings$realizado` | character | 2 | d4, d59 |
| `postings$areia` | character | 1 | d4 |
| `postings$mundo` | character | 2 | d4, d62 |
| `postings$abriga` | character | 1 | d4 |
| `postings$atletico` | character | 1 | d4 |
| `postings$clube` | character | 1 | d4 |
| `postings$devido` | character | 4 | d4, d9, d17, d63 |
| `postings$importancia` | character | 1 | d4 |
| `postings$historica` | character | 2 | d4, d10 |
| `postings$politica` | character | 2 | d4, d31 |
| `postings$alem` | character | 3 | d4, d19, d36 |
| `postings$suas` | character | 4 | d4, d10, d27, d58 |
| `postings$belezas` | character | 1 | d4 |
| `postings$naturais` | character | 1 | d4 |
| `postings$praias` | character | 1 | d4 |
| `postings$culinaria` | character | 1 | d4 |
| `postings$caicara` | character | 1 | d4 |
| `postings$importante` | character | 1 | d4 |
| `postings$destino` | character | 1 | d4 |
| `postings$turistico` | character | 1 | d4 |
| `postings$procurada` | character | 1 | d4 |
| `postings$especial` | character | 1 | d4 |
| `postings$setores` | character | 1 | d4 |
| `postings$historico` | character | 1 | d4 |
| `postings$arquitetonico` | character | 1 | d4 |
| `postings$ecoturismo` | character | 1 | d4 |
| `postings$sol` | character | 2 | d4, d46 |
| `postings$anualmente` | character | 1 | d4 |
| `postings$recebe` | character | 1 | d4 |
| `postings$milhoes` | character | 2 | d4, d63 |
| `postings$turistas` | character | 1 | d4 |
| `postings$gohayo` | character | 1 | d5 |
| `postings$janeiro` | character | 5 | d5, d7, d14, d35, d37 |
| `postings$pela` | character | 6 | d5, d22, d40, d55, d61, d63 |
| `postings$comandada` | character | 2 | d5, d29 |
| `postings$ser` | character | 8 | d5, d6, d12, d19, d35, d59, ... |
| `postings$dia` | character | 6 | d5, d7, d26, d35, d43, d61 |
| `postings$santo` | character | 4 | d5, d25, d35, d42 |
| `postings$saragoca` | character | 1 | d5 |
| `postings$batizada` | character | 1 | d5 |
| `postings$nas` | character | 6 | d6, d7, d17, d27, d42, d46 |
| `postings$primeiras` | character | 5 | d6, d7, d9, d53, d58 |
| `postings$decadas` | character | 1 | d6 |
| `postings$existiu` | character | 1 | d6 |
| `postings$hoje` | character | 3 | d6, d12, d39 |
| `postings$centro` | character | 1 | d6 |
| `postings$povoado` | character | 4 | d6, d10, d29, d48 |
| `postings$fundado` | character | 1 | d6 |
| `postings$enigmatico` | character | 1 | d6 |
| `postings$bacharel` | character | 2 | d6, d38 |
| `postings$cananeia` | character | 2 | d6, d38 |
| `postings$degredado` | character | 1 | d6 |
| `postings$fixou` | character | 2 | d6, d42 |
| `postings$provavelmente` | character | 1 | d6 |
| `postings$1498` | character | 1 | d6 |
| `postings$1526` | character | 1 | d6 |
| `postings$essa` | character | 5 | d6, d12, d20, d33, d39 |
| `postings$povoacao` | character | 2 | d6, d12 |
| `postings$descrita` | character | 1 | d6 |
| `postings$dez` | character | 2 | d6, d57 |
| `postings$ou` | character | 5 | d6, d21, d42, d47, d57 |
| `postings$doze` | character | 1 | d6 |
| `postings$casas` | character | 3 | d6, d7, d12 |
| `postings$feita` | character | 1 | d6 |
| `postings$pedra` | character | 1 | d6 |
| `postings$seus` | character | 7 | d6, d11, d13, d15, d16, d36, ... |
| `postings$telhados` | character | 1 | d6 |
| `postings$torre` | character | 1 | d6 |
| `postings$defesa` | character | 2 | d6, d11 |
| `postings$contra` | character | 5 | d6, d8, d11, d32, d44 |
| `postings$indios` | character | 5 | d6, d8, d10, d11, d41 |
| `postings$tempo` | character | 5 | d6, d9, d26, d27, d30 |
| `postings$necessidade` | character | 1 | d6 |
| `postings$estao` | character | 1 | d6 |
| `postings$providos` | character | 1 | d6 |
| `postings$coisas` | character | 2 | d6, d30 |
| `postings$galinhas` | character | 1 | d6 |
| `postings$espanha` | character | 4 | d6, d31, d32, d49 |
| `postings$porcos` | character | 1 | d6 |
| `postings$muita` | character | 3 | d6, d30, d36 |
| `postings$abundancia` | character | 1 | d6 |
| `postings$hortalicas` | character | 1 | d6 |
| `postings$dessa` | character | 1 | d6 |
| `postings$forma` | character | 3 | d6, d21, d52 |
| `postings$pode` | character | 6 | d6, d19, d30, d31, d46, d58 |
| `postings$considerado` | character | 1 | d6 |
| `postings$verdadeiro` | character | 1 | d6 |
| `postings$fundador` | character | 1 | d6 |
| `postings$1530` | character | 5 | d7, d25, d29, d30, d33 |
| `postings$liderada` | character | 2 | d7, d55 |
| `postings$fidalgo` | character | 5 | d7, d30, d33, d36, d48 |
| `postings$explorou` | character | 1 | d7 |
| `postings$costa` | character | 6 | d7, d25, d34, d36, d40, d46 |
| `postings$grupo` | character | 2 | d7, d16 |
| `postings$colonos` | character | 1 | d7 |
| `postings$portugueses` | character | 5 | d7, d31, d37, d38, d45 |
| `postings$desembarcaram` | character | 1 | d7 |
| `postings$ordenou` | character | 1 | d7 |
| `postings$construcao` | character | 3 | d7, d53, d56 |
| `postings$pelourinho` | character | 2 | d7, d12 |
| `postings$fortim` | character | 1 | d7 |
| `postings$estaleiro` | character | 1 | d7 |
| `postings$orgaos` | character | 1 | d7 |
| `postings$administrativos` | character | 1 | d7 |
| `postings$assim` | character | 3 | d7, d31, d49 |
| `postings$fundando` | character | 1 | d7 |
| `postings$sob` | character | 3 | d7, d40, d47 |
| `postings$oposicao` | character | 2 | d7, d8 |
| `postings$indigenas` | character | 1 | d7 |
| `postings$locais` | character | 3 | d7, d16, d64 |
| `postings$ocorreram` | character | 2 | d7, d59 |
| `postings$eleicoes` | character | 1 | d7 |
| `postings$escolher` | character | 1 | d7 |
| `postings$membros` | character | 2 | d7, d47 |
| `postings$municipal` | character | 2 | d7, d63 |
| `postings$motivo` | character | 1 | d7 |
| `postings$conhecida` | character | 1 | d7 |
| `postings$americas` | character | 2 | d7, d17 |
| `postings$sustentou` | character | 1 | d8 |
| `postings$tres` | character | 1 | d8 |
| `postings$anos` | character | 8 | d8, d11, d17, d32, d35, d36, ... |
| `postings$continuas` | character | 1 | d8 |
| `postings$guerras` | character | 1 | d8 |
| `postings$barbaros` | character | 1 | d8 |
| `postings$carijos` | character | 2 | d8, d11 |
| `postings$guaianases` | character | 1 | d8 |
| `postings$tamoios` | character | 2 | d8, d14 |
| `postings$conquistou` | character | 1 | d8 |
| `postings$apesar` | character | 1 | d8 |
| `postings$neles` | character | 1 | d8 |
| `postings$achou` | character | 2 | d8, d46 |
| `postings$necessario` | character | 1 | d8 |
| `postings$valer` | character | 1 | d8 |
| `postings$seu` | character | 11 | d8, d18, d19, d25, d27, d31, ... |
| `postings$esforco` | character | 1 | d8 |
| `postings$contumacia` | character | 1 | d8 |
| `postings$resistiu` | character | 1 | d8 |
| `postings$porque` | character | 3 | d8, d30, d43 |
| `postings$posse` | character | 3 | d8, d34, d45 |
| `postings$liberdade` | character | 1 | d8 |
| `postings$natural` | character | 3 | d8, d12, d49 |
| `postings$reputavam` | character | 1 | d8 |
| `postings$menos` | character | 1 | d8 |
| `postings$vidas` | character | 1 | d8 |
| `postings$sujeicao` | character | 1 | d8 |
| `postings$poder` | character | 2 | d8, d31 |
| `postings$estranho` | character | 1 | d8 |
| `postings$mas` | character | 7 | d8, d9, d15, d17, d30, d45, ... |
| `postings$vencidos` | character | 1 | d8 |
| `postings$varios` | character | 2 | d8, d51 |
| `postings$encontros` | character | 1 | d8 |
| `postings$cedeu` | character | 1 | d8 |
| `postings$rebeldia` | character | 1 | d8 |
| `postings$merecimento` | character | 1 | d8 |
| `postings$gloria` | character | 1 | d8 |
| `postings$fundasse` | character | 1 | d8 |
| `postings$s` | character | 5 | d8, d36, d46, d49, d50 |
| `postings$introduziu` | character | 1 | d9 |
| `postings$ela` | character | 3 | d9, d49, d64 |
| `postings$durou` | character | 1 | d9 |
| `postings$pouco` | character | 2 | d9, d12 |
| `postings$condicoes` | character | 3 | d9, d45, d60 |
| `postings$geograficas` | character | 1 | d9 |
| `postings$desfavoraveis` | character | 1 | d9 |
| `postings$cabecas` | character | 1 | d9 |
| `postings$gado` | character | 2 | d9, d49 |
| `postings$chegarem` | character | 1 | d9 |
| `postings$vieram` | character | 2 | d9, d45 |
| `postings$arquipelago` | character | 1 | d9 |
| `postings$cabo` | character | 1 | d9 |
| `postings$verde` | character | 1 | d9 |
| `postings$1534` | character | 3 | d9, d11, d49 |
| `postings$contribuiu` | character | 3 | d10, d18, d27 |
| `postings$catequizacao` | character | 1 | d10 |
| `postings$harmonizacao` | character | 1 | d10 |
| `postings$atraves` | character | 2 | d10, d18 |
| `postings$colegio` | character | 2 | d10, d41 |
| `postings$vicentino` | character | 1 | d10 |
| `postings$ele` | character | 5 | d10, d15, d36, d46, d47 |
| `postings$ministrou` | character | 1 | d10 |
| `postings$aulas` | character | 2 | d10, d30 |
| `postings$catecismo` | character | 1 | d10 |
| `postings$junto` | character | 1 | d10 |
| `postings$denominada` | character | 1 | d10 |
| `postings$bica` | character | 1 | d10 |
| `postings$fonte` | character | 3 | d10, d12, d39 |
| `postings$afetivamente` | character | 1 | d10 |
| `postings$guerra` | character | 4 | d11, d33, d36, d38 |
| `postings$iguape` | character | 2 | d11, d38 |
| `postings$ocorreu` | character | 2 | d11, d12 |
| `postings$1536` | character | 3 | d11, d38, d46 |
| `postings$virtude` | character | 1 | d11 |
| `postings$interpretacao` | character | 1 | d11 |
| `postings$particular` | character | 1 | d11 |
| `postings$tratado` | character | 1 | d11 |
| `postings$tordesilhas` | character | 1 | d11 |
| `postings$alguns` | character | 4 | d11, d36, d47, d64 |
| `postings$espanhois` | character | 2 | d11, d38 |
| `postings$liderados` | character | 2 | d11, d55 |
| `postings$ruy` | character | 1 | d11 |
| `postings$garcia` | character | 2 | d11, d46 |
| `postings$moschera` | character | 1 | d11 |
| `postings$instalaram` | character | 1 | d11 |
| `postings$arredores` | character | 1 | d11 |
| `postings$provincia` | character | 1 | d11 |
| `postings$vicentina` | character | 2 | d11, d18 |
| `postings$aliados` | character | 2 | d11, d46 |
| `postings$aos` | character | 4 | d11, d16, d36, d49 |
| `postings$fundaram` | character | 2 | d11, d41 |
| `postings$i` | character | 3 | d11, d25, d27 |
| `postings$caa` | character | 1 | d11 |
| `postings$venceram` | character | 1 | d11 |
| `postings$algumas` | character | 2 | d11, d31 |
| `postings$batalhas` | character | 1 | d11 |
| `postings$corsarios` | character | 3 | d11, d40, d44 |
| `postings$franceses` | character | 5 | d11, d25, d32, d34, d40 |
| `postings$quando` | character | 8 | d11, d12, d35, d36, d45, d48, ... |
| `postings$forcas` | character | 1 | d11 |
| `postings$luso` | character | 1 | d11 |
| `postings$brasileiras` | character | 1 | d11 |
| `postings$enfrentaram` | character | 1 | d11 |
| `postings$contingente` | character | 1 | d11 |
| `postings$espanhol` | character | 1 | d11 |
| `postings$prontamente` | character | 1 | d11 |
| `postings$derrotadas` | character | 1 | d11 |
| `postings$contrapartida` | character | 1 | d11 |
| `postings$seguidores` | character | 1 | d11 |
| `postings$embarcaram` | character | 1 | d11 |
| `postings$navio` | character | 1 | d11 |
| `postings$frances` | character | 1 | d11 |
| `postings$atacaram` | character | 1 | d11 |
| `postings$saquearam` | character | 1 | d11 |
| `postings$incendiaram` | character | 1 | d11 |
| `postings$levando` | character | 3 | d11, d46, d63 |
| `postings$livro` | character | 3 | d11, d36, d51 |
| `postings$tombo` | character | 1 | d11 |
| `postings$deixando` | character | 1 | d11 |
| `postings$praticamente` | character | 1 | d11 |
| `postings$destruida` | character | 1 | d11 |
| `postings$matando` | character | 1 | d11 |
| `postings$dois` | character | 5 | d11, d17, d37, d40, d42 |
| `postings$tercos` | character | 1 | d11 |
| `postings$entanto` | character | 2 | d11, d63 |
| `postings$incursoes` | character | 1 | d11 |
| `postings$sistematicas` | character | 1 | d11 |
| `postings$arregimentaram` | character | 1 | d11 |
| `postings$outros` | character | 4 | d11, d36, d47, d53 |
| `postings$rivais` | character | 1 | d11 |
| `postings$acima` | character | 2 | d11, d58 |
| `postings$cf` | character | 1 | d11 |
| `postings$donato` | character | 1 | d11 |
| `postings$p` | character | 1 | d11 |
| `postings$89` | character | 1 | d11 |
| `postings$forcados` | character | 1 | d11 |
| `postings$retirarem` | character | 1 | d11 |
| `postings$santa` | character | 1 | d11 |
| `postings$catarina` | character | 4 | d11, d29, d36, d49 |
| `postings$depois` | character | 8 | d11, d17, d26, d30, d36, d37, ... |
| `postings$buenos` | character | 1 | d11 |
| `postings$aires` | character | 1 | d11 |
| `postings$final` | character | 3 | d12, d39, d48 |
| `postings$ano` | character | 7 | d12, d20, d36, d38, d39, d45, ... |
| `postings$1541` | character | 3 | d12, d39, d46 |
| `postings$pior` | character | 1 | d12 |
| `postings$desastre` | character | 1 | d12 |
| `postings$onda` | character | 2 | d12, d39 |
| `postings$gigante` | character | 2 | d12, d39 |
| `postings$possivel` | character | 2 | d12, d39 |
| `postings$maremoto` | character | 2 | d12, d39 |
| `postings$danificou` | character | 2 | d12, d39 |
| `postings$seriamente` | character | 2 | d12, d39 |
| `postings$destruindo` | character | 1 | d12 |
| `postings$abrigava` | character | 2 | d12, d39 |
| `postings$total` | character | 2 | d12, d39 |
| `postings$150` | character | 2 | d12, d39 |
| `postings$porto` | character | 3 | d12, d18, d39 |
| `postings$funcionava` | character | 2 | d12, d39 |
| `postings$mudou` | character | 2 | d12, d39 |
| `postings$esta` | character | 4 | d12, d39, d54, d62 |
| `postings$conselho` | character | 4 | d12, d33, d47, d48 |
| `postings$cadeia` | character | 1 | d12 |
| `postings$estaleiros` | character | 1 | d12 |
| `postings$inumeras` | character | 1 | d12 |
| `postings$destruidos` | character | 1 | d12 |
| `postings$teve` | character | 4 | d12, d27, d29, d32 |
| `postings$reconstruida` | character | 1 | d12 |
| `postings$distante` | character | 1 | d12 |
| `postings$meados` | character | 1 | d13 |
| `postings$entrou` | character | 3 | d13, d46, d50 |
| `postings$decadencia` | character | 2 | d13, d18 |
| `postings$deve` | character | 1 | d13 |
| `postings$fracasso` | character | 1 | d13 |
| `postings$progresso` | character | 1 | d13 |
| `postings$isso` | character | 8 | d13, d25, d26, d30, d31, d43, ... |
| `postings$muitos` | character | 2 | d13, d36 |
| `postings$moradores` | character | 5 | d13, d16, d37, d54, d64 |
| `postings$migraram` | character | 1 | d13 |
| `postings$planalto` | character | 2 | d13, d41 |
| `postings$sobretudo` | character | 1 | d13 |
| `postings$piratininga` | character | 3 | d13, d41, d49 |
| `postings$pelos` | character | 4 | d13, d36, d46, d54 |
| `postings$jesuitas` | character | 2 | d13, d41 |
| `postings$1554` | character | 3 | d13, d41, d42 |
| `postings$volta` | character | 2 | d14, d47 |
| `postings$1560` | character | 1 | d14 |
| `postings$sofreu` | character | 1 | d14 |
| `postings$ataque` | character | 2 | d14, d15 |
| `postings$macico` | character | 1 | d14 |
| `postings$aproveitaram` | character | 1 | d14 |
| `postings$ausencia` | character | 1 | d14 |
| `postings$homens` | character | 4 | d14, d15, d16, d36 |
| `postings$haviam` | character | 3 | d14, d36, d37 |
| `postings$chamados` | character | 1 | d14 |
| `postings$missao` | character | 2 | d14, d37 |
| `postings$socorro` | character | 1 | d14 |
| `postings$queimaram` | character | 1 | d14 |
| `postings$plantacoes` | character | 1 | d14 |
| `postings$quebraram` | character | 1 | d14 |
| `postings$ferramentas` | character | 1 | d14 |
| `postings$utensilios` | character | 1 | d14 |
| `postings$agricolas` | character | 1 | d14 |
| `postings$destruiram` | character | 1 | d14 |
| `postings$fazendas` | character | 1 | d14 |
| `postings$dezembro` | character | 3 | d15, d43, d46 |
| `postings$1591` | character | 1 | d15 |
| `postings$saqueada` | character | 1 | d15 |
| `postings$pirata` | character | 2 | d15, d16 |
| `postings$ingles` | character | 1 | d15 |
| `postings$thomas` | character | 1 | d15 |
| `postings$cavendish` | character | 1 | d15 |
| `postings$retornava` | character | 1 | d15 |
| `postings$roubaram` | character | 1 | d15 |
| `postings$atearam` | character | 1 | d15 |
| `postings$fogo` | character | 1 | d15 |
| `postings$diversas` | character | 2 | d15, d61 |
| `postings$partes` | character | 2 | d15, d30 |
| `postings$causando` | character | 1 | d15 |
| `postings$enormes` | character | 1 | d15 |
| `postings$prejuizos` | character | 1 | d15 |
| `postings$fugiu` | character | 1 | d15 |
| `postings$temporal` | character | 1 | d15 |
| `postings$impediu` | character | 1 | d15 |
| `postings$seguir` | character | 1 | d15 |
| `postings$viagem` | character | 2 | d15, d43 |
| `postings$retornou` | character | 5 | d15, d25, d26, d37, d47 |
| `postings$tentou` | character | 1 | d15 |
| `postings$investida` | character | 1 | d15 |
| `postings$porem` | character | 3 | d15, d30, d46 |
| `postings$desta` | character | 3 | d15, d28, d36 |
| `postings$vez` | character | 3 | d15, d55, d62 |
| `postings$vilas` | character | 1 | d15 |
| `postings$estava` | character | 5 | d15, d57, d58, d63, d64 |
| `postings$preparada` | character | 1 | d15 |
| `postings$repelido` | character | 1 | d15 |
| `postings$1615` | character | 1 | d16 |
| `postings$outro` | character | 1 | d16 |
| `postings$atacou` | character | 1 | d16 |
| `postings$holandes` | character | 1 | d16 |
| `postings$joris` | character | 1 | d16 |
| `postings$van` | character | 1 | d16 |
| `postings$spielbergen` | character | 1 | d16 |
| `postings$dividiu` | character | 1 | d16 |
| `postings$enquanto` | character | 3 | d16, d62, d64 |
| `postings$saqueava` | character | 1 | d16 |
| `postings$obter` | character | 1 | d16 |
| `postings$alimentos` | character | 1 | d16 |
| `postings$restante` | character | 1 | d16 |
| `postings$invadia` | character | 1 | d16 |
| `postings$vizinha` | character | 1 | d16 |
| `postings$piratas` | character | 1 | d16 |
| `postings$ocuparam` | character | 1 | d16 |
| `postings$entraram` | character | 1 | d16 |
| `postings$luta` | character | 1 | d16 |
| `postings$invasores` | character | 1 | d16 |
| `postings$expulsos` | character | 1 | d16 |
| `postings$vida` | character | 5 | d16, d27, d28, d47, d48 |
| `postings$poucos` | character | 1 | d16 |
| `postings$voltou` | character | 1 | d16 |
| `postings$normal` | character | 1 | d16 |
| `postings$1624` | character | 1 | d17 |
| `postings$disputas` | character | 1 | d17 |
| `postings$descendentes` | character | 1 | d17 |
| `postings$sede` | character | 1 | d17 |
| `postings$transferida` | character | 1 | d17 |
| `postings$recuperou` | character | 2 | d17, d48 |
| `postings$titulo` | character | 1 | d17 |
| `postings$1679` | character | 1 | d17 |
| `postings$perdeu` | character | 3 | d17, d38, d51 |
| `postings$enciclopedia` | character | 1 | d18 |
| `postings$brasileiros` | character | 1 | d18 |
| `postings$seculos` | character | 2 | d18, d51 |
| `postings$resistira` | character | 1 | d18 |
| `postings$todas` | character | 1 | d18 |
| `postings$vicissitudes` | character | 1 | d18 |
| `postings$numa` | character | 1 | d18 |
| `postings$soberana` | character | 1 | d18 |
| `postings$vontade` | character | 1 | d18 |
| `postings$sobreviver` | character | 1 | d18 |
| `postings$venceu` | character | 1 | d18 |
| `postings$propria` | character | 1 | d18 |
| `postings$ingressou` | character | 1 | d18 |
| `postings$xx` | character | 2 | d18, d56 |
| `postings$aquilo` | character | 1 | d18 |
| `postings$fortemente` | character | 1 | d18 |
| `postings$declinio` | character | 1 | d18 |
| `postings$inadaptacao` | character | 1 | d18 |
| `postings$comercial` | character | 1 | d18 |
| `postings$aliado` | character | 1 | d18 |
| `postings$suavidade` | character | 1 | d18 |
| `postings$clima` | character | 1 | d18 |
| `postings$deu` | character | 1 | d18 |
| `postings$impulso` | character | 1 | d18 |
| `postings$urbe` | character | 1 | d18 |
| `postings$transformando` | character | 1 | d18 |
| `postings$joias` | character | 1 | d18 |
| `postings$nosso` | character | 1 | d18 |
| `postings$morro` | character | 3 | d19, d53, d54 |
| `postings$voturua` | character | 1 | d19 |
| `postings$acidente` | character | 1 | d19 |
| `postings$geografico` | character | 1 | d19 |
| `postings$explorado` | character | 1 | d19 |
| `postings$pratica` | character | 1 | d19 |
| `postings$voo` | character | 1 | d19 |
| `postings$livre` | character | 1 | d19 |
| `postings$tem` | character | 3 | d19, d46, d58 |
| `postings$acesso` | character | 1 | d19 |
| `postings$partir` | character | 1 | d19 |
| `postings$menino` | character | 1 | d19 |
| `postings$permite` | character | 1 | d19 |
| `postings$visao` | character | 1 | d19 |
| `postings$dessas` | character | 1 | d19 |
| `postings$guaruja` | character | 1 | d19 |
| `postings$conhecido` | character | 2 | d19, d42 |
| `postings$asa` | character | 1 | d19 |
| `postings$delta` | character | 1 | d19 |
| `postings$acessado` | character | 1 | d19 |
| `postings$meio` | character | 2 | d19, d27 |
| `postings$teleferico` | character | 1 | d19 |
| `postings$localizado` | character | 1 | d19 |
| `postings$orla` | character | 1 | d19 |
| `postings$itarare` | character | 1 | d19 |
| `postings$caracteristicas` | character | 1 | d20 |
| `postings$alta` | character | 1 | d20 |
| `postings$taxa` | character | 1 | d20 |
| `postings$umidade` | character | 1 | d20 |
| `postings$relativa` | character | 1 | d20 |
| `postings$sempre` | character | 2 | d20, d45 |
| `postings$superior` | character | 1 | d20 |
| `postings$oitenta` | character | 2 | d20, d36 |
| `postings$cento` | character | 1 | d20 |
| `postings$tao` | character | 1 | d20 |
| `postings$elevada` | character | 1 | d20 |
| `postings$resulta` | character | 1 | d20 |
| `postings$intensa` | character | 1 | d20 |
| `postings$evaporacao` | character | 1 | d20 |
| `postings$constantes` | character | 1 | d20 |
| `postings$inversoes` | character | 1 | d20 |
| `postings$massa` | character | 1 | d20 |
| `postings$ar` | character | 1 | d20 |
| `postings$origem` | character | 4 | d20, d31, d41, d51 |
| `postings$polar` | character | 1 | d20 |
| `postings$associado` | character | 1 | d20 |
| `postings$relevo` | character | 1 | d20 |
| `postings$escarpado` | character | 1 | d20 |
| `postings$temperaturas` | character | 1 | d20 |
| `postings$medias` | character | 1 | d20 |
| `postings$verao` | character | 1 | d20 |
| `postings$torno` | character | 1 | d20 |
| `postings$24` | character | 3 | d20, d46, d57 |
| `postings$graus` | character | 1 | d20 |
| `postings$celsius` | character | 1 | d20 |
| `postings$inverno` | character | 2 | d20, d32 |
| `postings$dezessete` | character | 1 | d20 |
| `postings$cristianismo` | character | 1 | d21 |
| `postings$faz` | character | 2 | d21, d56 |
| `postings$presente` | character | 1 | d21 |
| `postings$seguinte` | character | 2 | d21, d52 |
| `postings$catolica` | character | 1 | d21 |
| `postings$diocese` | character | 1 | d21 |
| `postings$igrejas` | character | 1 | d21 |
| `postings$protestantes` | character | 1 | d21 |
| `postings$historicas` | character | 1 | d21 |
| `postings$pentecostais` | character | 1 | d21 |
| `postings$neopentecostais` | character | 1 | d21 |
| `postings$encontram` | character | 1 | d21 |
| `postings$assembleia` | character | 1 | d21 |
| `postings$deus` | character | 1 | d21 |
| `postings$ministerio` | character | 1 | d21 |
| `postings$belem` | character | 1 | d21 |
| `postings$congregacao` | character | 1 | d21 |
| `postings$crista` | character | 1 | d21 |
| `postings$composicao` | character | 1 | d21 |
| `postings$religiosa` | character | 1 | d21 |
| `postings$45` | character | 1 | d21 |
| `postings$72` | character | 1 | d21 |
| `postings$catolicos` | character | 1 | d21 |
| `postings$27` | character | 2 | d21, d63 |
| `postings$92` | character | 1 | d21 |
| `postings$evangelicos` | character | 1 | d21 |
| `postings$3` | character | 3 | d21, d23, d46 |
| `postings$42` | character | 2 | d21, d36 |
| `postings$espiritas` | character | 1 | d21 |
| `postings$39` | character | 1 | d21 |
| `postings$umbandistas` | character | 1 | d21 |
| `postings$candomblecistas` | character | 1 | d21 |
| `postings$0` | character | 1 | d21 |
| `postings$01` | character | 1 | d21 |
| `postings$religiao` | character | 1 | d21 |
| `postings$tradicional` | character | 2 | d21, d34 |
| `postings$57` | character | 1 | d21 |
| `postings$outras` | character | 3 | d21, d30, d46 |
| `postings$religioes` | character | 1 | d21 |
| `postings$13` | character | 1 | d21 |
| `postings$8` | character | 1 | d21 |
| `postings$irreligiosos` | character | 1 | d21 |
| `postings$06` | character | 1 | d21 |
| `postings$desconhecidos` | character | 1 | d21 |
| `postings$1` | character | 4 | d21, d23, d31, d46 |
| `postings$nao` | character | 8 | d21, d25, d31, d34, d45, d51, ... |
| `postings$declarados` | character | 1 | d21 |
| `postings$sistema` | character | 1 | d22 |
| `postings$telefones` | character | 1 | d22 |
| `postings$automaticos` | character | 1 | d22 |
| `postings$inaugurado` | character | 1 | d22 |
| `postings$1962` | character | 1 | d22 |
| `postings$cia` | character | 2 | d22, d55 |
| `postings$telefonica` | character | 1 | d22 |
| `postings$ja` | character | 6 | d22, d27, d30, d36, d43, d46 |
| `postings$discagem` | character | 1 | d22 |
| `postings$direta` | character | 1 | d22 |
| `postings$distancia` | character | 1 | d22 |
| `postings$ddd` | character | 1 | d22 |
| `postings$implantado` | character | 1 | d22 |
| `postings$1974` | character | 1 | d22 |
| `postings$telecomunicacoes` | character | 1 | d22 |
| `postings$telesp` | character | 1 | d22 |
| `postings$codigo` | character | 1 | d22 |
| `postings$0132` | character | 1 | d22 |
| `postings$universidade` | character | 1 | d23 |
| `postings$estadual` | character | 1 | d23 |
| `postings$unesp` | character | 1 | d23 |
| `postings$possui` | character | 1 | d23 |
| `postings$curso` | character | 1 | d23 |
| `postings$graduacao` | character | 1 | d23 |
| `postings$ciencias` | character | 1 | d23 |
| `postings$biologicas` | character | 1 | d23 |
| `postings$pos` | character | 1 | d23 |
| `postings$stricto` | character | 1 | d23 |
| `postings$sensu` | character | 1 | d23 |
| `postings$pesquisa` | character | 1 | d23 |
| `postings$consolidada` | character | 1 | d23 |
| `postings$quatro` | character | 7 | d23, d29, d32, d42, d43, d46, ... |
| `postings$linhas` | character | 1 | d23 |
| `postings$bioquimica` | character | 1 | d23 |
| `postings$biologia` | character | 1 | d23 |
| `postings$molecular` | character | 1 | d23 |
| `postings$moleculas` | character | 1 | d23 |
| `postings$biologicamente` | character | 1 | d23 |
| `postings$ativas` | character | 1 | d23 |
| `postings$organismos` | character | 1 | d23 |
| `postings$aquaticos` | character | 1 | d23 |
| `postings$riparios` | character | 1 | d23 |
| `postings$costeiros` | character | 1 | d23 |
| `postings$populacional` | character | 1 | d23 |
| `postings$pesqueira` | character | 1 | d23 |
| `postings$aquicultura` | character | 1 | d23 |
| `postings$sustentavel` | character | 1 | d23 |
| `postings$4` | character | 3 | d23, d51, d58 |
| `postings$processos` | character | 1 | d23 |
| `postings$ecossistemicos` | character | 1 | d23 |
| `postings$gestao` | character | 1 | d23 |
| `postings$ecossistemas` | character | 1 | d23 |
| `postings$vicosa` | character | 1 | d24 |
| `postings$c` | character | 1 | d24 |
| `postings$1500` | character | 1 | d24 |
| `postings$lisboa` | character | 6 | d24, d26, d36, d40, d49, d50 |
| `postings$21` | character | 3 | d24, d26, d57 |
| `postings$julho` | character | 2 | d24, d26 |
| `postings$1564` | character | 2 | d24, d26 |
| `postings$nobre` | character | 1 | d24 |
| `postings$1533` | character | 4 | d24, d25, d43, d44 |
| `postings$morte` | character | 3 | d24, d26, d46 |
| `postings$donatario` | character | 3 | d24, d40, d48 |
| `postings$1542` | character | 4 | d24, d26, d44, d46 |
| `postings$1545` | character | 4 | d24, d26, d46, d47 |
| `postings$governador` | character | 6 | d24, d26, d36, d45, d46, d63 |
| `postings$india` | character | 7 | d24, d26, d29, d43, d45, d46, ... |
| `postings$filho` | character | 5 | d25, d27, d28, d30, d36 |
| `postings$primogenito` | character | 1 | d25 |
| `postings$lopo` | character | 2 | d25, d29 |
| `postings$alcaide` | character | 4 | d25, d29, d30, d48 |
| `postings$mor` | character | 9 | d25, d26, d29, d30, d36, d43, ... |
| `postings$braganca` | character | 3 | d25, d29, d30 |
| `postings$passou` | character | 4 | d25, d30, d31, d50 |
| `postings$servico` | character | 4 | d25, d30, d32, d33 |
| `postings$manuel` | character | 3 | d25, d30, d41 |
| `postings$incumbido` | character | 1 | d25 |
| `postings$comandar` | character | 1 | d25 |
| `postings$armada` | character | 6 | d25, d26, d29, d33, d36, d43 |
| `postings$haveria` | character | 1 | d25 |
| `postings$expulsar` | character | 2 | d25, d34 |
| `postings$iniciar` | character | 1 | d25 |
| `postings$efetiva` | character | 1 | d25 |
| `postings$nessa` | character | 1 | d25 |
| `postings$fundou` | character | 3 | d25, d35, d37 |
| `postings$irmao` | character | 6 | d25, d27, d29, d33, d36, d46 |
| `postings$pero` | character | 2 | d25, d29 |
| `postings$lopes` | character | 3 | d25, d29, d36 |
| `postings$recebeu` | character | 3 | d25, d30, d40 |
| `postings$donatarias` | character | 1 | d25 |
| `postings$santana` | character | 1 | d25 |
| `postings$amaro` | character | 2 | d25, d42 |
| `postings$itamaraca` | character | 1 | d25 |
| `postings$partiu` | character | 3 | d25, d46, d49 |
| `postings$apos` | character | 2 | d25, d26 |
| `postings$algum` | character | 2 | d26, d30 |
| `postings$nomeado` | character | 4 | d26, d44, d46, d50 |
| `postings$capitao` | character | 7 | d26, d29, d36, d40, d43, d44, ... |
| `postings$reino` | character | 4 | d26, d45, d46, d51 |
| `postings$posto` | character | 2 | d26, d43 |
| `postings$exerceu` | character | 1 | d26 |
| `postings$1539` | character | 1 | d26 |
| `postings$conselheiro` | character | 1 | d26 |
| `postings$data` | character | 1 | d26 |
| `postings$faleceu` | character | 2 | d26, d36 |
| `postings$sepultado` | character | 1 | d26 |
| `postings$convento` | character | 1 | d26 |
| `postings$francisco` | character | 4 | d26, d36, d46, d55 |
| `postings$descendia` | character | 2 | d27, d31 |
| `postings$chichorro` | character | 1 | d27 |
| `postings$cujo` | character | 1 | d27 |
| `postings$varao` | character | 1 | d27 |
| `postings$geracao` | character | 1 | d27 |
| `postings$inicial` | character | 1 | d27 |
| `postings$bastardo` | character | 1 | d27 |
| `postings$d` | character | 13 | d27, d30, d31, d33, d36, d40, ... |
| `postings$elevado` | character | 2 | d27, d30 |
| `postings$altas` | character | 1 | d27 |
| `postings$posicoes` | character | 1 | d27 |
| `postings$sociais` | character | 1 | d27 |
| `postings$politicas` | character | 1 | d27 |
| `postings$economicas` | character | 1 | d27 |
| `postings$reinado` | character | 2 | d27, d40 |
| `postings$dinis` | character | 1 | d27 |
| `postings$mesmo` | character | 5 | d27, d28, d31, d36, d51 |
| `postings$homonimo` | character | 1 | d27 |
| `postings$ines` | character | 1 | d27 |
| `postings$lourenco` | character | 1 | d27 |
| `postings$valadares` | character | 1 | d27 |
| `postings$este` | character | 3 | d27, d35, d49 |
| `postings$ultimo` | character | 1 | d27 |
| `postings$chamado` | character | 2 | d27, d47 |
| `postings$vasco` | character | 1 | d27 |
| `postings$martins` | character | 1 | d27 |
| `postings$avancada` | character | 1 | d27 |
| `postings$idade` | character | 1 | d27 |
| `postings$naquele` | character | 1 | d27 |
| `postings$participou` | character | 1 | d27 |
| `postings$cortes` | character | 1 | d27 |
| `postings$coimbra` | character | 1 | d27 |
| `postings$aclamacao` | character | 1 | d27 |
| `postings$combateu` | character | 3 | d27, d40, d44 |
| `postings$batalha` | character | 2 | d27, d28 |
| `postings$aljubarrota` | character | 1 | d27 |
| `postings$integrou` | character | 1 | d27 |
| `postings$ala` | character | 1 | d27 |
| `postings$namorados` | character | 1 | d27 |
| `postings$composta` | character | 1 | d27 |
| `postings$cavaleiros` | character | 1 | d27 |
| `postings$juraram` | character | 1 | d27 |
| `postings$escapassem` | character | 1 | d27 |
| `postings$correriam` | character | 1 | d27 |
| `postings$imediatamente` | character | 2 | d27, d28 |
| `postings$bracos` | character | 2 | d27, d28 |
| `postings$namoradas` | character | 1 | d27 |
| `postings$escapou` | character | 1 | d28 |
| `postings$correu` | character | 1 | d28 |
| `postings$namorada` | character | 1 | d28 |
| `postings$sinal` | character | 1 | d28 |
| `postings$abadessa` | character | 1 | d28 |
| `postings$mosteiro` | character | 1 | d28 |
| `postings$beneditino` | character | 1 | d28 |
| `postings$ligacao` | character | 1 | d28 |
| `postings$nasceu` | character | 2 | d28, d29 |
| `postings$sacrilego` | character | 1 | d28 |
| `postings$isto` | character | 1 | d28 |
| `postings$concebido` | character | 1 | d28 |
| `postings$violacao` | character | 1 | d28 |
| `postings$votos` | character | 1 | d28 |
| `postings$publicos` | character | 1 | d28 |
| `postings$solenes` | character | 1 | d28 |
| `postings$puseram` | character | 1 | d28 |
| `postings$nome` | character | 2 | d28, d35 |
| `postings$pai` | character | 1 | d28 |
| `postings$deste` | character | 2 | d29, d45 |
| `postings$casamento` | character | 2 | d29, d31 |
| `postings$senhor` | character | 4 | d29, d31, d36, d48 |
| `postings$prado` | character | 3 | d29, d48, d51 |
| `postings$casou` | character | 2 | d29, d31 |
| `postings$brites` | character | 1 | d29 |
| `postings$albuquerque` | character | 1 | d29 |
| `postings$alcoentre` | character | 2 | d29, d48 |
| `postings$veio` | character | 2 | d29, d36 |
| `postings$irmaos` | character | 2 | d29, d36 |
| `postings$isabel` | character | 2 | d29, d36 |
| `postings$rodrigues` | character | 2 | d29, d37 |
| `postings$velho` | character | 1 | d29 |
| `postings$chegou` | character | 3 | d29, d35, d57 |
| `postings$deixar` | character | 1 | d30 |
| `postings$duque` | character | 1 | d30 |
| `postings$ficar` | character | 2 | d30, d31 |
| `postings$corte` | character | 2 | d30, d31 |
| `postings$real` | character | 6 | d30, d33, d36, d41, d45, d48 |
| `postings$ter` | character | 4 | d30, d31, d33, d34 |
| `postings$matematica` | character | 1 | d30 |
| `postings$cosmografia` | character | 1 | d30 |
| `postings$geografia` | character | 1 | d30 |
| `postings$cosmografo` | character | 1 | d30 |
| `postings$pedro` | character | 4 | d30, d31, d36, d51 |
| `postings$nunes` | character | 1 | d30 |
| `postings$1527` | character | 1 | d30 |
| `postings$espirito` | character | 1 | d30 |
| `postings$queria` | character | 1 | d30 |
| `postings$esfera` | character | 1 | d30 |
| `postings$dilatasse` | character | 1 | d30 |
| `postings$grandes` | character | 1 | d30 |
| `postings$largou` | character | 1 | d30 |
| `postings$alcaidaria` | character | 1 | d30 |
| `postings$merces` | character | 1 | d30 |
| `postings$tinha` | character | 4 | d30, d36, d43, d46 |
| `postings$servir` | character | 2 | d30, d43 |
| `postings$principe` | character | 1 | d30 |
| `postings$el` | character | 5 | d30, d33, d34, d45, d48 |
| `postings$castela` | character | 3 | d30, d31, d32 |
| `postings$esteve` | character | 2 | d30, d41 |
| `postings$salamanca` | character | 2 | d30, d31 |
| `postings$voltando` | character | 2 | d30, d46 |
| `postings$entao` | character | 4 | d30, d43, d57, d63 |
| `postings$reinava` | character | 1 | d30 |
| `postings$estimacao` | character | 1 | d30 |
| `postings$honra` | character | 1 | d30 |
| `postings$quem` | character | 3 | d30, d36, d49 |
| `postings$concorreram` | character | 1 | d30 |
| `postings$muitas` | character | 1 | d30 |
| `postings$valoroso` | character | 1 | d30 |
| `postings$dotado` | character | 1 | d30 |
| `postings$entendimento` | character | 1 | d30 |
| `postings$talento` | character | 1 | d30 |
| `postings$justificou` | character | 1 | d30 |
| `postings$decisao` | character | 2 | d30, d43 |
| `postings$dizendo` | character | 1 | d30 |
| `postings$fazer` | character | 1 | d30 |
| `postings$me` | character | 1 | d30 |
| `postings$nunca` | character | 1 | d30 |
| `postings$aconteceu` | character | 1 | d30 |
| `postings$acompanhou` | character | 1 | d31 |
| `postings$rainha` | character | 2 | d31, d49 |
| `postings$viuva` | character | 1 | d31 |
| `postings$leonor` | character | 1 | d31 |
| `postings$austria` | character | 1 | d31 |
| `postings$ana` | character | 3 | d31, d36, d49 |
| `postings$pimentel` | character | 2 | d31, d49 |
| `postings$ilustre` | character | 1 | d31 |
| `postings$familia` | character | 2 | d31, d51 |
| `postings$espanhola` | character | 1 | d31 |
| `postings$cerca` | character | 2 | d31, d33 |
| `postings$junho` | character | 2 | d31, d36 |
| `postings$1523` | character | 1 | d31 |
| `postings$filha` | character | 2 | d31, d36 |
| `postings$arias` | character | 1 | d31 |
| `postings$maldonado` | character | 1 | d31 |
| `postings$comendador` | character | 2 | d31, d48 |
| `postings$estriana` | character | 1 | d31 |
| `postings$regedor` | character | 1 | d31 |
| `postings$talavera` | character | 1 | d31 |
| `postings$joana` | character | 1 | d31 |
| `postings$tavara` | character | 1 | d31 |
| `postings$irma` | character | 1 | d31 |
| `postings$bernardino` | character | 1 | d31 |
| `postings$marques` | character | 2 | d31, d48 |
| `postings$es` | character | 1 | d31 |
| `postings$mae` | character | 1 | d31 |
| `postings$mulher` | character | 2 | d31, d36 |
| `postings$descendente` | character | 1 | d31 |
| `postings$lado` | character | 2 | d31, d63 |
| `postings$paterno` | character | 1 | d31 |
| `postings$pimenteis` | character | 1 | d31 |
| `postings$condes` | character | 2 | d31, d51 |
| `postings$benavente` | character | 1 | d31 |
| `postings$linhagem` | character | 1 | d31 |
| `postings$passara` | character | 1 | d31 |
| `postings$xiv` | character | 2 | d31, d45 |
| `postings$materno` | character | 1 | d31 |
| `postings$alba` | character | 1 | d31 |
| `postings$liste` | character | 1 | d31 |
| `postings$quer` | character | 1 | d31 |
| `postings$dizer` | character | 1 | d31 |
| `postings$principais` | character | 2 | d31, d61 |
| `postings$linhagens` | character | 3 | d31, d46, d51 |
| `postings$epoca` | character | 5 | d31, d46, d58, d60, d63 |
| `postings$usual` | character | 1 | d31 |
| `postings$fidalgos` | character | 2 | d31, d36 |
| `postings$titulares` | character | 1 | d31 |
| `postings$casarem` | character | 1 | d31 |
| `postings$mulheres` | character | 1 | d31 |
| `postings$espanholas` | character | 1 | d31 |
| `postings$oriundas` | character | 1 | d31 |
| `postings$caso` | character | 1 | d31 |
| `postings$via` | character | 1 | d31 |
| `postings$feminina` | character | 1 | d31 |
| `postings$familias` | character | 2 | d31, d51 |
| `postings$grandeza` | character | 1 | d31 |
| `postings$concluir` | character | 1 | d31 |
| `postings$conseguido` | character | 1 | d31 |
| `postings$desenvolver` | character | 1 | d31 |
| `postings$sucesso` | character | 1 | d31 |
| `postings$estrategia` | character | 1 | d31 |
| `postings$alianca` | character | 1 | d31 |
| `postings$matrimonial` | character | 1 | d31 |
| `postings$repercussoes` | character | 1 | d31 |
| `postings$positivas` | character | 1 | d31 |
| `postings$termos` | character | 1 | d31 |
| `postings$carreira` | character | 3 | d31, d33, d47 |
| `postings$conexoes` | character | 1 | d31 |
| `postings$peninsula` | character | 1 | d31 |
| `postings$iberica` | character | 1 | d31 |
| `postings$viveu` | character | 1 | d32 |
| `postings$lutou` | character | 1 | d32 |
| `postings$imperador` | character | 1 | d32 |
| `postings$carlos` | character | 1 | d32 |
| `postings$v` | character | 2 | d32, d46 |
| `postings$1525` | character | 1 | d32 |
| `postings$participacao` | character | 1 | d32 |
| `postings$destacada` | character | 1 | d32 |
| `postings$cerco` | character | 1 | d32 |
| `postings$tomada` | character | 1 | d32 |
| `postings$fuenterrabia` | character | 1 | d32 |
| `postings$noroeste` | character | 1 | d32 |
| `postings$elogiou` | character | 1 | d32 |
| `postings$publicamente` | character | 1 | d32 |
| `postings$convidou` | character | 1 | d32 |
| `postings$permanecer` | character | 1 | d32 |
| `postings$homem` | character | 1 | d33 |
| `postings$1531` | character | 2 | d33, d38 |
| `postings$determinou` | character | 1 | d33 |
| `postings$mandar` | character | 1 | d33 |
| `postings$indicado` | character | 1 | d33 |
| `postings$primo` | character | 2 | d33, d46 |
| `postings$antonio` | character | 5 | d33, d37, d43, d46, d50 |
| `postings$ataide` | character | 2 | d33, d46 |
| `postings$conde` | character | 3 | d33, d46, d51 |
| `postings$castanheira` | character | 2 | d33, d46 |
| `postings$usufruindo` | character | 1 | d33 |
| `postings$amizade` | character | 3 | d33, d37, d45 |
| `postings$confianca` | character | 1 | d33 |
| `postings$fez` | character | 2 | d33, d46 |
| `postings$indicacao` | character | 1 | d33 |
| `postings$intuito` | character | 1 | d33 |
| `postings$afastar` | character | 1 | d33 |
| `postings$amigos` | character | 1 | d33 |
| `postings$infancia` | character | 1 | d33 |
| `postings$fosse` | character | 1 | d33 |
| `postings$unico` | character | 1 | d33 |
| `postings$certa` | character | 1 | d33 |
| `postings$influencia` | character | 1 | d33 |
| `postings$sobre` | character | 3 | d33, d45, d60 |
| `postings$historiografia` | character | 1 | d34 |
| `postings$encara` | character | 1 | d34 |
| `postings$colonizadora` | character | 1 | d34 |
| `postings$levava` | character | 1 | d34 |
| `postings$regimento` | character | 1 | d34 |
| `postings$colocar` | character | 1 | d34 |
| `postings$padroes` | character | 1 | d34 |
| `postings$maranhao` | character | 1 | d34 |
| `postings$prata` | character | 4 | d34, d37, d51, d52 |
| `postings$alcancou` | character | 1 | d34 |
| `postings$naufragado` | character | 1 | d34 |
| `postings$antes` | character | 2 | d34, d35 |
| `postings$dividir` | character | 1 | d34 |
| `postings$capitanias` | character | 3 | d34, d40, d48 |
| `postings$medidas` | character | 1 | d34 |
| `postings$leguas` | character | 3 | d34, d36, d40 |
| `postings$seguidamente` | character | 1 | d34 |
| `postings$concederia` | character | 1 | d34 |
| `postings$donatarios` | character | 1 | d34 |
| `postings$batizando` | character | 1 | d35 |
| `postings$consagrado` | character | 1 | d35 |
| `postings$confirmando` | character | 1 | d35 |
| `postings$dado` | character | 2 | d35, d51 |
| `postings$trinta` | character | 1 | d35 |
| `postings$aquela` | character | 1 | d35 |
| `postings$coincidentemente` | character | 1 | d35 |
| `postings$saiu` | character | 1 | d36 |
| `postings$navios` | character | 2 | d36, d57 |
| `postings$gente` | character | 1 | d36 |
| `postings$armas` | character | 3 | d36, d51, d52 |
| `postings$apetrechos` | character | 1 | d36 |
| `postings$nobres` | character | 1 | d36 |
| `postings$povoadores` | character | 1 | d36 |
| `postings$tudo` | character | 1 | d36 |
| `postings$custa` | character | 1 | d36 |
| `postings$concedido` | character | 1 | d36 |
| `postings$fundar` | character | 1 | d36 |
| `postings$afogado` | character | 1 | d36 |
| `postings$trouxe` | character | 2 | d36, d42 |
| `postings$dito` | character | 1 | d36 |
| `postings$nobreza` | character | 1 | d36 |
| `postings$luis` | character | 2 | d36, d57 |
| `postings$gois` | character | 1 | d36 |
| `postings$andrade` | character | 1 | d36 |
| `postings$aguilar` | character | 1 | d36 |
| `postings$1558` | character | 1 | d36 |
| `postings$gabriel` | character | 1 | d36 |
| `postings$domingos` | character | 2 | d36, d50 |
| `postings$leitao` | character | 1 | d36 |
| `postings$casado` | character | 1 | d36 |
| `postings$cecilia` | character | 1 | d36 |
| `postings$jorge` | character | 1 | d36 |
| `postings$pires` | character | 1 | d36 |
| `postings$cavaleiro` | character | 1 | d36 |
| `postings$rui` | character | 1 | d36 |
| `postings$pinto` | character | 1 | d36 |
| `postings$micel` | character | 1 | d36 |
| `postings$eram` | character | 1 | d36 |
| `postings$nicolau` | character | 1 | d36 |
| `postings$azevedo` | character | 1 | d36 |
| `postings$quinta` | character | 2 | d36, d62 |
| `postings$ramecal` | character | 1 | d36 |
| `postings$penaguiao` | character | 1 | d36 |
| `postings$filhos` | character | 2 | d36, d51 |
| `postings$marta` | character | 1 | d36 |
| `postings$teixeira` | character | 1 | d36 |
| `postings$ambos` | character | 2 | d36, d46 |
| `postings$floresciam` | character | 1 | d36 |
| `postings$1550` | character | 2 | d36, d50 |
| `postings$18` | character | 1 | d36 |
| `postings$venderam` | character | 1 | d36 |
| `postings$escritura` | character | 1 | d36 |
| `postings$publica` | character | 2 | d36, d47 |
| `postings$alemaes` | character | 1 | d36 |
| `postings$erasmo` | character | 1 | d36 |
| `postings$esquert` | character | 1 | d36 |
| `postings$juliao` | character | 1 | d36 |
| `postings$visnat` | character | 1 | d36 |
| `postings$terras` | character | 2 | d36, d40 |
| `postings$herdado` | character | 1 | d36 |
| `postings$referido` | character | 1 | d36 |
| `postings$ve` | character | 1 | d36 |
| `postings$liv` | character | 1 | d36 |
| `postings$1o` | character | 1 | d36 |
| `postings$registos` | character | 1 | d36 |
| `postings$sesmarias` | character | 1 | d36 |
| `postings$tit` | character | 1 | d36 |
| `postings$1555` | character | 1 | d36 |
| `postings$pags` | character | 1 | d36 |
| `postings$seguintes` | character | 1 | d36 |
| `postings$qualidade` | character | 1 | d36 |
| `postings$foro` | character | 1 | d36 |
| `postings$mocos` | character | 1 | d36 |
| `postings$ficaram` | character | 1 | d36 |
| `postings$povoando` | character | 1 | d36 |
| `postings$melhor` | character | 1 | d36 |
| `postings$registo` | character | 1 | d36 |
| `postings$per` | character | 1 | d36 |
| `postings$totum` | character | 1 | d36 |
| `postings$percorrer` | character | 1 | d37 |
| `postings$foz` | character | 1 | d37 |
| `postings$sobreviveu` | character | 1 | d37 |
| `postings$naufragio` | character | 1 | d37 |
| `postings$desdobramento` | character | 1 | d37 |
| `postings$vinte` | character | 1 | d37 |
| `postings$ajuda` | character | 1 | d37 |
| `postings$ramalho` | character | 1 | d37 |
| `postings$feito` | character | 1 | d37 |
| `postings$caciques` | character | 1 | d37 |
| `postings$tibirica` | character | 2 | d37, d41 |
| `postings$caiubi` | character | 1 | d37 |
| `postings$moldes` | character | 1 | d37 |
| `postings$tropa` | character | 1 | d38 |
| `postings$nesta` | character | 1 | d38 |
| `postings$infrutifera` | character | 1 | d38 |
| `postings$acessar` | character | 1 | d38 |
| `postings$imperio` | character | 1 | d38 |
| `postings$inca` | character | 1 | d38 |
| `postings$posteriormente` | character | 2 | d38, d55 |
| `postings$resultaria` | character | 1 | d38 |
| `postings$sul` | character | 1 | d38 |
| `postings$ocorreria` | character | 1 | d38 |
| `postings$invasao` | character | 1 | d38 |
| `postings$saque` | character | 1 | d38 |
| `postings$vingou` | character | 1 | d38 |
| `postings$haver` | character | 1 | d38 |
| `postings$expulso` | character | 1 | d38 |
| `postings$catastrofe` | character | 1 | d39 |
| `postings$destruiu` | character | 2 | d39, d46 |
| `postings$lugar` | character | 2 | d39, d46 |
| `postings$agraciado` | character | 1 | d40 |
| `postings$coroa` | character | 2 | d40, d47 |
| `postings$lotes` | character | 1 | d40 |
| `postings$outubro` | character | 3 | d40, d61, d63 |
| `postings$recebera` | character | 1 | d40 |
| `postings$comunicacao` | character | 1 | d40 |
| `postings$imenso` | character | 1 | d40 |
| `postings$seria` | character | 1 | d40 |
| `postings$dividido` | character | 1 | d40 |
| `postings$extensas` | character | 1 | d40 |
| `postings$faixas` | character | 1 | d40 |
| `postings$hereditarias` | character | 1 | d40 |
| `postings$ocasiao` | character | 1 | d40 |
| `postings$doadas` | character | 1 | d40 |
| `postings$cem` | character | 2 | d40, d42 |
| `postings$autorizacao` | character | 1 | d40 |
| `postings$retornar` | character | 1 | d40 |
| `postings$aldeia` | character | 1 | d41 |
| `postings$governada` | character | 1 | d41 |
| `postings$cacique` | character | 1 | d41 |
| `postings$ordem` | character | 4 | d41, d48, d49, d50 |
| `postings$destinado` | character | 1 | d41 |
| `postings$conversao` | character | 1 | d41 |
| `postings$atual` | character | 1 | d41 |
| `postings$ferreiro` | character | 1 | d42 |
| `postings$contratado` | character | 1 | d42 |
| `postings$prover` | character | 1 | d42 |
| `postings$necessidades` | character | 1 | d42 |
| `postings$ferro` | character | 1 | d42 |
| `postings$colonia` | character | 1 | d42 |
| `postings$mestre` | character | 2 | d42, d50 |
| `postings$bartolomeu` | character | 1 | d42 |
| `postings$fernandes` | character | 1 | d42 |
| `postings$goncalves` | character | 1 | d42 |
| `postings$carrasco` | character | 1 | d42 |
| `postings$terminado` | character | 1 | d42 |
| `postings$contrato` | character | 1 | d42 |
| `postings$solo` | character | 1 | d42 |
| `postings$proprietario` | character | 1 | d42 |
| `postings$sitio` | character | 1 | d42 |
| `postings$jeribas` | character | 1 | d42 |
| `postings$instalando` | character | 1 | d42 |
| `postings$margens` | character | 1 | d42 |
| `postings$jurubatuba` | character | 1 | d42 |
| `postings$afluente` | character | 1 | d42 |
| `postings$pinheiros` | character | 1 | d42 |
| `postings$actual` | character | 1 | d42 |
| `postings$forja` | character | 1 | d42 |
| `postings$producao` | character | 1 | d42 |
| `postings$aco` | character | 5 | d42, d58, d59, d60, d62 |
| `postings$facto` | character | 1 | d42 |
| `postings$mencionado` | character | 1 | d42 |
| `postings$operarios` | character | 1 | d42 |
| `postings$conseguiu` | character | 1 | d42 |
| `postings$produzir` | character | 1 | d42 |
| `postings$forjar` | character | 1 | d42 |
| `postings$quilogramas` | character | 1 | d42 |
| `postings$seis` | character | 2 | d42, d63 |
| `postings$sete` | character | 1 | d42 |
| `postings$horas` | character | 1 | d42 |
| `postings$consumindo` | character | 1 | d42 |
| `postings$quatrocentos` | character | 1 | d42 |
| `postings$cinquenta` | character | 1 | d42 |
| `postings$carvao` | character | 1 | d42 |
| `postings$vegetal` | character | 1 | d42 |
| `postings$encontrava` | character | 1 | d43 |
| `postings$19` | character | 1 | d43 |
| `postings$passados` | character | 1 | d43 |
| `postings$meses` | character | 2 | d43, d63 |
| `postings$voltado` | character | 2 | d43, d46 |
| `postings$cansativa` | character | 1 | d43 |
| `postings$mandou` | character | 1 | d43 |
| `postings$indico` | character | 1 | d43 |
| `postings$efeito` | character | 1 | d43 |
| `postings$confiado` | character | 1 | d43 |
| `postings$governo` | character | 4 | d43, d45, d46, d64 |
| `postings$cinco` | character | 2 | d43, d52 |
| `postings$naus` | character | 2 | d43, d46 |
| `postings$cronista` | character | 1 | d43 |
| `postings$correia` | character | 1 | d43 |
| `postings$lendas` | character | 1 | d43 |
| `postings$muito` | character | 1 | d43 |
| `postings$enojou` | character | 1 | d43 |
| `postings$sentiu` | character | 1 | d43 |
| `postings$vinha` | character | 1 | d43 |
| `postings$indias` | character | 1 | d44 |
| `postings$encarregado` | character | 1 | d44 |
| `postings$proteger` | character | 1 | d44 |
| `postings$possessoes` | character | 1 | d44 |
| `postings$oriente` | character | 2 | d44, d46 |
| `postings$defendeu` | character | 1 | d44 |
| `postings$feitoria` | character | 1 | d44 |
| `postings$diu` | character | 2 | d44, d45 |
| `postings$mouros` | character | 1 | d44 |
| `postings$hindus` | character | 1 | d44 |
| `postings$derrotou` | character | 1 | d44 |
| `postings$samorim` | character | 2 | d44, d46 |
| `postings$calecute` | character | 2 | d44, d46 |
| `postings$saqueavam` | character | 1 | d44 |
| `postings$embarcacoes` | character | 1 | d44 |
| `postings$portuguesas` | character | 2 | d44, d46 |
| `postings$vitorioso` | character | 1 | d44 |
| `postings$vice` | character | 2 | d44, d46 |
| `postings$chegando` | character | 1 | d45 |
| `postings$diz` | character | 1 | d45 |
| `postings$historia` | character | 1 | d45 |
| `postings$genealogica` | character | 1 | d45 |
| `postings$volume` | character | 1 | d45 |
| `postings$pagina` | character | 1 | d45 |
| `postings$241` | character | 1 | d45 |
| `postings$nuno` | character | 1 | d45 |
| `postings$cunha` | character | 1 | d45 |
| `postings$refletiu` | character | 1 | d45 |
| `postings$mandava` | character | 1 | d45 |
| `postings$so` | character | 1 | d45 |
| `postings$companheiro` | character | 1 | d45 |
| `postings$sucessor` | character | 1 | d45 |
| `postings$fim` | character | 3 | d45, d47, d60 |
| `postings$meteu` | character | 1 | d45 |
| `postings$mandando` | character | 1 | d45 |
| `postings$praca` | character | 1 | d45 |
| `postings$damao` | character | 1 | d45 |
| `postings$situada` | character | 2 | d45, d53 |
| `postings$cambaia` | character | 1 | d45 |
| `postings$sultanato` | character | 1 | d45 |
| `postings$guzarate` | character | 1 | d45 |
| `postings$40` | character | 1 | d45 |
| `postings$velas` | character | 1 | d45 |
| `postings$500` | character | 1 | d45 |
| `postings$rendeu` | character | 1 | d45 |
| `postings$mortos` | character | 1 | d45 |
| `postings$quase` | character | 1 | d45 |
| `postings$inimigos` | character | 1 | d45 |
| `postings$fortaleza` | character | 1 | d45 |
| `postings$arrasada` | character | 1 | d45 |
| `postings$temendo` | character | 1 | d45 |
| `postings$maiores` | character | 1 | d45 |
| `postings$perdas` | character | 1 | d45 |
| `postings$querendo` | character | 1 | d45 |
| `postings$nossos` | character | 1 | d45 |
| `postings$evita` | character | 1 | d45 |
| `postings$la` | character | 1 | d45 |
| `postings$pediu` | character | 1 | d45 |
| `postings$pazes` | character | 1 | d45 |
| `postings$juradas` | character | 1 | d45 |
| `postings$solenemente` | character | 1 | d45 |
| `postings$condicao` | character | 1 | d45 |
| `postings$dar` | character | 2 | d45, d55 |
| `postings$bacaim` | character | 1 | d45 |
| `postings$duras` | character | 1 | d45 |
| `postings$direitos` | character | 1 | d45 |
| `postings$pagar` | character | 1 | d45 |
| `postings$moderar` | character | 1 | d45 |
| `postings$concedeu` | character | 1 | d45 |
| `postings$levantar` | character | 1 | d45 |
| `postings$conseguida` | character | 1 | d45 |
| `postings$negociacoes` | character | 1 | d45 |
| `postings$1535` | character | 1 | d45 |
| `postings$achava` | character | 1 | d45 |
| `postings$chaul` | character | 1 | d45 |
| `postings$carta` | character | 1 | d46 |
| `postings$escrita` | character | 1 | d46 |
| `postings$cochim` | character | 1 | d46 |
| `postings$esse` | character | 1 | d46 |
| `postings$periodo` | character | 1 | d46 |
| `postings$dirigida` | character | 1 | d46 |
| `postings$coirmao` | character | 1 | d46 |
| `postings$fazendo` | character | 1 | d46 |
| `postings$pedido` | character | 1 | d46 |
| `postings$parente` | character | 1 | d46 |
| `postings$comum` | character | 1 | d46 |
| `postings$heitor` | character | 1 | d46 |
| `postings$lados` | character | 1 | d46 |
| `postings$ideia` | character | 1 | d46 |
| `postings$ambiente` | character | 1 | d46 |
| `postings$vivia` | character | 1 | d46 |
| `postings$envolvidas` | character | 1 | d46 |
| `postings$campanhas` | character | 1 | d46 |
| `postings$nom` | character | 1 | d46 |
| `postings$outrem` | character | 1 | d46 |
| `postings$senom` | character | 1 | d46 |
| `postings$vay` | character | 1 | d46 |
| `postings$pondo` | character | 1 | d46 |
| `postings$he` | character | 1 | d46 |
| `postings$necesaryo` | character | 1 | d46 |
| `postings$socorer` | character | 1 | d46 |
| `postings$lenbre` | character | 1 | d46 |
| `postings$vos` | character | 1 | d46 |
| `postings$poe` | character | 1 | d46 |
| `postings$arriba` | character | 1 | d46 |
| `postings$mays` | character | 1 | d46 |
| `postings$ffazer` | character | 1 | d46 |
| `postings$polos` | character | 1 | d46 |
| `postings$ataides` | character | 1 | d46 |
| `postings$mandado` | character | 1 | d46 |
| `postings$malabar` | character | 1 | d46 |
| `postings$assolou` | character | 1 | d46 |
| `postings$lugares` | character | 1 | d46 |
| `postings$maritimos` | character | 1 | d46 |
| `postings$principes` | character | 1 | d46 |
| `postings$repelim` | character | 1 | d46 |
| `postings$estas` | character | 1 | d46 |
| `postings$empresas` | character | 2 | d46, d55 |
| `postings$conseguiram` | character | 1 | d46 |
| `postings$respeito` | character | 1 | d46 |
| `postings$temor` | character | 1 | d46 |
| `postings$asia` | character | 1 | d46 |
| `postings$sucedeu` | character | 1 | d46 |
| `postings$noronha` | character | 1 | d46 |
| `postings$abril` | character | 1 | d46 |
| `postings$1540` | character | 1 | d46 |
| `postings$aberta` | character | 1 | d46 |
| `postings$cartas` | character | 1 | d46 |
| `postings$sucessao` | character | 1 | d46 |
| `postings$estevao` | character | 1 | d46 |
| `postings$gama` | character | 1 | d46 |
| `postings$cujos` | character | 1 | d46 |
| `postings$parentes` | character | 1 | d46 |
| `postings$quiseram` | character | 1 | d46 |
| `postings$conservar` | character | 1 | d46 |
| `postings$nomear` | character | 1 | d46 |
| `postings$7` | character | 1 | d46 |
| `postings$consigo` | character | 1 | d46 |
| `postings$xavier` | character | 1 | d46 |
| `postings$goa` | character | 1 | d46 |
| `postings$maio` | character | 4 | d46, d50, d53, d57 |
| `postings$castro` | character | 1 | d46 |
| `postings$controversia` | character | 1 | d47 |
| `postings$quanto` | character | 1 | d47 |
| `postings$historiadores` | character | 1 | d47 |
| `postings$afirmam` | character | 1 | d47 |
| `postings$1546` | character | 1 | d47 |
| `postings$sustentam` | character | 1 | d47 |
| `postings$acusacao` | character | 1 | d47 |
| `postings$desvio` | character | 1 | d47 |
| `postings$dinheiro` | character | 1 | d47 |
| `postings$enriquecimento` | character | 1 | d47 |
| `postings$ilicito` | character | 1 | d47 |
| `postings$mantendo` | character | 1 | d47 |
| `postings$afastado` | character | 1 | d47 |
| `postings$morrer` | character | 1 | d47 |
| `postings$comprou` | character | 1 | d48 |
| `postings$instituiu` | character | 1 | d48 |
| `postings$morgado` | character | 1 | d48 |
| `postings$mascarenhas` | character | 1 | d48 |
| `postings$cristo` | character | 1 | d48 |
| `postings$senhorio` | character | 1 | d48 |
| `postings$vendido` | character | 1 | d48 |
| `postings$jovem` | character | 1 | d48 |
| `postings$esposa` | character | 1 | d49 |
| `postings$ficou` | character | 1 | d49 |
| `postings$procuradora` | character | 1 | d49 |
| `postings$marido` | character | 1 | d49 |
| `postings$relativamente` | character | 1 | d49 |
| `postings$negocios` | character | 1 | d49 |
| `postings$dama` | character | 1 | d49 |
| `postings$companhia` | character | 1 | d49 |
| `postings$providenciou` | character | 1 | d49 |
| `postings$introduzisse` | character | 1 | d49 |
| `postings$vacum` | character | 1 | d49 |
| `postings$1544` | character | 1 | d49 |
| `postings$revogou` | character | 1 | d49 |
| `postings$esposo` | character | 1 | d49 |
| `postings$proibia` | character | 1 | d49 |
| `postings$entrada` | character | 1 | d49 |
| `postings$europeus` | character | 1 | d49 |
| `postings$campo` | character | 1 | d49 |
| `postings$permitiu` | character | 1 | d49 |
| `postings$expansao` | character | 1 | d49 |
| `postings$campos` | character | 1 | d49 |
| `postings$rodrigo` | character | 1 | d50 |
| `postings$professou` | character | 1 | d50 |
| `postings$frei` | character | 1 | d50 |
| `postings$eleito` | character | 1 | d50 |
| `postings$prior` | character | 1 | d50 |
| `postings$provincial` | character | 1 | d50 |
| `postings$pregador` | character | 1 | d50 |
| `postings$filipe` | character | 1 | d50 |
| `postings$ii` | character | 1 | d50 |
| `postings$1580` | character | 1 | d50 |
| `postings$roma` | character | 1 | d50 |
| `postings$capitulo` | character | 1 | d50 |
| `postings$geral` | character | 1 | d50 |
| `postings$vigario` | character | 1 | d50 |
| `postings$pregadores` | character | 1 | d50 |
| `postings$1594` | character | 1 | d50 |
| `postings$papa` | character | 1 | d50 |
| `postings$clemente` | character | 1 | d50 |
| `postings$viii` | character | 1 | d50 |
| `postings$bispo` | character | 1 | d50 |
| `postings$viseu` | character | 1 | d50 |
| `postings$1595` | character | 1 | d50 |
| `postings$governado` | character | 1 | d50 |
| `postings$prudencia` | character | 1 | d50 |
| `postings$morreu` | character | 1 | d50 |
| `postings$1597` | character | 1 | d50 |
| `postings$pertence` | character | 1 | d51 |
| `postings$5` | character | 2 | d51, d58 |
| `postings$importantes` | character | 1 | d51 |
| `postings$mordomos` | character | 1 | d51 |
| `postings$mores` | character | 1 | d51 |
| `postings$xii` | character | 1 | d51 |
| `postings$xiii` | character | 1 | d51 |
| `postings$varonia` | character | 1 | d51 |
| `postings$herdeiras` | character | 1 | d51 |
| `postings$casadas` | character | 1 | d51 |
| `postings$bastardos` | character | 1 | d51 |
| `postings$reis` | character | 1 | d51 |
| `postings$leao` | character | 2 | d51, d52 |
| `postings$sousas` | character | 1 | d51 |
| `postings$consistem` | character | 1 | d51 |
| `postings$cruzamento` | character | 1 | d51 |
| `postings$contem` | character | 1 | d51 |
| `postings$qualquer` | character | 1 | d51 |
| `postings$referencia` | character | 1 | d51 |
| `postings$originais` | character | 2 | d51, d60 |
| `postings$crescentes` | character | 1 | d51 |
| `postings$brasao` | character | 1 | d52 |
| `postings$descrito` | character | 1 | d52 |
| `postings$esquartelado` | character | 1 | d52 |
| `postings$quarto` | character | 1 | d52 |
| `postings$escudetes` | character | 1 | d52 |
| `postings$azul` | character | 1 | d52 |
| `postings$postos` | character | 1 | d52 |
| `postings$cruz` | character | 1 | d52 |
| `postings$cada` | character | 1 | d52 |
| `postings$escudete` | character | 1 | d52 |
| `postings$carregado` | character | 1 | d52 |
| `postings$besantes` | character | 1 | d52 |
| `postings$metal` | character | 2 | d52, d58 |
| `postings$sautoir` | character | 1 | d52 |
| `postings$terceiro` | character | 1 | d52 |
| `postings$rampante` | character | 1 | d52 |
| `postings$purpura` | character | 1 | d52 |
| `postings$timbre` | character | 1 | d52 |
| `postings$escudo` | character | 1 | d52 |
| `postings$liga` | character | 2 | d53, d54 |
| `postings$pontes` | character | 3 | d53, d58, d62 |
| `postings$suspensas` | character | 3 | d53, d58, d62 |
| `postings$transporta` | character | 1 | d53 |
| `postings$veiculos` | character | 3 | d53, d59, d60 |
| `postings$pedestres` | character | 2 | d53, d64 |
| `postings$barbosas` | character | 2 | d53, d54 |
| `postings$originalmente` | character | 2 | d53, d63 |
| `postings$concebida` | character | 1 | d53 |
| `postings$1910` | character | 2 | d53, d55 |
| `postings$maneira` | character | 1 | d53 |
| `postings$transportar` | character | 3 | d53, d58, d59 |
| `postings$esgoto` | character | 2 | d53, d55 |
| `postings$comecou` | character | 2 | d53, d61 |
| `postings$1911` | character | 2 | d53, d57 |
| `postings$inaugurada` | character | 2 | d53, d57 |
| `postings$restaurada` | character | 4 | d53, d61, d62, d64 |
| `postings$2015` | character | 3 | d53, d61, d63 |
| `postings$cabos` | character | 7 | d53, d58, d59, d60, d61, d62, ... |
| `postings$corroidos` | character | 1 | d53 |
| `postings$substituidos` | character | 3 | d53, d61, d62 |
| `postings$juntamente` | character | 1 | d53 |
| `postings$trabalho` | character | 2 | d53, d63 |
| `postings$reparacao` | character | 1 | d53 |
| `postings$localizada` | character | 1 | d54 |
| `postings$fica` | character | 2 | d54, d58 |
| `postings$regularmente` | character | 1 | d54 |
| `postings$utilizada` | character | 2 | d54, d64 |
| `postings$prainha` | character | 1 | d54 |
| `postings$conecta` | character | 1 | d54 |
| `postings$avenidas` | character | 1 | d54 |
| `postings$presidente` | character | 1 | d54 |
| `postings$getulio` | character | 1 | d54 |
| `postings$vargas` | character | 1 | d54 |
| `postings$proposta` | character | 1 | d55 |
| `postings$comissao` | character | 1 | d55 |
| `postings$saneamento` | character | 2 | d55, d56 |
| `postings$suporte` | character | 1 | d55 |
| `postings$duto` | character | 1 | d55 |
| `postings$oceano` | character | 1 | d55 |
| `postings$atlantico` | character | 1 | d55 |
| `postings$forte` | character | 1 | d55 |
| `postings$itaipu` | character | 1 | d55 |
| `postings$planos` | character | 1 | d55 |
| `postings$detalhados` | character | 1 | d55 |
| `postings$encomendados` | character | 1 | d55 |
| `postings$miguel` | character | 1 | d55 |
| `postings$presgrave` | character | 1 | d55 |
| `postings$trajano` | character | 1 | d55 |
| `postings$medeiros` | character | 1 | d55 |
| `postings$projeto` | character | 1 | d55 |
| `postings$desenvolvido` | character | 1 | d55 |
| `postings$august` | character | 1 | d55 |
| `postings$kloenne` | character | 1 | d55 |
| `postings$portanto` | character | 1 | d56 |
| `postings$conjunto` | character | 1 | d56 |
| `postings$obras` | character | 1 | d56 |
| `postings$conduzido` | character | 1 | d56 |
| `postings$desse` | character | 2 | d56, d62 |
| `postings$plano` | character | 1 | d56 |
| `postings$conhecidos` | character | 1 | d56 |
| `postings$canais` | character | 1 | d56 |
| `postings$pontoes` | character | 1 | d57 |
| `postings$instalados` | character | 2 | d57, d61 |
| `postings$material` | character | 1 | d57 |
| `postings$importado` | character | 1 | d57 |
| `postings$alemanha` | character | 1 | d57 |
| `postings$washington` | character | 1 | d57 |
| `postings$prefeito` | character | 1 | d57 |
| `postings$pessoa` | character | 1 | d57 |
| `postings$atravessar` | character | 1 | d57 |
| `postings$carro` | character | 1 | d57 |
| `postings$acompanhado` | character | 1 | d57 |
| `postings$comitiva` | character | 1 | d57 |
| `postings$metros` | character | 1 | d58 |
| `postings$largura` | character | 1 | d58 |
| `postings$vao` | character | 1 | d58 |
| `postings$180` | character | 1 | d58 |
| `postings$torres` | character | 2 | d58, d61 |
| `postings$pista` | character | 1 | d58 |
| `postings$altura` | character | 1 | d58 |
| `postings$dependendo` | character | 1 | d58 |
| `postings$mare` | character | 1 | d58 |
| `postings$suspensa` | character | 2 | d58, d62 |
| `postings$16` | character | 1 | d58 |
| `postings$blocos` | character | 2 | d58, d63 |
| `postings$ancoragem` | character | 1 | d58 |
| `postings$cobertas` | character | 1 | d58 |
| `postings$concreto` | character | 1 | d58 |
| `postings$20` | character | 1 | d58 |
| `postings$carga` | character | 2 | d58, d59 |
| `postings$maxima` | character | 1 | d58 |
| `postings$60` | character | 1 | d58 |
| `postings$toneladas` | character | 1 | d58 |
| `postings$disponivel` | character | 1 | d58 |
| `postings$piso` | character | 3 | d58, d60, d61 |
| `postings$madeira` | character | 3 | d58, d60, d61 |
| `postings$manutencao` | character | 1 | d59 |
| `postings$conservacao` | character | 1 | d59 |
| `postings$apoiadas` | character | 1 | d59 |
| `postings$instituto` | character | 1 | d59 |
| `postings$pesquisas` | character | 1 | d59 |
| `postings$tecnologicas` | character | 1 | d59 |
| `postings$1936` | character | 1 | d59 |
| `postings$teste` | character | 1 | d59 |
| `postings$estatica` | character | 1 | d59 |
| `postings$avaliar` | character | 1 | d59 |
| `postings$poderia` | character | 1 | d59 |
| `postings$usada` | character | 2 | d59, d64 |
| `postings$testes` | character | 1 | d59 |
| `postings$corrosao` | character | 2 | d59, d61 |
| `postings$posterior` | character | 1 | d59 |
| `postings$reforco` | character | 1 | d59 |
| `postings$decada` | character | 2 | d59, d60 |
| `postings$1940` | character | 1 | d59 |
| `postings$1990` | character | 1 | d60 |
| `postings$substituido` | character | 2 | d60, d61 |
| `postings$verificadas` | character | 1 | d60 |
| `postings$permitir` | character | 1 | d60 |
| `postings$deslocamento` | character | 1 | d60 |
| `postings$estavam` | character | 1 | d60 |
| `postings$comecando` | character | 1 | d60 |
| `postings$corroer` | character | 1 | d60 |
| `postings$comemorar` | character | 1 | d61 |
| `postings$aniversario` | character | 1 | d61 |
| `postings$100` | character | 1 | d61 |
| `postings$2013` | character | 1 | d61 |
| `postings$reinaugurada` | character | 1 | d61 |
| `postings$30` | character | 2 | d61, d63 |
| `postings$empresa` | character | 1 | d61 |
| `postings$responsavel` | character | 1 | d61 |
| `postings$obra` | character | 1 | d61 |
| `postings$concrejato` | character | 2 | d61, d63 |
| `postings$concremat` | character | 1 | d61 |
| `postings$prazo` | character | 1 | d61 |
| `postings$conclusao` | character | 1 | d61 |
| `postings$restauracao` | character | 3 | d61, d62, d63 |
| `postings$alterado` | character | 1 | d61 |
| `postings$vezes` | character | 2 | d61, d63 |
| `postings$dezesseis` | character | 1 | d61 |
| `postings$provisorios` | character | 1 | d61 |
| `postings$mantidos` | character | 1 | d61 |
| `postings$temporarias` | character | 1 | d61 |
| `postings$proximas` | character | 1 | d61 |
| `postings$novos` | character | 1 | d61 |
| `postings$importados` | character | 1 | d61 |
| `postings$italia` | character | 1 | d61 |
| `postings$pudessem` | character | 1 | d61 |
| `postings$reparadas` | character | 1 | d61 |
| `postings$estrutura` | character | 1 | d61 |
| `postings$jateada` | character | 1 | d61 |
| `postings$repintada` | character | 1 | d61 |
| `postings$tinta` | character | 1 | d61 |
| `postings$resistente` | character | 1 | d61 |
| `postings$pavimentos` | character | 1 | d61 |
| `postings$separados` | character | 1 | d61 |
| `postings$estrada` | character | 1 | d61 |
| `postings$tornados` | character | 1 | d61 |
| `postings$acessiveis` | character | 1 | d61 |
| `postings$china` | character | 1 | d62 |
| `postings$africa` | character | 1 | d62 |
| `postings$escocia` | character | 1 | d62 |
| `postings$substituicao` | character | 1 | d62 |
| `postings$tipo` | character | 1 | d62 |
| `postings$previa` | character | 1 | d63 |
| `postings$reabrir` | character | 1 | d63 |
| `postings$centenario` | character | 1 | d63 |
| `postings$2014` | character | 1 | d63 |
| `postings$reabertura` | character | 1 | d63 |
| `postings$atrasada` | character | 1 | d63 |
| `postings$complexidade` | character | 1 | d63 |
| `postings$reparo` | character | 1 | d63 |
| `postings$atraso` | character | 1 | d63 |
| `postings$rachaduras` | character | 1 | d63 |
| `postings$apareceram` | character | 1 | d63 |
| `postings$suportam` | character | 1 | d63 |
| `postings$finalmente` | character | 1 | d63 |
| `postings$reaberta` | character | 1 | d63 |
| `postings$cerimonia` | character | 1 | d63 |
| `postings$abertura` | character | 1 | d63 |
| `postings$presenca` | character | 1 | d63 |
| `postings$geraldo` | character | 1 | d63 |
| `postings$alckmin` | character | 1 | d63 |
| `postings$acabou` | character | 1 | d63 |
| `postings$custou` | character | 1 | d63 |
| `postings$r` | character | 1 | d63 |
| `postings$33` | character | 1 | d63 |
| `postings$iluminacao` | character | 1 | d63 |
| `postings$deveria` | character | 1 | d63 |
| `postings$substituida` | character | 1 | d63 |
| `postings$parceria` | character | 1 | d63 |
| `postings$prefeitura` | character | 1 | d63 |
| `postings$existente` | character | 1 | d63 |
| `postings$mantida` | character | 1 | d63 |
| `postings$instalada` | character | 1 | d63 |
| `postings$novembro` | character | 1 | d63 |
| `postings$2016` | character | 1 | d63 |
| `postings$base` | character | 1 | d63 |
| `postings$policial` | character | 1 | d63 |
| `postings$planejada` | character | 1 | d63 |
| `postings$abrigar` | character | 1 | d63 |
| `postings$policia` | character | 1 | d63 |
| `postings$guarda` | character | 1 | d63 |
| `postings$civil` | character | 1 | d63 |
| `postings$transporte` | character | 1 | d63 |
| `postings$pronta` | character | 1 | d63 |
| `postings$momento` | character | 1 | d63 |
| `postings$12` | character | 1 | d64 |
| `postings$mil` | character | 1 | d64 |
| `postings$tiveram` | character | 1 | d64 |
| `postings$usar` | character | 1 | d64 |
| `postings$pequeno` | character | 1 | d64 |
| `postings$marco` | character | 1 | d64 |
| `postings$frequentemente` | character | 1 | d64 |
| `postings$jovens` | character | 1 | d64 |
| `postings$saltar` | character | 1 | d64 |
| `postings$desapareceram` | character | 1 | d64 |
| `postings$resposta` | character | 1 | d64 |
| `postings$decidiu` | character | 1 | d64 |
| `postings$proibir` | character | 1 | d64 |
| `postings$salto` | character | 1 | d64 |
| `postings$colocou` | character | 1 | d64 |
| `postings$sinais` | character | 1 | d64 |
| `postings$alerta` | character | 1 | d64 |
| `postings$alertar` | character | 1 | d64 |
| `r` | character | 1 | d4 |
| `REPO` | character | 1 | https://raw.githubuserconte... |
| `termo` | character | 1 | pedestres |
| `todos` | character, nomeado | 5596 | d11 sao, d12 vicente, d13 oficialmente, d14 estancia, d15 balnearia, d16 de, ... |
| `tokens_g$d1` | character | 58 | sao, vicente, oficialmente, estancia, balnearia, sao, ... |
| `tokens_g$d2` | character | 127 | sao, vicente, marca, inicio, efetivo, colonizacao, ... |
| `tokens_g$d3` | character | 109 | um, pib, mais, 6, bilhoes, reais, ... |
| `tokens_g$d4` | character | 152 | sao, vicente, preserva, diversos, sitios, edificios, ... |
| `tokens_g$d5` | character | 27 | ilha, gohayo, descoberta, 22, janeiro, 1502, ... |
| `tokens_g$d6` | character | 74 | nas, primeiras, decadas, seculo, xvi, existiu, ... |
| `tokens_g$d7` | character | 77 | entre, 1530, 1532, expedicao, liderada, pelo, ... |
| `tokens_g$d8` | character | 57 | sustentou, por, espaco, tres, anos, continuas, ... |
| `tokens_g$d9` | character | 35 | martim, afonso, tambem, introduziu, cultura, canavieira, ... |
| `tokens_g$d10` | character | 34 | inicio, colonizacao, portuguesa, padre, jose, anchieta, ... |
| `tokens_g$d11` | character | 117 | guerra, iguape, ocorreu, entre, os, anos, ... |
| `tokens_g$d12` | character | 58 | final, ano, 1541, ocorreu, pior, desastre, ... |
| `tokens_g$d13` | character | 35 | meados, seculo, xvi, vila, sao, vicente, ... |
| `tokens_g$d14` | character | 37 | por, volta, 1560, sao, vicente, sofreu, ... |
| `tokens_g$d15` | character | 51 | dezembro, 1591, sao, vicente, saqueada, pelo, ... |
| `tokens_g$d16` | character | 45 | 1615, outro, pirata, atacou, sao, vicente, ... |
| `tokens_g$d17` | character | 33 | 1624, devido, disputas, entre, os, descendentes, ... |
| `tokens_g$d18` | character | 49 | segundo, enciclopedia, dos, municipios, brasileiros, sao, ... |
| `tokens_g$d19` | character | 49 | morro, voturua, um, acidente, geografico, explorado, ... |
| `tokens_g$d20` | character | 50 | uma, das, caracteristicas, regiao, alta, taxa, ... |
| `tokens_g$d21` | character | 74 | cristianismo, se, faz, presente, na, cidade, ... |
| `tokens_g$d22` | character | 28 | sistema, telefones, automaticos, inaugurado, na, cidade, ... |
| `tokens_g$d23` | character | 42 | universidade, estadual, paulista, unesp, possui, curso, ... |
| `tokens_g$d24` | character | 31 | martim, afonso, sousa, vila, vicosa, c, ... |
| `tokens_g$d25` | character | 66 | martim, afonso, era, filho, primogenito, lopo, ... |
| `tokens_g$d26` | character | 45 | algum, tempo, depois, nomeado, pelo, rei, ... |
| `tokens_g$d27` | character | 98 | martim, afonso, sousa, descendia, dos, sousa, ... |
| `tokens_g$d28` | character | 40 | martim, afonso, sousa, escapou, vida, batalha, ... |
| `tokens_g$d29` | character | 64 | deste, casamento, nasceu, lopo, sousa, senhor, ... |
| `tokens_g$d30` | character | 109 | ao, deixar, servico, duque, braganca, 1516, ... |
| `tokens_g$d31` | character | 146 | acompanhou, rainha, viuva, d, leonor, austria, ... |
| `tokens_g$d32` | character | 33 | espanha, onde, viveu, quatro, anos, lutou, ... |
| `tokens_g$d33` | character | 63 | iniciou, sua, carreira, homem, mar, guerra, ... |
| `tokens_g$d34` | character | 46 | historiografia, tradicional, brasileira, encara, sua, expedicao, ... |
| `tokens_g$d35` | character | 38 | fundou, 22, janeiro, 1532, primeira, vila, ... |
| `tokens_g$d36` | character | 205 | lisboa, saiu, governador, martim, afonso, sousa, ... |
| `tokens_g$d37` | character | 48 | depois, percorrer, todo, litoral, ate, foz, ... |
| `tokens_g$d38` | character | 47 | durante, ano, 1532, perdeu, parte, sua, ... |
| `tokens_g$d39` | character | 32 | uma, onda, gigante, um, possivel, maremoto, ... |
| `tokens_g$d40` | character | 55 | combateu, corsarios, franceses, litoral, agraciado, pela, ... |
| `tokens_g$d41` | character | 37 | na, regiao, planalto, na, aldeia, piratininga, ... |
| `tokens_g$d42` | character | 83 | sua, expedicao, trouxe, brasil, como, ferreiro, ... |
| `tokens_g$d43` | character | 58 | ja, 1533, se, encontrava, portugal, entao, ... |
| `tokens_g$d44` | character | 42 | nomeado, capitao, mor, mar, das, indias, ... |
| `tokens_g$d45` | character | 117 | chegando, india, diz, historia, genealogica, casa, ... |
| `tokens_g$d46` | character | 196 | uma, carta, escrita, cochim, durante, esse, ... |
| `tokens_g$d47` | character | 41 | ha, controversia, quanto, ao, fim, sua, ... |
| `tokens_g$d48` | character | 41 | senhor, alcoentre, comprou, ao, marques, vila, ... |
| `tokens_g$d49` | character | 57 | ana, pimentel, esposa, martim, afonso, sousa, ... |
| `tokens_g$d50` | character | 56 | rodrigo, afonso, sousa, entrou, na, ordem, ... |
| `tokens_g$d51` | character | 71 | segundo, livro, linhagens, conde, d, pedro, ... |
| `tokens_g$d52` | character | 34 | seu, brasao, armas, descrito, seguinte, forma, ... |
| `tokens_g$d53` | character | 59 | ponte, pensil, sao, vicente, uma, ponte, ... |
| `tokens_g$d54` | character | 44 | ponte, esta, localizada, sao, vicente, na, ... |
| `tokens_g$d55` | character | 51 | ponte, proposta, pela, primeira, vez, 1910, ... |
| `tokens_g$d56` | character | 25 | faz, parte, portanto, conjunto, obras, saneamento, ... |
| `tokens_g$d57` | character | 36 | os, pontoes, ponte, foram, instalados, 1911, ... |
| `tokens_g$d58` | character | 65 | ponte, tem, 6, 4, metros, largura, ... |
| `tokens_g$d59` | character | 36 | manutencao, conservacao, ponte, sao, apoiadas, pelo, ... |
| `tokens_g$d60` | character | 28 | na, decada, 1990, piso, madeira, substituido, ... |
| `tokens_g$d61` | character | 73 | comemorar, aniversario, 100, anos, ponte, comecou, ... |
| `tokens_g$d62` | character | 30 | restauracao, quinta, restauracao, uma, ponte, suspensa, ... |
| `tokens_g$d63` | character | 101 | originalmente, se, previa, reabrir, ponte, seu, ... |
| `tokens_g$d64` | character | 51 | ponte, usada, por, 12, mil, moradores, ... |

### Funções definidas

`anexar_estado`, `busca_AND`, `busca_booleana`, `cfg_aula`, `cosseno`, `docs_aula`, `estado`, `idf_classico`, `limpar`, `matriz_tf`, `montar`, `norm_cols`, `ranking_cosseno`, `sem_stop`, `tok`, `tokenizar`, `vetor_consulta`
<!-- estado-R:fim -->

