# Consolidado — PI III — Aula 02 — 2026-10-24
*guia versão 3 · tutora: Gemini · sessão individual (teoria) · motor02*
**Aluno:** André Cesar Franco

## 1. O que foi passado
- M1 — por que somar pesos não ordena
- M2 — termo = dimensão, documento = vetor
- M3 — a matriz TF-IDF $45 \times 8$ dentro de `ix`; a correspondência com a Aula 01
- M4 — cosseno: conta à mão em 2D; ignora o tamanho; a função `cosseno` e o vetor nulo
- M5 — normalização por coluna; vetores unitários
- M6 — a consulta como vetor, com o idf do corpus
- M7 — ranking $d_1 > d_3 > d_4 > d_2$; a conta de $d_4$ à mão
- M8 — termos independentes; sinônimos têm cosseno zero

## 2. Como foi o aprendizado — opinião da tutora
O aluno demonstrou excelente intuição geométrica inicial na Álgebra Linear (calculando produtos escalares e normas sem hesitar) e compreendeu de imediato a falha da soma linear de pesos em documentos repetidos e o conceito de ortogonalidade de sinónimos. Ao longo da passagem para o ambiente prático no R e manipulação de listas (`ix`), demonstrou um ritmo mais direto e objetivo, beneficiando de intervenções curtas e respostas guiadas nas passagens de código e normalização. No teste final, mostrou assimilação dos conceitos geométricos fundamentais, necessitando de reforço na correspondência entre os componentes internos de `ix` e na mecânica de vetorização de consultas fora do vocabulário.

**Teste final:** acertou M1, M2 (parcial), M4 (parcial) e M8; a revisar M3, M5, M6 e M7 — rever os campos de `ix`, a vantagem computacional da normalização prévia e o comportamento de termos desconhecidos no vetor da consulta.

## 3. Observações para a frente
- **Revisar antes da Aula 03:** Revisar a correspondência dos campos de `ix` (`ix$w`, `ix$idf_tfidf`, `ix$tf`) e a lógica do vetor unitário.
- **Para a próxima tutora:** Aluno prefere condução concisa e direta ao ponto; responde bem a cálculos objetivos e precisa de confirmação prática rápida ao interagir com o Colab.
- **Perguntas guardadas:** O tratamento de stopwords como "de" e a flexão de termos como "vetor" e "vetores" — para a Aula 03.
- **Produzido:** funções `cosseno`, `norm_cols`, `vetor_consulta`, `ranking_cosseno`; ranking para `modelo de recuperacao`: $d_1\ 0{,}254 > d_3\ 0{,}233 > d_4\ 0{,}215 > d_2\ 0{,}208$; ranking sem stopword: $d_1\ 0{,}234 > d_4\ 0{,}221 > d_3\ 0{,}195 > d_2\ 0{,}192$.
- **Parte D (sessão de grupo):** a marcar — com a ficha do projeto.