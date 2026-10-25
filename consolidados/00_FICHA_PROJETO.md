# Ficha do Projeto: Motor de Busca do Centro Antigo de São Vicente
*criada na Aula 01 (Parte D) em 2026-09-23 · última atualização: Aula 5,5 Parte D, 2026-10-25, motor05b*

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
- Quantidade de documentos: 64 documentos (parágrafos), congelados na Aula 05.
- Onde está e em que forma:
  - Corpus oficial: `estrutura/banco-de-dados/corpus.csv`, congelado na Aula 05, com ids `d1` a `d64` preservados.
  - Colunas: `id`, `titulo`, `texto`, `fonte`, `url`.
  - Codificação: UTF-8.
  - Arquivos históricos da coleta: `docs.rds` e `origem.rds`.
  - Gabaritos: `estrutura/banco-de-dados/qrels_Andre_2026-10-25.csv` — 1 arquivo, juiz Andre.
  - Consultas julgadas: q01, q02, q03, q04 e q05 — 21 documentos julgados no total.
- Alterações no congelamento: nenhuma página acrescentada e nenhuma linha excluída.
- Validação na Aula 05: sem erros bloqueantes; todas as cinco colunas com 100% de preenchimento.
- Distribuição por origem:
  - Martim Afonso de Sousa: 29
  - São Vicente (São Paulo): 23
  - Ponte Pênsil de São Vicente: 12
- Tamanhos dos documentos no corpus bruto:
  - Mínimo: 34 tokens
  - Máximo: 277 tokens
  - Média: 86 tokens
- Ficha técnica do CSV na Aula 05: mínimo de 34 palavras, mediana de 72,5, média de 86,3 e máximo de 277.
- Vocabulário: 2.136 termos brutos · 1.831 depois da limpeza e remoção das stopwords (Aula 03).
- Aspectos observados no vocabulário bruto: Presença de pontuação grudada nos termos, caracteres especiais, números e acentuação, além de alta dominância de palavras funcionais.
- Idioma, acentos, caixa e pontuação: Português; transliteração dos acentos antes da limpeza; conversão para minúsculas; caracteres fora de a-z, dígitos e espaço substituídos por espaços; espaços repetidos reduzidos e espaços das pontas removidos.
- Comparação no documento d1: 76 tokens antes e 78 depois da limpeza. Os números `148,151` e `226,86` foram separados em dois tokens cada.
- Conversão de acentos: Nenhum documento apresentou falha na conversão com iconv; resultado da verificação: 0.
- Três consultas de trabalho:
  1. "monumentos historicos centro"
  2. "fundacao vila martim afonso"
  3. "ponte pensil arquitetura"
- Índice invertido: 1.831 termos indexados, igual ao vocabulário limpo; confirmado na sessão com motor05.
- Tamanho médio dos documentos após a preparação: 62,75 tokens, conforme `ix$avgdl` na Aula 05.
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
- Aula 03 (Limpeza + stopwords do grupo): ok; publicação do notebook em `estrutura/codigo/aula03.ipynb` não reconfirmada nesta sessão.
- Aula 03 (Índice invertido + busca AND): ok; publicação do notebook em `estrutura/codigo/aula03.ipynb` não reconfirmada nesta sessão.
- Decisões para o R: campos `minimo`, `grupo`, `limpar`, `acentos`, `stopwords`, `k1`, `b` e `limiar` conferidos no cfg atual.
- Aula 04: atividades de comparação entre cosseno e BM25 confirmadas pelo relatório e notebook enviados; parâmetros `k1 = 1.2` e `b = 0.75` registrados no `config.R`.
- Aula 05 — `corpus.csv`, necessidades, guia de julgamento, qrels: corpus, necessidades e guia ok; qrels parcial: 21 itens, juiz Andre.
- Distribuição das notas da exportação mais recente: grau 0 = 1; grau 1 = 10; grau 2 = 10.
- Concordância entre juízes: \(\kappa\) não calculado; apenas um juiz participou.
- Consistência individual: \(\kappa\) pendente da segunda passada.
- Consolidado da Aula 05: `aula05_parteD_consolidado.md` criado e com estado do R anexado no Colab; publicação no GitHub pendente de confirmação.
- Notebook da Aula 05: salvar/publicar como `estrutura/codigo/aula05.ipynb`.
- Aula 5,5 — métricas (P@k, MAP, MRR, nDCG) dos dois modelos: ok — `estrutura/codigo/aula05b.ipynb`; avaliação parcial: 5 consultas, gabarito parcial com 21 itens.
- Fechamento: baixar versões finais e publicar os arquivos no repositório.

