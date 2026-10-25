# Consolidado — PI III — Aula 5,5 — Parte D — 2026-10-25
*guia versão 3 · sessão de grupo · motor05b*
**Grupo:** Predicarga · **presentes:** André · **digitou:** [confirmar quem digitou em cada módulo]

## 1. O que foi feito
- M10 — gabarito `qrels_Andre_2026-10-25.csv` lido; limiar de relevância grau ≥ 1 decidido; consultas q01–q05 entraram na avaliação.
- M11 — métricas P@k, AP, RR, nDCG binário e nDCG graduado escritas como funções; teste contra os números da teoria passou; análise da consulta q01 e do documento relevante d43.
- M12 — avaliação das cinco consultas; médias, contagem de vitórias e declaração do resultado comparativo entre BM25 e cosseno.

## 2. Como o grupo trabalhou — opinião da tutora
[Completar com a avaliação do grupo: o limiar foi decidido antes das métricas e com justificativa? O teste contra a teoria passou de primeira? O grupo leu o documento d43 e identificou a limitação de vocabulário? Quem digitou entendeu o que rodou?]

## 3. Observações para a frente
- **Para a próxima sessão prática (Aula 06):** concluir o gabarito das consultas de trabalho, realizar a segunda passada e, quando houver dois julgamentos comparáveis, calcular o kappa.
- **Perguntas guardadas:** significância estatística da diferença entre BM25 e cosseno — Aula 16; uso do gabarito para reescrever consultas — Aula 06.
- **Produzido:** entrada “Aula 5,5” na linha do tempo da ficha do projeto.
- **Ficha atualizada:** sim — seções alteradas: 4, 5, 6, 7 e cabeçalho.

---

<!-- estado-R:inicio -->
## Estado do R ao fim da sessão
*gerado por `anexar_estado()` em 2026-10-25 18:35 · R version 4.6.1 (2026-06-24) · motor05b v1 2026-10-01 · não edite à mão*

### Objetos

| objeto | tipo | tamanho | valor / amostra |
|---|---|---|---|
| `a` | character | 1 | qrels_Andre_2026-10-25.csv |
| `arqs` | character | 1 | qrels_Andre_2026-10-25.csv |
| `bm` | numeric, nomeado | 5 | P_at_k 0, AP 0.02326, RR 0.02326, nDCG_bin 0.1832, nDCG_grad 0.1832 |
| `cfg$minimo` | numeric | 1 | 200 |
| `cfg$limpar` | logical | 1 | TRUE |
| `cfg$acentos` | character | 1 | translit |
| `cfg$stopwords` | character | 12 | de, e, a, o, em, da, ... |
| `cfg$grupo` | character | 1 | Predicarga |
| `cfg$k1` | numeric | 1 | 1.2 |
| `cfg$b` | numeric | 1 | 0.75 |
| `cfg$limiar` | numeric | 1 | 1 |
| `consultas` | character, nomeado | 5 | q01 monumentos historicos centro, q02 fundacao vila martim afonso, q03 ponte pensil arquitetura, q04 ataques piratas baixada san..., q05 primeiros habitantes coloni... |
| `cp` | data.frame | 64 × 5 | colunas: id, titulo, texto, fonte, url |
| `cs` | numeric, nomeado | 5 | P_at_k 0, AP 0.02326, RR 0.02326, nDCG_bin 0.1832, nDCG_grad 0.1832 |
| `docs` | character, nomeado | 64 | d1 São Vicente, oficialmente E..., d2 São Vicente marca o início ..., d3 Com um PIB de mais de 6 bil..., d4 São Vicente preserva divers..., d5 A Ilha de Gohayó foi descob..., d6 Nas primeiras décadas do sé..., ... |
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
| `MOTOR_VERSAO` | character | 1 | motor05b v1 2026-10-01 |
| `nec` | data.frame | 5 × 5 | colunas: consulta, texto_consulta, necessidade, escopo, conjunto |
| `origem` | character, nomeado | 64 | d1 São Vicente (São Paulo), d2 São Vicente (São Paulo), d3 São Vicente (São Paulo), d4 São Vicente (São Paulo), d5 São Vicente (São Paulo), d6 São Vicente (São Paulo), ... |
| `q` | character | 1 | q01 |
| `q_aula` | character | 1 | modelo de recuperacao |
| `qrels$q01` | numeric, nomeado | 1 | d43 2 |
| `qrels$q02` | numeric, nomeado | 5 | d59 1, d57 1, d15 2, d8 1, d26 2 |
| `qrels$q03` | numeric, nomeado | 2 | d60 1, d32 1 |
| `qrels$q04` | numeric, nomeado | 6 | d57 1, d8 2, d22 1, d28 1, d24 2, d40 2 |
| `qrels$q05` | numeric, nomeado | 7 | d6 2, d36 2, d22 0, d58 1, d50 2, d45 2, ... |
| `R_q` | integer, nomeado | 5 | q01 1, q02 5, q03 2, q04 6, q05 6 |
| `REPO` | character | 1 | https://raw.githubuserconte... |
| `tab_bm` | matrix | 5 × 5 | linhas: P_at_k, AP, RR, ... \| colunas: q01, q02, q03, q04, ... |
| `tab_cos` | matrix | 5 × 5 | linhas: P_at_k, AP, RR, ... \| colunas: q01, q02, q03, q04, ... |
| `txt` | character | 1 | monumentos historicos centro |
| `usar` | character | 5 | q01, q02, q03, q04, q05 |

### Funções definidas

`anexar_estado`, `ap`, `bm25`, `bm25_doc`, `busca_AND`, `busca_booleana`, `cfg_aula`, `cosseno`, `dcg`, `docs_aula`, `estado`, `gabarito_aula`, `idf_bm25`, `idf_classico`, `indice_invertido`, `kappa_cohen`, `kappa_matriz`, `ler_qrels`, `limpar`, `matriz_tf`, `metricas`, `montar`, `ndcg`, `norm_cols`, `precisao_k`, `preparar`, `ranking_bm25`, `ranking_cosseno`, `rr`, `saturacao`, `sem_stop`, `stopwords_aula`, `tokenizar`, `vetor_consulta`
<!-- estado-R:fim -->

