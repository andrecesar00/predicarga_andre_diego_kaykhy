# Consolidado — PI III — Aula 07 — Parte D — 2026-10-25
*guia versão 2 · tutora: Perplexity · sessão de grupo · motor07*
**Grupo:** Predicarga · **presentes:** [confirmar nomes] · **digitou:** [nome por módulo]

## 1. O que foi feito
- M7 — LSA no corpus do grupo; LSA × BM25 numa consulta, lendo os textos
- M8 — BM25, LSA (vários \(k\)) e híbrido em todas as consultas; escolha no dev; teste relatado
- M9 — a decisão; `config.R` e ficha

## 2. Como o grupo trabalhou — opinião da tutora
[Escrever em primeira pessoa: leram os textos do top-5 ou só os números? escolheram no dev, ou quiseram ver o teste? a decisão saiu do grupo ou foi puxada? quem digitou entendeu?]

## 3. Observações para a frente
- **Para a próxima sessão prática (Aula 08):** [o que precisa estar pronto; quem ficou de quê]
- **Perguntas guardadas:** [pergunta] — [para qual aula]
- **Produzido:** ver a entrada "Aula 07" na linha do tempo da ficha do projeto
- **Ficha atualizada:** sim — seções alteradas: 5, 6, 7, cabeçalho

---

<!-- estado-R:inicio -->
## Estado do R ao fim da sessão
*gerado por `anexar_estado()` em 2026-10-25 20:19 · R version 4.6.1 (2026-06-24) · motor07 v1 2026-10-15 · não edite à mão*

### Objetos

| objeto | tipo | tamanho | valor / amostra |
|---|---|---|---|
| `a` | character | 1 | qrels_Andre_2026-10-25.csv |
| `arqs` | character | 1 | qrels_Andre_2026-10-25.csv |
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
| `cfg$modelo` | character | 1 | bm25 |
| `cfg$lsa_k` | numeric | 1 | 20 |
| `cfg$rrf_c` | numeric | 1 | 60 |
| `consultas` | character, nomeado | 5 | q01 monumentos historicos centro, q02 fundacao vila martim afonso, q03 ponte pensil arquitetura, q04 ataques piratas baixada san..., q05 primeiros habitantes coloni... |
| `cp` | data.frame | 64 × 5 | colunas: id, titulo, texto, fonte, url |
| `dev` | character | 3 | q01, q02, q03 |
| `docs` | character, nomeado | 64 | d1 São Vicente, oficialmente E..., d2 São Vicente marca o início ..., d3 Com um PIB de mais de 6 bil..., d4 São Vicente preserva divers..., d5 A Ilha de Gohayó foi descob..., d6 Nas primeiras décadas do sé..., ... |
| `escolha` | character | 1 | bm25 |
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
| `k_esc` | numeric | 1 | 20 |
| `ks` | numeric | 3 | 10, 20, 50 |
| `m_esc$U` | matrix | 1831 × 20 | linhas: 0, 01, 0132, ... \| colunas: (sem nomes) |
| `m_esc$S` | numeric | 20 | 66.92, 55.52, 47.93, 45.94, 41.01, 40.37, ... |
| `m_esc$D` | matrix | 64 × 20 | linhas: d1, d2, d3, ... \| colunas: (sem nomes) |
| `m20$U` | matrix | 1831 × 20 | linhas: 0, 01, 0132, ... \| colunas: (sem nomes) |
| `m20$S` | numeric | 20 | 66.92, 55.52, 47.93, 45.94, 41.01, 40.37, ... |
| `m20$D` | matrix | 64 × 20 | linhas: d1, d2, d3, ... \| colunas: (sem nomes) |
| `MOTOR_VERSAO` | character | 1 | motor07 v1 2026-10-15 |
| `ms$k10` | list | 3 | elementos: U, S, D |
| `ms$k20` | list | 3 | elementos: U, S, D |
| `ms$k50` | list | 3 | elementos: U, S, D |
| `nec` | data.frame | 5 × 5 | colunas: consulta, texto_consulta, necessidade, escopo, conjunto |
| `origem` | character, nomeado | 64 | d1 São Vicente (São Paulo), d2 São Vicente (São Paulo), d3 São Vicente (São Paulo), d4 São Vicente (São Paulo), d5 São Vicente (São Paulo), d6 São Vicente (São Paulo), ... |
| `q` | character | 1 | q01 |
| `qrels$q01` | numeric, nomeado | 1 | d43 2 |
| `qrels$q02` | numeric, nomeado | 5 | d59 1, d57 1, d15 2, d8 1, d26 2 |
| `qrels$q03` | numeric, nomeado | 2 | d60 1, d32 1 |
| `qrels$q04` | numeric, nomeado | 6 | d57 1, d8 2, d22 1, d28 1, d24 2, d40 2 |
| `qrels$q05` | numeric, nomeado | 7 | d6 2, d36 2, d22 0, d58 1, d50 2, d45 2, ... |
| `R_q` | integer, nomeado | 5 | q01 1, q02 5, q03 2, q04 6, q05 6 |
| `rb` | numeric, nomeado | 64 | d6 3.511, d2 2.296, d4 2.06, d1 0, d3 0, d5 0, ... |
| `REPO` | character | 1 | https://raw.githubuserconte... |
| `rl` | numeric, nomeado | 64 | d10 0.789, d12 0.783, d6 0.7583, d39 0.7379, d7 0.7107, d13 0.6932, ... |
| `s$d` | numeric | 64 | 66.92, 55.52, 47.93, 45.94, 41.01, 40.37, ... |
| `s$u` | matrix | 1831 × 64 | linhas: (sem nomes) \| colunas: (sem nomes) |
| `s$v` | matrix | 64 × 64 | linhas: (sem nomes) \| colunas: (sem nomes) |
| `so_lsa` | character | 4 | d10, d12, d39, d7 |
| `tab_dev` | matrix | 7 × 3 | linhas: bm25, lsa.k10, lsa.k20, ... \| colunas: q01, q02, q03 |
| `tab_teste` | matrix | 2 × 2 | linhas: bm25, escolhido \| colunas: q04, q05 |
| `teste` | character | 2 | q04, q05 |
| `usar` | character | 5 | q01, q02, q03, q04, q05 |

### Funções definidas

`anexar_estado`, `ap`, `ap_modelo`, `bm25`, `bm25_doc`, `busca_AND`, `busca_booleana`, `cfg_aula`, `cosseno`, `dcg`, `docs_aula`, `estado`, `gabarito_aula`, `idf_bm25`, `idf_classico`, `indice_invertido`, `kappa_cohen`, `kappa_matriz`, `ler_qrels`, `limpar`, `lsa`, `matriz_tf`, `metricas`, `montar`, `ndcg`, `norm_cols`, `precisao_k`, `preparar`, `prf`, `ranking_bm25`, `ranking_cosseno`, `ranking_lsa`, `ranking_modelo`, `ranking_motor`, `ranking_vetor`, `recall_k`, `relevancia`, `residual`, `rocchio`, `rr`, `rrf`, `saturacao`, `sem_stop`, `stopwords_aula`, `tokenizar`, `vetor_consulta`
<!-- estado-R:fim -->