## 6. Decisões do Projeto
- Tema: Focado na história e patrimônio de São Vicente pela relevância regional e facilidade de obtenção de dados abertos.
- Fonte: API da Wikipédia em português com texto limpo sem tags HTML.
- Critério de documento: `cfg$minimo = 200` caracteres por parágrafo para eliminar ruídos, listas curtas e referências vazias.
- Aula 02: Consultas de trabalho definidas (q1 "monumentos historicos centro", q2 "fundacao vila martim afonso", q3 "ponte pensil arquitetura") — sem campo novo no config.R.
- Aula 03: Nome do grupo confirmado como Predicarga, substituindo Pessoa na ficha; `cfg$grupo = "Predicarga"`.
- Aula 03: Acentos — transliteração, para evitar palavras partidas e confusão nos termos; `cfg$limpar = TRUE`, `cfg$acentos = "translit"`. A mesma preparação vale para documentos e consultas.
- Aula 03: Stopwords do projeto — de, e, a, o, em, da, do, que, foi, no, para, com. Mantida a palavra "sao" porque faz parte do nome São Vicente; `cfg$stopwords = c("de", "e", "a", "o", "em", "da", "do", "que", "foi", "no", "para", "com")`.
- Aula 04: parâmetros do BM25 registrados no `config.R`: `cfg$k1 = 1.2` e `cfg$b = 0.75`.
- Aula 05: corpus congelado com 64 documentos, mantendo o acervo existente e sem crescimento ou exclusões; validação sem erros bloqueantes — `corpus.csv`.
- Aula 05: cinco necessidades cadastradas — `necessidades.csv`, coluna `conjunto`:
  - q01: `monumentos historicos centro` — dev.
  - q02: `fundacao vila martim afonso` — dev.
  - q03: `ponte pensil arquitetura` — dev.
  - q04: `ataques piratas baixada santista` — teste.
  - q05: `primeiros habitantes colonizacao sao vicente` — teste.
- Aula 05: q04 e q05 reservadas para teste; não utilizar seus rankings para ajustar o motor antes da avaliação final.
- Aula 05: guia de julgamento aprovado e salvo — `guia_julgamento.md`:
  - Grau 0: não ajuda a responder à necessidade.
  - Grau 1: fala do tema, mas responde parcialmente ou apenas menciona.
  - Grau 2: responde diretamente à necessidade, dentro do escopo.
- Aula 05: plano de julgamento individual — Andre julga as cinco necessidades sobre os 64 documentos; 320 pares previstos, 21 concluídos e 299 restantes; qrels de Andre; semente prevista: 42.
- Aula 05: ausência de segundo juiz registrada como limitação; não há \(\kappa\) entre juízes disponível.
- Aula 5,5: limiar de relevância grau \(\geq 1\), porque a régua mais ampla mantém documentos que tratam do assunto e torna a avaliação mais completa · `cfg$limiar = 1`.
- Aula 5,5: consultas fora da avaliação: nenhuma · no `aula05b.ipynb`, `usar` contém q01–q05.
- Aula 5,5: resultado — BM25 à frente na média em AP (0,077 contra 0,072), RR (0,099 contra 0,075) e nDCG; em AP, 1 vitória para cada sistema e 3 empates; ressalva: gabarito parcial, um juiz e poucas consultas não permitem afirmar superioridade · resultado, sem campo.

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
- Aula 04 — registro recuperado na sessão de 2026-10-25:
  - Evidências: relatório `relatorio_aula4.md` e notebook enviados por Andre.
  - Feito: comparação entre cosseno e BM25 nas três consultas de trabalho, com análise de frequência, tamanho dos documentos e saturação.
  - Parâmetros usados na função BM25: \(\k_1 = 1{,}2\) e \(b = 0{,}75\).
  - Pendente: regularizar os parâmetros em config.R e confirmar os arquivos publicados no repositório.
  - Participação e digitação da Aula 04: não reconfirmadas nesta sessão.
- Aula 05 (Parte D), 2026-10-25:
  - Presente: Andre Cesar Franco.
  - Quem digitou: Andre Cesar Franco, módulos 9 a 13.
  - Formato: sessão do projeto realizada individualmente, sem outros integrantes.
  - Feito: carregamento do motor05; correção da ausência inicial de docs; normalização e validação do corpus; congelamento de 64 documentos; gravação e releitura do corpus.csv; reconstrução do índice com 1.831 termos.
  - Necessidades: cinco cadastradas, com q01–q03 como dev e q04–q05 como teste.
  - Guia: critérios e cinco casos de fronteira aprovados; arquivo salvo no computador, conforme confirmação de Andre.
  - Ferramenta: teste do julgar.html concluído, conforme relato do participante.
  - Julgamento: primeira exportação com 20 itens; revisão posterior e nova exportação com 21 itens; CSV mais recente lido no Colab com UTF-8-BOM.
  - Resultado parcial: 1 nota de grau 0, 10 de grau 1 e 10 de grau 2.
  - Concordância: \(\kappa\) não calculado por ausência de segundo juiz ou segunda passada.
  - Configuração: minimo 200, limpeza ativa, transliteração, 12 stopwords e grupo Predicarga conferidos; k1 e b registrados no config.R após o fechamento.
  - Produzido: corpus.csv, necessidades.csv, guia_julgamento.md, qrels parcial de Andre e aula05_parteD_consolidado.md.
  - Pendente: terminar os 299 pares restantes, com prazo a definir; fazer segunda passada em data a definir; rodar kappa.R quando houver dois julgamentos comparáveis; concluir a publicação dos demais arquivos.
- Aula 5,5 (Parte D), 2026-10-25:
  - Presentes: [confirmar nomes].
  - Quem digitou: [nome por módulo].
  - Feito: leitura do gabarito `qrels_Andre_2026-10-25.csv`; regularização de `k1` e `b` no `config.R`; decisão do limiar de relevância igual a 1; escrita e teste das funções de métricas contra a teoria; avaliação de BM25 e cosseno nas consultas q01–q05; análise da consulta q01 e do documento relevante d43; declaração do resultado comparativo.
  - Produzido: `config.R` com `limiar = 1`; `aula05b.ipynb`; ficha e consolidado atualizados.
  - Pendente: concluir os 299 julgamentos restantes; realizar a segunda passada; calcular \(\kappa\) quando houver julgamentos comparáveis; concluir a publicação dos arquivos no GitHub.

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

