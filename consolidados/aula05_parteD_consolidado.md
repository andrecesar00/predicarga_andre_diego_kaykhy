# Consolidado — PI III — Aula 05 — Parte D — 2026-10-25
*guia versão 4 · tutora: Perplexity · sessão do projeto realizada individualmente · motor05*

Grupo: Predicarga
Presente: Andre Cesar Franco
Digitou: Andre Cesar Franco, nos módulos 9 a 13
Tema: Motor de Busca do Centro Antigo de São Vicente

## 1. O que foi feito

- M9 — Corpus congelado em corpus.csv com 64 documentos, sem acréscimos ou exclusões. Os ids d1 a d64 foram preservados. A validação não apresentou erros bloqueantes, e as colunas id, titulo, texto, fonte e url estavam totalmente preenchidas. O arquivo foi gravado em UTF-8, relido e utilizado para reconstruir o índice.
- M10 — Cadastradas cinco necessidades, com consulta, descrição, escopo e conjunto:
  - q01 — monumentos historicos centro — dev.
  - q02 — fundacao vila martim afonso — dev.
  - q03 — ponte pensil arquitetura — dev.
  - q04 — ataques piratas baixada santista — teste.
  - q05 — primeiros habitantes colonizacao sao vicente — teste.
- A proposta inicial sobre bandeirantes foi substituída após a busca literal não retornar ocorrências. Foram realizadas buscas no texto do corpus para explorar a cobertura dos temas, sem consultar rankings das necessidades de teste.
- M11 — Guia de julgamento aprovado, com graus 0, 1 e 2 e regras para cinco casos de fronteira: conteúdo superficial, idioma diferente, resposta parcial, informação já conhecida e duplicidade. Andre confirmou que o guia_julgamento.md foi salvo. O checkpoint de aplicação independente por diferentes integrantes não foi realizado.
- M12 — Andre informou ter concluído o teste do julgar.html. A sessão real foi iniciada com os arquivos do grupo. O plano foi adaptado para julgamento individual, sem segundo juiz nesta sessão.
- M13 — Exportação mais recente com 21 julgamentos de Andre: 1 de grau 0, 10 de grau 1 e 10 de grau 2. O CSV foi enviado ao Colab e lido com UTF-8-BOM, com as seis colunas esperadas.
- Houve revisão de julgamentos após alerta sobre registros muito rápidos. A exportação mais recente ainda contém dois itens com menos de 5 segundos. O tempo é um alerta de revisão, não uma comprovação de erro.
- O kappa de Cohen, \(\kappa\), não foi calculado: não há julgamentos de outro juiz nem segunda passada disponível. A revisão realizada no mesmo dia não constitui segunda passada independente.

## 2. Como o grupo trabalhou — opinião da tutora

Acompanhei a sessão com participação apenas de Andre, que executou os comandos, apresentou as saídas e corrigiu o carregamento inicial do corpus após o erro de objeto ausente. A decisão de manter os 64 documentos foi explícita, e o arquivo foi validado e relido antes da continuidade. Os temas das novas necessidades foram propostos pelo participante, mas eu redigi necessidades e escopos e conduzi a proposta de separação desenvolvimento/teste; isso deve ser reconhecido como limitação em relação ao guia, que prevê autoria das necessidades pelo grupo. Os critérios de julgamento foram aceitos, porém não houve discussão entre diferentes integrantes nem demonstração de concordância na aplicação a um caso de fronteira. Andre revisou parte das notas após o alerta sobre tempos curtos. Não houve execução do pareamento com match nem cálculo de concordância nesta sessão.

## 3. Observações para a frente

### Continuidade do julgamento

- Responsável atual: Andre Cesar Franco.
- Progresso: 21 de 320 pares consulta–documento julgados.
- Restantes: 299 pares, caso Andre realize a primeira passada completa.
- Prazo de conclusão: a definir.
- Continuar na mesma sessão do julgar.html, usando Retomar de onde parei quando necessário.
- Exportar o CSV ao fim de cada rodada.
- Para a mesma sessão, manter a exportação mais recente como versão de trabalho; não concatenar exportações anteriores.
- Fazer a segunda passada pelo recurso da ferramenta, em 20% dos itens, com pelo menos um dia de intervalo após concluir a primeira passada.
- Data da segunda passada: a definir.
- A segunda passada permitirá medir consistência individual, não concordância entre pessoas.
- A ausência de segundo juiz deve permanecer registrada como limitação.

### Necessidades e teste

