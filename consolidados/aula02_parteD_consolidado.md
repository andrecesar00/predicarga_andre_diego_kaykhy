# Consolidado — PI III — Aula 02 — Parte D — 2026-10-25
*guia versão 3 · tutora: Gemini · sessão de grupo · motor02*
**Grupo:** Pessoa · **presentes:** Andre Cesar, Diego de Farias, Kaykhy Donizete · **digitou:** Rodízio entre os integrantes

## 1. O que foi feito
- M9 — Os vetores sobre o corpus do grupo; análise da norma máxima no documento d36 e o efeito da normalização das colunas (normas igual a 1).
- M10 — Definição e execução das três consultas de trabalho do projeto, com análise detalhada do ranking e decomposição das parcelas do produto escalar no 1º lugar.
- M11 — Demonstração prática dos limites do cosseno ao testar variações morfológicas (plural/singular), evidenciando que o modelo trata termos como dimensões isoladas.

## 2. Como o grupo trabalhou — opinião da tutora
O grupo trabalhou de forma colaborativa, seguindo rigorosamente a divisão de papéis no Google Colab, realizando as previsões teóricas antes de cada execução e compreendendo a mecânica vetorial por trás do TF-IDF e do cosseno. As funções de suporte foram implementadas e testadas com sucesso sobre os dados reais do corpus de São Vicente.

## 3. Observações para a frente
- **Para a próxima sessão prática:** Garantir que o ambiente esteja preparado para a Aula 03 (Limpeza e Stopwords).
- **Perguntas guardadas:** Como lidar automaticamente com lematização e sinônimos — Aula 03 e Aula 07.
- **Produzido:** Ver a entrada "Aula 02" na linha do tempo da ficha do projeto e o notebook `aula02.ipynb`.
- **Ficha atualizada:** sim — seções alteradas: 4, 5, 6, 7, cabeçalho.

---

<!-- estado-R:inicio -->
## Estado do R ao fim da sessão
*gerado por `anexar_estado()` em 2026-10-25 03:08 · R version 4.6.1 (2026-06-24) · motor02 v1 2026-10-01 · não edite à mão*

### Objetos

| objeto | tipo | tamanho | valor / amostra |
|---|---|---|---|
| `cfg$minimo` | numeric | 1 | 200 |
| `cfg$grupo` | character | 1 | <nome do grupo> |
| `consulta` | character | 1 | praias |
| `docs` | character, nomeado | 64 | d1 São Vicente, oficialmente E..., d2 São Vicente marca o início ..., d3 Com um PIB de mais de 6 bil..., d4 São Vicente preserva divers..., d5 A Ilha de Gohayó foi descob..., d6 Nas primeiras décadas do sé..., ... |
| `ix$tokens` | list | 64 | elementos: d1, d2, d3, d4, d5, d6, d7, d8, ... |
| `ix$vocab` | character | 2136 | -, –, —, "berço, "bica, "biquinha"., ... |
| `ix$tf` | matrix | 2136 × 64 | linhas: -, –, —, ... \| colunas: d1, d2, d3, d4, ... |
| `ix$N` | integer | 1 | 64 |
| `ix$df` | numeric, nomeado | 2136 | - 2, – 2, — 2, "berço 1, "bica 1, "biquinha". 1, ... |
| `ix$idf_tfidf` | numeric, nomeado | 2136 | - 3.466, – 3.466, — 3.466, "berço 4.159, "bica 4.159, "biquinha". 4.159, ... |
| `ix$w` | matrix | 2136 × 64 | linhas: -, –, —, ... \| colunas: d1, d2, d3, d4, ... |
| `maior` | character | 1 | d36 |
| `melhor` | character | 1 | d57 |
| `MOTOR_VERSAO` | character | 1 | motor02 v1 2026-10-01 |
| `normas` | numeric, nomeado | 64 | d1 24.48, d2 36.95, d3 36.97, d4 46.09, d5 15.53, d6 29.28, ... |
| `origem` | character, nomeado | 64 | d1 São Vicente (São Paulo), d2 São Vicente (São Paulo), d3 São Vicente (São Paulo), d4 São Vicente (São Paulo), d5 São Vicente (São Paulo), d6 São Vicente (São Paulo), ... |
| `r` | numeric, nomeado | 64 | d57 0.2443, d53 0.2078, d64 0.2001, d62 0.1702, d59 0.1651, d55 0.1364, ... |
| `REPO` | character | 1 | https://raw.githubuserconte... |
| `wn` | matrix | 2136 × 64 | linhas: -, –, —, ... \| colunas: d1, d2, d3, d4, ... |

### Funções definidas

`anexar_estado`, `busca_booleana`, `cfg_aula`, `cosseno`, `docs_aula`, `estado`, `idf_classico`, `matriz_tf`, `montar`, `norm_cols`, `ranking_cosseno`, `tokenizar`, `vetor_consulta`
<!-- estado-R:fim -->

