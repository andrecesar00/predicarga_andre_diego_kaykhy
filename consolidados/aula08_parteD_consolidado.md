# Consolidado — PI III — Aula 08 — Parte D — 2026-11-06
*guia versão 2 · tutora: Gemini · sessão de grupo · motor08*
**Grupo:** Predicarga · **presentes:** Andre Cesar Franco, Diego de Farias Carazo Prieto, Kaykhy Donizete Freitas de Oliveira · **digitou:** Andre (M7), Diego (M8), Kaykhy (M9)

## 1. O que foi feito
- M7 — proximidade e reordenar no estágio 1 do grupo (bm25); top-5 antes × depois em q01, lendo os textos e constatando manutenção integral da ordem.
- M8 — grade $k \in \{3, 5, 10\}$ × janela $\in \{2, 3, 5\}$ em todas as consultas; resultado invariante no dev (MAP 0,066); escolha no dev fundamentada na parcimónia computacional; teste relatado uma única vez (MAP 0,092 → 0,092).
- M9 — decisão de não reordenar ($k = 0$, janela 3); gravação em `config.R` e atualização da ficha.

## 2. Como o grupo trabalhou — opinião da tutora
O grupo trabalhou com elevado rigor técnico e metodológico. As funções centrais de proximidade e reordenação foram integradas com sucesso ao motor base. Ao analisarem o comportamento na consulta q01 e a grade completa de desenvolvimento, os integrantes constataram que a pontuação de proximidade era neutra em relação ao BM25. Em vez de forçarem uma complexidade artificial, optaram acertadamente por não reordenar no estágio 2 ($k = 0$), respeitando as boas práticas de engenharia de software e ciência de dados. A avaliação no conjunto de teste foi mantida para o momento regulamentar e executada uma única vez, demonstrando compreensão dos princípios de avaliação de recuperação de informação.

## 3. Observações para a frente
- **Para a próxima sessão prática (Aula 09):** Repositório sincronizado com as configurações de dois estágios e qrels atualizados para a extração de atributos no *Learning to Rank*.
- **Perguntas guardadas:** Combinação estatística e balanceamento de sinais de texto — Aula 09 (Learning to Rank).
- **Produzido:** ver a entrada "Aula 08" na linha do tempo da ficha do projeto.
- **Ficha atualizada:** sim — seções alteradas: 1, 4, 5, 6, 7 e cabeçalho (reconstruída na Aula 08).

---

<!-- estado-R:inicio -->
## Estado do R ao fim da sessão
*gerado por `anexar_estado()` em 2026-11-06 13:55 · R version 4.6.1 (2026-06-24) · motor08 v2 2026-10-22 · não edite à mão*

### Objetos

| objeto | tipo | tamanho | valor / amostra |
|---|---|---|---|
| `a` | character | 1 | qrels_Andre_2026-10-25.csv |
| `ap0` | numeric, nomeado | 3 | q01 0.02326, q02 0.09722, q03 0.07881 |
| `ap1` | numeric, nomeado | 3 | q01 0.02326, q02 0.09722, q03 0.07881 |
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
| `grade` | matrix | 3 × 3 | linhas: k3, k5, k10 \| colunas: janela2, janela3, janela5 |
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
| `j_esc` | numeric | 1 | 3 |
| `k_esc` | numeric | 1 | 0 |
| `m` | NULL | 0 |  |
| `map0` | numeric | 1 | 0.06643 |
| `MOTOR_VERSAO` | character | 1 | motor08 v2 2026-10-22 |
| `nec` | data.frame | 5 × 5 | colunas: consulta, texto_consulta, necessidade, escopo, conjunto |
| `origem` | character, nomeado | 64 | d1 São Vicente (São Paulo), d2 São Vicente (São Paulo), d3 São Vicente (São Paulo), d4 São Vicente (São Paulo), d5 São Vicente (São Paulo), d6 São Vicente (São Paulo), ... |
| `q` | character | 1 | q01 |
| `qrels$q01` | numeric, nomeado | 1 | d43 2 |
| `qrels$q02` | numeric, nomeado | 5 | d59 1, d57 1, d15 2, d8 1, d26 2 |
| `qrels$q03` | numeric, nomeado | 2 | d60 1, d32 1 |
| `qrels$q04` | numeric, nomeado | 6 | d57 1, d8 2, d22 1, d28 1, d24 2, d40 2 |
| `qrels$q05` | numeric, nomeado | 7 | d6 2, d36 2, d22 0, d58 1, d50 2, d45 2, ... |
| `qt` | character | 3 | monumentos, historicos, centro |
| `qts$q01` | character | 3 | monumentos, historicos, centro |
| `qts$q02` | character | 4 | fundacao, vila, martim, afonso |
| `qts$q03` | character | 3 | ponte, pensil, arquitetura |
| `qts$q04` | character | 4 | ataques, piratas, baixada, santista |
| `qts$q05` | character | 5 | primeiros, habitantes, colonizacao, sao, vicente |
| `R_q` | integer, nomeado | 5 | q01 1, q02 5, q03 2, q04 6, q05 6 |
| `REPO` | character | 1 | https://raw.githubuserconte... |
| `rk` | numeric, nomeado | 64 | d6 3.511, d2 2.296, d4 2.06, d1 0, d3 0, d5 0, ... |
| `rks$q01` | numeric, nomeado | 64 | d6 3.511, d2 2.296, d4 2.06, d1 0, d3 0, d5 0, ... |
| `rks$q02` | numeric, nomeado | 64 | d24 4.369, d17 4.298, d7 4.023, d38 3.861, d8 3.599, d27 3.595, ... |
| `rks$q03` | numeric, nomeado | 64 | d53 7.058, d4 3.053, d64 2.749, d57 2.718, d62 2.533, d59 2.455, ... |
| `rks$q04` | numeric, nomeado | 64 | d54 7.424, d1 6.724, d16 4.262, d2 0, d3 0, d4 0, ... |
| `rks$q05` | numeric, nomeado | 64 | d2 7.693, d1 5.736, d25 4.167, d12 4.132, d10 3.596, d11 3.448, ... |
| `rn` | character | 64 | d6, d2, d4, d1, d3, d5, ... |
| `tab_teste` | matrix | 2 × 2 | linhas: estagio1, rerank \| colunas: q04, q05 |
| `teste` | character | 2 | q04, q05 |
| `usar` | character | 5 | q01, q02, q03, q04, q05 |

### Funções definidas

`anexar_estado`, `ap`, `ap_rerank`, `bm25`, `bm25_doc`, `busca_AND`, `busca_booleana`, `cfg_aula`, `cosseno`, `dcg`, `docs_aula`, `estado`, `estagio1`, `gabarito_aula`, `idf_bm25`, `idf_classico`, `indice_invertido`, `kappa_cohen`, `kappa_matriz`, `ler_qrels`, `limpar`, `lsa`, `matriz_tf`, `metricas`, `montar`, `ndcg`, `norm_cols`, `precisao_k`, `preparar`, `prf`, `proximidade`, `ranking_bm25`, `ranking_cosseno`, `ranking_lsa`, `ranking_vetor`, `recall_k`, `relevancia`, `reordenar`, `rerank_prox`, `residual`, `rocchio`, `rr`, `rrf`, `saturacao`, `sem_stop`, `stopwords_aula`, `tokenizar`, `vetor_consulta`
<!-- estado-R:fim -->