- Preservar q04 e q05 como teste: não consultar seus rankings nem utilizá-las para ajustar o motor antes da avaliação final.
- Não foi demonstrado no checkpoint quais duas necessidades apresentam diferença de vocabulário entre consulta e resposta. Essa verificação permanece pendente.
- Ao ampliar o projeto para 15–25 necessidades, definir dev ou teste antes de julgar cada nova necessidade.
- O corpus permanece congelado; qualquer ampliação exige um novo ciclo documentado.

### Configuração e Aula 04

- Motor atual: motor05 v1.
- Configuração conferida: minimo = 200; limpar = TRUE; acentos = translit; grupo = Predicarga; 12 stopwords.
- Índice reconstruído com 64 documentos e 1.831 termos.
- A ficha recebida estava atualizada somente até a Aula 03.
- O relatório e o notebook enviados confirmam a realização de atividades da Aula 04, incluindo comparação entre cosseno e BM25 nas três consultas de trabalho.
- No notebook da Aula 04, a função BM25 utilizava \(k_1 = 1{,}2\) e \(b = 0{,}75\) como valores padrão.
- Esses parâmetros não estão registrados no cfg atual: cfg$k1 e cfg$b retornaram NULL.
- O config.R não foi alterado nesta sessão.
- Pendência: regularizar a configuração da Aula 04 e a documentação antes da próxima comparação de rankings.

### Arquivos e documentação

- Produzido no Colab: corpus.csv, necessidades.csv e tabela de leitura dos julgamentos.
- Guia de julgamento: salvo no computador, conforme confirmação de Andre.
- Qrels: exportação mais recente com 21 julgamentos, enviada ao Colab.
- Pool: não utilizada.
- Notebook: salvar como aula05.ipynb.
- Ficha atualizada: ainda não entregue nesta etapa; pendente atualizar cabeçalho e seções 4, 5, 6 e 7.
- Acrescentar o estado do R à ficha e a este consolidado usando anexar_estado().
- Publicar os arquivos nas pastas correspondentes do repositório.

### Perguntas guardadas

- Como medir o desempenho do motor com os julgamentos? — Aula 5,5.
- Kappa entre juízes — pendente de participação de outro juiz.
- Kappa individual — pendente da segunda passada.

---

<!-- estado-R:inicio -->
## Estado do R ao fim da sessão
*gerado por `anexar_estado()` em 2026-10-25 17:17 · R version 4.6.1 (2026-06-24) · motor05 v1 2026-10-01 · não edite à mão*

### Objetos

| objeto | tipo | tamanho | valor / amostra |
|---|---|---|---|
| `bruto` | data.frame | 64 × 5 | colunas: id, titulo, texto, fonte, url |
| `cc` | environment | 9 |  |
| `cfg$minimo` | numeric | 1 | 200 |
| `cfg$limpar` | logical | 1 | TRUE |
| `cfg$acentos` | character | 1 | translit |
| `cfg$stopwords` | character | 12 | de, e, a, o, em, da, ... |
| `cfg$grupo` | character | 1 | Predicarga |
| `cp` | data.frame | 64 × 5 | colunas: id, titulo, texto, fonte, url |
| `docs` | character, nomeado | 64 | d1 São Vicente, oficialmente E..., d2 São Vicente marca o início ..., d3 Com um PIB de mais de 6 bil..., d4 São Vicente preserva divers..., d5 A Ilha de Gohayó foi descob..., d6 Nas primeiras décadas do sé..., ... |
| `FERR` | character | 1 | https://raw.githubuserconte... |
| `fonte` | character | 1 | Wikipedia pt |
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
| `MOTOR_VERSAO` | character | 1 | motor05 v1 2026-10-01 |
| `nec` | data.frame | 5 × 5 | colunas: consulta, texto_consulta, necessidade, escopo, conjunto |
| `origem` | character, nomeado | 64 | d1 São Vicente (São Paulo), d2 São Vicente (São Paulo), d3 São Vicente (São Paulo), d4 São Vicente (São Paulo), d5 São Vicente (São Paulo), d6 São Vicente (São Paulo), ... |
| `q1` | data.frame | 21 × 6 | colunas: consulta, documento, grau, juiz, timestamp, segundos |
| `REPO` | character | 1 | https://raw.githubuserconte... |

### Funções definidas

`anexar_estado`, `bm25`, `bm25_doc`, `busca_AND`, `busca_booleana`, `cfg_aula`, `cosseno`, `docs_aula`, `estado`, `idf_bm25`, `idf_classico`, `indice_invertido`, `limpar`, `matriz_tf`, `montar`, `norm_cols`, `preparar`, `ranking_bm25`, `ranking_cosseno`, `saturacao`, `sem_stop`, `stopwords_aula`, `tokenizar`, `vetor_consulta`
<!-- estado-R:fim -->

