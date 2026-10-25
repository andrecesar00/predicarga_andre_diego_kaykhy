# Consolidado — PI III — Aula 06 — Parte D — 2026-10-25
*guia versão 1 · tutora: Perplexity · sessão de grupo · motor06*

**Grupo:** Predicarga · **presentes:** Andre Cesar Franco, Diego de Farias Carazo Prieto e Kaykhy Donizete Freitas de Oliveira · **digitou:** Andre Cesar Franco (Módulo 7), Diego de Farias Carazo Prieto (Módulos 8 e 9)

## 1. O que foi feito
- M7 — Rocchio no gabarito do grupo; completa × residual
- M8 — pseudo-realimentação em todas as consultas; $k$ escolhido no dev; teste relatado
- M9 — a decisão; `config.R` e ficha

## 2. Como o grupo trabalhou — opinião da tutora
O grupo reescreveu `rocchio` e `ranking_vetor`, validou o resultado no corpus do curso e aplicou o Rocchio à consulta q01. Entendeu que o ganho completo — AP de 0,023 para 1,000 — era otimista, porque o único relevante, d43, havia sido marcado e não estava no top-5 base; a residual ficou sem relevante ($R=0$) e `Dr_v` ficou vazio. No Módulo 8, o grupo testou PRF apenas no desenvolvimento, observou queda do MAP em todas as opções e identificou não julgados no top-3 de q01 e q03. A decisão de não usar a PRF saiu dos números apresentados, com a ressalva de gabarito parcial e poucas consultas.

## 3. Observações para a frente
- **Para a próxima sessão prática (Aula 07):** concluir os julgamentos pendentes e manter o corpus congelado; revisitar a decisão de PRF apenas se o gabarito ficar mais completo.
- **Perguntas guardadas:** embeddings e recuperação com outras palavras — Aula 07; significância do ganho — Aula 16; PRF com BM25 — fora do escopo desta aula.
- **Produzido:** entrada “Aula 06” na linha do tempo da ficha do projeto.
- **Ficha atualizada:** sim — seções alteradas: 5, 6, 7, cabeçalho.

---

<!-- estado-R:inicio -->
## Estado do R ao fim da sessão
*gerado por `anexar_estado()` em 2026-10-25 19:17 · R version 4.6.1 (2026-06-24) · motor06 v2 2026-10-08 · não edite à mão*

### Objetos

