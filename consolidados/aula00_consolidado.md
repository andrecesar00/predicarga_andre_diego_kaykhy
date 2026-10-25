# Consolidado — PI III — Aula 00 — 2026-10-24
*guia versão 3 · tutora: Gemini · sessão individual (teoria) · sem motor*
**Aluno:** André Cesar Franco

## 1. O que foi passado
- M1 — Colab em R, `<-`, o corpus `docs` como vetor de 8; `[1]`; R começa em 1; vetorização
- M2 — nomes; `[ ]` preserva o nome, `[[ ]]` não; `==`
- M3 — `nchar` versus `length`; `toupper`/`tolower`; `substr`; `paste`/`paste0`/`collapse`
- M4 — `strsplit` (lista), `unlist`
- M5 — funções; a última expressão é devolvida; escreveu `tokenizar` e `maiuscula`
- M6 — `lapply` (lista) e `sapply` (simplifica); `sum`, `list`; `tokens`
- M7 — `table`; `factor(levels = …)` fixa categorias e zeros; `sort`; `%in%`, `!` e o filtro
- M8 — matriz por coluna; reciclagem em `m * peso`
- M9 — regex I: `grep`/`grepl`, `^ $ | [ ] +`; pedaço não é palavra (`grep("de", docs)`)
- M10 — regex II: `sub`/`gsub`, `. * {n} {n,} [^ ]`, `trimws`, o pipeline de limpeza; `tokenizar` com `\\s+`
- M11 — o mapa da Aula 01

## 2. Como foi o aprendizado — opinião da tutora
O aluno executou os blocos diretamente no Colab em ambiente R. Demonstrou boa intuição de linguagens de programação, assimilando com rapidez que a indexação em R se inicia em 1 e que o retorno de funções não requer `return` explícito. Teve facilidade com a distinção de estruturas em `lapply` e `sapply` e na definição de `sub` versus `gsub`. Apresentou hesitações e preferiu não arriscar previsões em operações de caracteres versus vetor (`nchar` vs `length`), na lógica de preenchimento por coluna com reciclagem em matrizes, no papel de `factor(levels = ...)` para preenchimento de zeros e na sutileza de casamento de pedaços em expressões regulares.

**Teste final:** acertou M1, M2, M5, M6, M10, M11; a revisar M3 (`nchar` vs `length`), M4 (`strsplit` e `unlist`), M7 (`factor` e zeros), M8 (reciclagem matricial) e M9 (regex casando pedaço).

## 3. Observações para a frente
- **Revisar antes da Aula 01:** O papel de `factor(levels = vocab)` na geração de matrizes uniformes e o mecanismo de reciclagem de pesos por linha em matrizes.
- **Para a próxima tutora:** Aluno objetivo, prefere validação passo a passo e respostas pontuais; beneficia-se de ver o código rodando antes de formalizar previsões abstratas.
- **Perguntas guardadas:** Ponderação termo-documento (`tdm * idf`) para a Aula 01; tratamento de acentos e stopwords para a Aula 03.
- **Produzido:** `docs` digitado; `tokenizar` e `maiuscula` estruturadas; lista de tokens gerada.
- **Parte D (frases próprias + Colab e GitHub):** não iniciada — fazer antes da Aula 01.

---

<!-- estado-R:inicio -->
## Estado do R ao fim da sessão
*gerado por `anexar_estado()` em 2026-10-25 00:23 · R version 4.6.1 (2026-06-24) · sem motor · não edite à mão*

### Objetos

| objeto | tipo | tamanho | valor / amostra |
|---|---|---|---|
| `docs` | character, nomeado | 8 | d1 recuperacao de informacao o..., d2 o modelo de espaco vetorial..., d3 bm25 e um modelo probabilis..., d4 aprendizado estatistico fun..., d5 o indice invertido acelera ..., d6 embeddings capturam a seman..., ... |
| `f` | character, nomeado | 3 | f1 Quais sao os monumentos his..., f2 Historia da fundacao da Vil..., f3 Arquitetura   e   pontos  t... |
| `frase` | character | 1 | recuperacao de informacao |
| `freq` | table, nomeado | 22 | afonso 1, antigo 1, arquitetura 1, centro 2, culturais 1, da 2, ... |
| `m` | matrix | 2 × 2 | linhas: de, modelo \| colunas: d1, d2 |
| `peso` | numeric | 2 | 1, 10 |
| `sujo` | character | 1 |   O Modelo   de Espaco   Ve... |
| `tokens$f1` | character | 10 | quais, sao, os, monumentos, historicos, do, ... |
| `tokens$f2` | character | 11 | historia, da, fundacao, da, vila, de, ... |
| `tokens$f3` | character | 8 | arquitetura, e, pontos, turisticos, culturais, no, ... |
| `vocab` | character | 3 | de, modelo, busca |
| `x` | character, nomeado | 3 | f1 quais sao os monumentos his..., f2 historia da fundacao da vil..., f3 arquitetura e pontos turist... |

### Funções definidas

`anexar_estado`, `estado`, `maiuscula`, `tokenizar`
<!-- estado-R:fim -->

