# Ficha do Projeto: Motor de Busca do Centro Antigo de São Vicente
*criada na Aula 01 (Parte D) em 2026-10-24 · última atualização: Aula 02 Parte D, 2026-10-25, motor02*

## 1. Identidade
- Grupo: Pessoa
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
- Tamanhos dos documentos:
  - Mínimo: 34 tokens
  - Máximo: 277 tokens
  - Média: 86 tokens
- Vocabulário bruto: 2.136 termos distintos.
- Aspectos observados no vocabulário: Presença de pontuação grudada nos termos (ex: vírgulas), caracteres especiais, números e acentuação, além de alta dominância de palavras funcionais (artigos, preposições e conjunções).
- Três consultas de trabalho:
  1. "monumentos historicos centro"
  2. "fundacao vila martim afonso"
  3. "ponte pensil arquitetura"
- Peculiaridades e limitações observadas: O modelo vetorial de cosseno não reconhece variações morfológicas (ex: plural/singular como "praias" vs "praia") nem sinônimos automaticamente, tratando dimensões de forma isolada.

## 5. Matriz de Entregas da Disciplina
- Aula 01 (Corpus, config.R, Tokenização + TDM): ok
- Aula 02 (TF-IDF e Similaridade Cosseno): ok (`estrutura/codigo/aula02.ipynb`)
- Aula 03 (Limpeza, Normalização e Stopwords): —
- Aula 04 (Stemming e Eficiência): —
- Aula 05 (Expansão do Corpus): —

## 6. Decisões do Projeto
- Tema: Focado na história e patrimônio de São Vicente pela relevância regional e facilidade de obtenção de dados abertos.
- Fonte: API da Wikipédia em português com texto limpo sem tags HTML.
- Critério de documento: `cfg$minimo = 200` caracteres por parágrafo para eliminar ruídos, listas curtas e referências vazias.
- Aula 02: Consultas de trabalho definidas (q1 "monumentos historicos centro", q2 "fundacao vila martim afonso", q3 "ponte pensil arquitetura") — sem campo novo no `config.R`.

## 7. Linha do Tempo e Histórico
- Aula 01 (Parte D): Criação do corpus de 64 parágrafos, indexação vetorial com vocabulário de 2.136 termos, validação da busca booleana e estruturação inicial dos diretórios do repositório.
- Aula 02 (Parte D): Implementação do motor02, cálculo de normas vetoriais, definição das três consultas de trabalho, análise de relevância via produto escalar (cosseno) e mapeamento das limitações de variação morfológica.