| objeto | tipo | tamanho | valor / amostra |
|---|---|---|---|
| `a` | character | 1 | qrels_Andre_2026-10-25.csv |
| `arqs` | character | 1 | qrels_Andre_2026-10-25.csv |
| `base` | numeric, nomeado | 64 | d6 0.1133, d2 0.06328, d4 0.04968, d1 0, d3 0, d5 0, ... |
| `cfg$minimo` | numeric | 1 | 200 |
| `cfg$limpar` | logical | 1 | TRUE |
| `cfg$acentos` | character | 1 | translit |
| `cfg$stopwords` | character | 12 | de, e, a, o, em, da, ... |
| `cfg$grupo` | character | 1 | Predicarga |
| `cfg$k1` | numeric | 1 | 1.2 |
| `cfg$b` | numeric | 1 | 0.75 |
| `cfg$limiar` | numeric | 1 | 1 |
| `cfg$prf_k` | numeric | 1 | 0 |
| `cfg$rocchio` | numeric, nomeado | 3 | a 1, b 0.75, g 0.15 |
| `consultas` | character, nomeado | 5 | q01 monumentos historicos centro, q02 fundacao vila martim afonso, q03 ponte pensil arquitetura, q04 ataques piratas baixada san..., q05 primeiros habitantes coloni... |
| `cp` | data.frame | 64 × 5 | colunas: id, titulo, texto, fonte, url |
| `dev` | character | 3 | q01, q02, q03 |
| `Dnr` | character | 0 |  |
| `docs` | character, nomeado | 64 | d1 São Vicente, oficialmente E..., d2 São Vicente marca o início ..., d3 Com um PIB de mais de 6 bil..., d4 São Vicente preserva divers..., d5 A Ilha de Gohayó foi descob..., d6 Nas primeiras décadas do sé..., ... |
| `Dr` | character | 1 | d43 |
| `Dr_v` | character | 0 |  |
| `fora` | character | 1 | d43 |
| `g` | numeric, nomeado | 1 | d43 2 |
| `ix$tokens` | list | 64 | elementos: d1, d2, d3, d4, d5, d6, d7, d8, ... |
| `ix$vocab` | character | 1831 | 0, 01, 0132, 06, 1, 100, ... |
| `ix$tf` | matrix | 1831 × 64 | linhas: 0, 01, 0132, ... \| colunas: d1, d2, d3, d4, ... |
| `ix$N` | integer | 1 | 64 |
| `ix$df` | numeric, nomeado | 1831 | 0 1, 01 1, 0132 1, 06 1, 1 4, 100 1, ... |
| `ix$idf_tfidf` | numeric, nomeado | 1831 | 0 4.159, 01 4.159, 0132 4.159, 06 4.159, 1 2.773, 100 4.159, ... |
| `ix$w` | matrix | 1831 × 64 | linhas: 0, 01, 0132, ... \| colunas: d1, d2, d3, d4, ... |
| `ix$wn` | matrix | 1831 × 64 | linhas: 0, 01, 0132, ... \| colunas: d1, d2, d3, d4, ... |
| `ix$postings` | list | 1831 | elementos: sao, vicente, oficialmente, estancia, balnearia, um, municipio, brasileiro, ... |
| `ix$dl` | numeric, nomeado | 64 | d1 58, d2 127, d3 109, d4 152, d5 27, d6 74, ... |
| `ix$avgdl` | numeric | 1 | 62.75 |
| `ix$idf_bm25` | numeric, nomeado | 1831 | 0 3.769, 01 3.769, 0132 3.769, 06 3.769, 1 2.67, 100 3.769, ... |
| `ix_aula$tokens` | list | 8 | elementos: d1, d2, d3, d4, d5, d6, d7, d8 |
| `ix_aula$vocab` | character | 45 | a, acelera, aprendizado, avaliacao, bm25, busca, ... |
| `ix_aula$tf` | matrix | 45 × 8 | linhas: a, acelera, aprendizado, ... \| colunas: d1, d2, d3, d4, ... |
| `ix_aula$N` | integer | 1 | 8 |
| `ix_aula$df` | numeric, nomeado | 45 | a 4, acelera 1, aprendizado 1, avaliacao 1, bm25 1, busca 2, ... |
| `ix_aula$idf_tfidf` | numeric, nomeado | 45 | a 0.6931, acelera 2.079, aprendizado 2.079, avaliacao 2.079, bm25 2.079, busca 1.386, ... |
| `ix_aula$w` | matrix | 45 × 8 | linhas: a, acelera, aprendizado, ... \| colunas: d1, d2, d3, d4, ... |
| `ix_aula$wn` | matrix | 45 × 8 | linhas: a, acelera, aprendizado, ... \| colunas: d1, d2, d3, d4, ... |
| `ix_aula$postings` | list | 45 | elementos: recuperacao, de, informacao, ordena, documentos, por, relevancia, o, ... |
| `ix_aula$dl` | numeric, nomeado | 8 | d1 7, d2 9, d3 9, d4 6, d5 9, d6 8, ... |
| `ix_aula$avgdl` | numeric | 1 | 8 |
| `ix_aula$idf_bm25` | numeric, nomeado | 45 | a 0.6931, acelera 1.792, aprendizado 1.792, avaliacao 1.792, bm25 1.792, busca 1.281, ... |
| `MOTOR_VERSAO` | character | 1 | motor06 v2 2026-10-08 |
| `nec` | data.frame | 5 × 5 | colunas: consulta, texto_consulta, necessidade, escopo, conjunto |
| `novo` | numeric, nomeado | 64 | d43 0.9557, d30 0.1181, d46 0.1134, d26 0.1066, d33 0.1052, d29 0.09335, ... |
| `origem` | character, nomeado | 64 | d1 São Vicente (São Paulo), d2 São Vicente (São Paulo), d3 São Vicente (São Paulo), d4 São Vicente (São Paulo), d5 São Vicente (São Paulo), d6 São Vicente (São Paulo), ... |
| `q` | character | 1 | q01 |
| `q_aula` | numeric, nomeado | 45 | a 0, acelera 0, aprendizado 0, avaliacao 0, bm25 0, busca 0, ... |
| `q0` | numeric, nomeado | 1831 | 0 0, 01 0, 0132 0, 06 0, 1 0, 100 0, ... |
| `qrels$q01` | numeric, nomeado | 1 | d43 2 |
| `qrels$q02` | numeric, nomeado | 5 | d59 1, d57 1, d15 2, d8 1, d26 2 |
| `qrels$q03` | numeric, nomeado | 2 | d60 1, d32 1 |
| `qrels$q04` | numeric, nomeado | 6 | d57 1, d8 2, d22 1, d28 1, d24 2, d40 2 |
| `qrels$q05` | numeric, nomeado | 7 | d6 2, d36 2, d22 0, d58 1, d50 2, d45 2, ... |
| `R_q` | integer, nomeado | 5 | q01 1, q02 5, q03 2, q04 6, q05 6 |
| `REPO` | character | 1 | https://raw.githubuserconte... |
| `tab_dev` | matrix | 4 × 3 | linhas: base, k2, k3, ... \| colunas: q01, q02, q03 |
| `usar` | character | 5 | q01, q02, q03, q04, q05 |

### Funções definidas

`anexar_estado`, `ap`, `ap_q`, `bm25`, `bm25_doc`, `busca_AND`, `busca_booleana`, `cfg_aula`, `cosseno`, `dcg`, `docs_aula`, `estado`, `gabarito_aula`, `idf_bm25`, `idf_classico`, `indice_invertido`, `kappa_cohen`, `kappa_matriz`, `ler_qrels`, `limpar`, `matriz_tf`, `metricas`, `montar`, `ndcg`, `norm_cols`, `precisao_k`, `preparar`, `prf`, `ranking_bm25`, `ranking_cosseno`, `ranking_motor`, `ranking_vetor`, `recall_k`, `relevancia`, `residual`, `rocchio`, `rr`, `saturacao`, `sem_stop`, `stopwords_aula`, `tokenizar`, `vetor_consulta`
<!-- estado-R:fim -->

