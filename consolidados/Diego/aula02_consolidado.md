# Consolidado — PI III — Aula 02 — 2026-10-25
*guia versão 3 · tutora: Gemini · sessão individual (teoria) · motor02*
**Aluno:** Diego de Farias Carazo Prieto

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
O aluno demonstrou excelente intuição geométrica inicial ao compreender rapidamente por que dobrar o tamanho de um documento mantém o mesmo ângulo e cosseno no plano cartesiano, e realizou os cálculos manuais do produto escalar e das normas em duas dimensões com precisão. Houve dificuldades na correspondência estrutural do R (identificação de campos dentro de `ix` e necessidade de compilar as funções na memória do Colab) e na fixação das dimensões do vocabulário versus termos da consulta. No teste final, confundiu a semântica de similaridade com posições de índice e porcentagens probabilísticas. Os conceitos de normalização prévia e ortogonalidade lexical foram apresentados e necessitam de consolidação prática.

**Teste final:** acertou M1 e M4 (parcial); a revisar M2, M3, M5, M6, M7 e M8 — M2 (dimensões = vocabulário total); M3 (campos de `ix` para tf e idf); M5 (normalização transforma cosseno em produto escalar); M6 (termos fora do vocabulário zeram no vetor da consulta); M7 (termo repetido aumenta tf e lidera ranking); M8 (termos distintos têm produto escalar zero independente da ordem).

## 3. Observações para a frente
- **Revisar antes da Aula 03:** conceito de dimensão no vocabulário, papel das stopwords no ranking e a utilidade da normalização por colunas.
- **Para a próxima tutora:** focar no passo a passo prático de execução do R no Colab antes dos checkpoints e reforçar a interpretação de coordenadas esparsas.
- **Perguntas guardadas:** sinônimos e ortogonalidade — Aula 07 (*embeddings*); tratamento de stopwords (`"de"`) — Aula 03.
- **Produzido:** funções `cosseno`, `norm_cols`, `vetor_consulta`, `ranking_cosseno`; ranking para `modelo de recuperacao`: $d_1\ 0{,}254 > d_3\ 0{,}233 > d_4\ 0{,}215 > d_2\ 0{,}208$; ranking sem stopword `modelo recuperacao`: $d_1\ 0{,}234 > d_4\ 0{,}221 > d_3\ 0{,}195 > d_2\ 0{,}192$.
- **Parte D (sessão de grupo):** a marcar — com a ficha do projeto
