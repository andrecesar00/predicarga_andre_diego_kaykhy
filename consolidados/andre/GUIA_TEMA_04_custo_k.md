# Tema 4 — Quanto reordenar: custo × qualidade

*versão 1 — 2026-11-05 — guia de referência do professor para o tema 4 da atividade da Aula 08 — gerado a partir de COMO_CRIAR_GUIA_DE_ESTUDO.md v6 — Projeto Integrador III — Motor de Busca*

---

## Para vocês: como usar

**O tema:** o estágio 2 relê os $k$ primeiros do estágio 1. Quanto mais $k$, mais tempo; a qualidade sobe só até certo ponto. Qual $k$ compensa? Vocês vão medir o MAP (*mean average precision*) e o tempo (`system.time`) para $k$ de 1 a $N$.

**Vão aprender:** a curva de qualidade por $k$ (nos 8 documentos, $k = 2$ não muda e $k = 3$ corrige); medir o custo; por que o estágio 1 põe o teto; a tabela $k$ × MAP × tempo do grupo.

**Antes:** Aula 04 (BM25), Aula 07 (o `cfg$modelo` do grupo) e Aula 08 (dois estágios, `proximidade`, `reordenar`, a Parte D).

**Como começar:** colem **este arquivo inteiro** numa LLM e escrevam *"Seja nosso tutor neste tema"*. Abram o Colab e mudem o ambiente para **R** antes de enviar qualquer arquivo. Rodem a primeira célula (Parte A); cada trecho seguinte numa célula nova, **prevendo a saída antes**. Se a tutora despejar texto, mandar código sem comentário, escrever fórmula em texto puro ou fizer por vocês: **"mais curto"**, **"comente"**, **"em LaTeX"**, **"isso é comigo"**.

**Tempo:** uns 40 minutos. **No fim:** a tabela $k$ × MAP × tempo do grupo, a escolha de $k$ e um consolidado.

---
---

# PARTE A — Instruções para a LLM

Você é tutor(a) de um grupo de Ciência de Dados preparando o **tema 4** da atividade da Aula 08 (motor de busca em R, no Colab). Ensine a Parte B na ordem, com os números dados.

- **Tamanho:** até 360 palavras por mensagem (540 para **uma** ideia que não cabe). Uma ideia, uma estrutura, um fecho.
- **Sequência obrigatória**, 4 módulos, todos e só eles: (1) A qualidade em cada $k$; (2) O custo: medir com `system.time`; (3) O estágio 1 põe o teto; (4) No corpus do grupo. Diga a rota no início; marque *"Módulo N de 4 — …"*. Tempo acabou: pare e registre onde.
- **Código:** um trecho por vez, comentado como está aqui; **previsão antes** de rodar.
- **Matemática sempre em LaTeX** (`$\text{MAP}$`, `$k = 3$`, `$T(k)$`), inclusive símbolos soltos; exceção só para código R.
- **Os números de MAP, AP e nDCG são fixos** — os do guia; o R vence. **Os tempos não:** os do guia são de uma máquina; os do Colab sairão outros. Nunca diga que um tempo "está errado" por não bater; compare a **forma** (cresce com $k$?).
- **Você não:** adianta a Aula 09 em diante (guarde); escolhe $k$ pelo grupo; julga relevância; inventa números; troca corpus, consulta ou gabarito; reescreve funções do motor.

**O que o grupo já sabe.** Do `motor09.R` (`motor/CONTRATO.md`): `docs_aula()`, `cfg_aula()`, `montar` (`ix$tokens`, `ix$N`), `preparar(texto, cfg)`, `ranking_bm25`, `ranking_cosseno`, `ranking_lsa`, `lsa`, `rrf`, `gabarito_aula()` (`d2` = 2, `d3` = 2, `d1` = 1, `d6` = 1), `relevancia`, `recall_k`, `metricas(ranking, grau, limiar)`, `proximidade(qt, dt, janela = 3)`, `reordenar(rk, k, sc)`. R base: `c`, `names`, `[ ]`, `[[ ]]`, `paste0`, `sapply`, `lapply`, `function`, `for`, `if`, `return`, `round`, `t`, `head`, `mean`, `intersect`, `rownames(x) <-`, `x[condição]`. **Novo:** `system.time` (Módulo 2).

**Primeira célula:**

```r
source("https://raw.githubusercontent.com/fractalarea/pi3-motor-de-busca/main/motor/motor09.R")  # funcoes ate a Aula 08
docs <- docs_aula()          # os 8 documentos
cfg  <- cfg_aula()           # decisoes canonicas (janela 3)
ix   <- montar(docs, cfg)    # o indice
```

---
---

# PARTE B — O conteúdo

## Módulo 1 — A qualidade em cada $k$
*trabalho 6 min · conversa 4 min · lembrete: previsão antes; a ordem à mão antes do R; LaTeX*

**A ideia.** Para cada $k$, reordena-se o top-$k$ do BM25 pela proximidade e mede-se. A medida de um conjunto $Q$ de consultas é

$$\text{MAP} = \frac{1}{|Q|} \sum_{q \in Q} \text{AP}(q)$$

e o custo do estágio 2, em leituras, é $|Q| \cdot k$. Nos 8 documentos há **uma** consulta julgada: $\text{MAP} = \text{AP}$.

**À mão.** BM25: `d3 d1 d2 d4 d8 d6 d5 d7`; proximidade: `d2` 1, `d3` 0,5, o resto 0.

- $k = 2$: cabeça `d3` (0,5), `d1` (0) — já em ordem; AP $= \frac{1}{2}\left(\frac{1}{1} + \frac{2}{3}\right) = 0{,}833$;
- $k = 3$: `d2` entra e sobe → `d2 d3 d1`; AP $= \frac{1}{2}(1 + 1) = 1$.

```r
rb <- ranking_bm25("modelo de recuperacao", ix, cfg)        # estagio 1
qt <- preparar("modelo de recuperacao", cfg)                # modelo, de, recuperacao
px <- sapply(ix$tokens, function(dt) proximidade(qt, dt))   # estagio 2: d2 1, d3 0,5
g  <- gabarito_aula()                                       # os graus
curva <- t(sapply(1:8, function(k) metricas(reordenar(rb, k, px), g, 2)))   # uma linha por k
rownames(curva) <- paste0("k", 1:8)                         # nomeia as linhas
round(curva[, c("AP", "nDCG_grad")], 3)                     # qualidade em cada k
```
```
      AP nDCG_grad
k1 0.833     0.951
k2 0.833     0.951
k3 1.000     0.982
k4 1.000     0.982
k5 1.000     0.982
k6 1.000     0.982
k7 1.000     0.982
k8 1.000     0.982
```

A curva é um **degrau**: nada até $k = 3$, depois plana.

**Exemplos que você mostra:**

- $k = 3$ e $k = 8$: mesmo AP ($1$), mesmo nDCG graduado ($0{,}982$); $k = 8$ lê quase o triplo;
- $k = 1$: reordenar um documento nunca muda nada — a linha `k1` é o estágio 1.

> **Erro previsto:** esperar ganho com $k = 2$. Sinal: *"o `d3` não devia subir?"*. Reação: `d3` já é o 1º; o que falta é o `d2`, em 3º.

> **Checkpoint 1.** *Com limiar 1 (relevantes `d1`, `d2`, `d3`, `d6`): o AP muda em $k = 3$? E o nDCG graduado?*
> Esperado: AP não — `d2`, `d3`, `d1` já ocupam o top-3 e todos são relevantes; trocar entre eles não muda o AP binário ($0{,}917$ em todo $k$). O nDCG graduado vê o grau: $0{,}951 \to 0{,}982$. Confere: troque o `2` por `1` no `metricas`.

> **Ponte:** a qualidade parou em $k = 3$. E o custo?

---

## Módulo 2 — O custo: medir com `system.time`
*trabalho 7 min · conversa 4 min · lembrete: previsão antes; os tempos variam — o que se compara é a forma*

Para medir, o estágio 2 tem de **ler só os $k$ candidatos** (o `px` acima leu os 8):

```r
rerank_prox <- function(rk, qt, tokens, k, janela = 3) {   # estagio 2 honesto
  if (k == 0) return(names(rk))                            # k = 0: nao reordena
  top <- head(names(rk), k)                                # os candidatos
  sc  <- sapply(tokens[top], function(dt) proximidade(qt, dt, janela))   # so eles sao lidos
  reordenar(rk, k, sc)                                     # cabeca + cauda
}
rerank_prox(rb, qt, ix$tokens, 3)                          # igual a reordenar(rb, 3, px)
```
```
[1] "d2" "d3" "d1" "d4" "d8" "d6" "d5" "d7"
```

**Novo:** `system.time(expr)` roda `expr` e devolve os segundos gastos; `elapsed` é o tempo de relógio.

```r
system.time(rerank_prox(rb, qt, ix$tokens, 3))                     # uma vez
system.time(for (i in 1:5000) rerank_prox(rb, qt, ix$tokens, 3))   # 5000 vezes
```

Uma execução (R 4.1.2, uma máquina Linux; **no Colab sai outro número**):

```
   user  system elapsed 
  0.004   0.000   0.003 
   user  system elapsed 
  0.436   0.000   0.437 
```

Uma vez é rápido demais para o relógio; repete-se. Para cada $k$:

```r
tempo <- sapply(0:8, function(k)                                   # para cada k...
  system.time(for (i in 1:5000) rerank_prox(rb, qt, ix$tokens, k))[["elapsed"]])   # ...5000 vezes
names(tempo) <- paste0("k", 0:8)                                   # nomeia
tempo                                                              # segundos por 5000 consultas
```
Mesma máquina (no Colab, outros):
```
   k0    k1    k2    k3    k4    k5    k6    k7    k8 
0.006 0.254 0.345 0.457 0.497 0.559 0.594 0.659 0.706 
```

Rodando de novo na mesma máquina, saiu `k7` $0{,}809$ e `k8` $0{,}715$: **ruído**. O que se repete é a forma:

$$T(k) \approx T_1 + c_0 + k \cdot c$$

$T_1$, o estágio 1; $c_0$, o custo fixo de reordenar (de `k0` para `k1`); $c$, uma leitura do par (aqui, uns $0{,}06$ s por 5000, ou $10^{-5}$ s por leitura).

**Exemplos que você mostra:**

- $k = 3$ contra $k = 8$: $0{,}457$ contra $0{,}706$ — uns 50% a mais de tempo, a mesma qualidade (Módulo 1);
- por consulta, $k = 3$: $\frac{0{,}457}{5000} \approx 0{,}09$ ms. Com 8 documentos é nada; com um *cross-encoder* (rede neural que lê o par, Aula 08), cada leitura custaria milhares de vezes mais, e $c$ dominaria.

> **Erro previsto:** medir o `reordenar` com o `px` já pronto. Sinal: tempo quase igual para todo $k$ — numa execução, `k1` $0{,}079$, `k3` $0{,}083$, `k8` $0{,}088$. Reação: o caro é **ler** o documento; o `px` leu os 8 antes do relógio. Meçam o `rerank_prox`.

> **Checkpoint 2.** *Num corpus, o estágio 1 leva 30 ms e cada leitura do par 2 ms. Quanto leva uma consulta com $k = 10$, $50$ e $200$? Se o limite é 200 ms, qual o maior $k$?*
> Esperado: $30 + 20 = 50$ ms; $30 + 100 = 130$ ms; $30 + 400 = 430$ ms; $k \le \frac{200 - 30}{2} = 85$.

> **Ponte:** o custo cresce sem parar; a qualidade parou em $k = 3$. Por que **ali**?

---

## Módulo 3 — O estágio 1 põe o teto
*trabalho 5 min · conversa 3 min · lembrete: previsão antes; LaTeX*

O estágio 2 só mexe no que o estágio 1 trouxe. O teto é o $\text{R@}k$ (*recall* no top-$k$) do estágio 1: se ainda falta relevante, nenhum reordenador o alcança.

```r
r <- relevancia(rb, g, 2)                                     # relevantes na ordem do BM25
sapply(1:8, function(k) recall_k(r$rel, k, r$R))              # R@k: o teto
rc <- ranking_cosseno("modelo de recuperacao", ix, cfg)       # outro estagio 1 (Aula 02)
names(rc)                                                     # onde ficou o d2?
round(sapply(1:8, function(k) metricas(reordenar(rc, k, px), g, 2)[["AP"]]), 3)   # a curva
```
```
[1] 0.5 0.5 1.0 1.0 1.0 1.0 1.0 1.0
[1] "d1" "d3" "d4" "d2" "d6" "d8" "d5" "d7"
[1] 0.50 0.75 0.75 1.00 1.00 1.00 1.00 1.00
```

No BM25 o $\text{R@}k$ chega a 1 em $k = 3$ — exatamente onde a curva subiu. No cosseno, `d2` está em 4º: o degrau final vem em $k = 4$.

**Exemplos que você mostra:**

- cosseno, $k = 2$: cabeça `d1` (0), `d3` (0,5) → `d3 d1 d4 d2`, AP $0{,}5 \to 0{,}75$ — ganho parcial;
- LSA da Aula 07 (`ranking_lsa(…, lsa(ix, 2))` → `d2 d3 d8 d6 d5 d1 d4 d7`): AP $1$ em **todo** $k$ — estágio 1 bom não deixa nada para o estágio 2; o melhor $k$ é o menor.

> **Erro previsto:** "o reordenador resgata o `d2` com $k = 3$ no cosseno". Sinal: preveem AP $1$ em $k = 3$. Reação: `d2` está em 4º, fora da cabeça; a saída dá $0{,}75$.

> **Checkpoint 3.** *50 documentos; os dois relevantes estão em 2º e 7º no estágio 1; o reordenador é perfeito (sobe todo relevante). AP com $k = 1$, $5$, $7$? Qual o menor $k$ que atinge AP 1?*
> Esperado: $k = 1$: nada muda → $\frac{1}{2}\left(\frac{1}{2} + \frac{2}{7}\right) = 0{,}393$; $k = 5$: o de 2º vai a 1º, o de 7º fica → $\frac{1}{2}\left(1 + \frac{2}{7}\right) = 0{,}643$; $k = 7$: $1$. O menor é $7$, a posição do último relevante.

> **Ponte:** no corpus de vocês, o degrau está onde?

---

## Módulo 4 — No corpus do grupo
*trabalho 7 min · conversa 4 min · lembrete: escolhe-se no dev; o teste roda uma vez; o grupo decide*

**O experimento:** estágio 1 = o `cfg$modelo` do grupo; estágio 2 = `rerank_prox`; a tabela $k$ × MAP × nDCG × tempo, **só no dev**; escolher $k$ pesando o tempo; **teste** uma vez; um caso em que ajudou e um em que atrapalhou, **lendo os textos**. Sem números: o corpus é de vocês.

**Preparação:** rodem as duas primeiras células da Parte D da Aula 08 (no `aula08.ipynb` do grupo), trocando `motor08` por `motor09` — criam `cfg`, `docs`, `ix`, `qrels`, `nec`, `consultas`, `usar` — e colem o `rerank_prox` do Módulo 2.

```r
# sem a decisao da Aula 07 ou da 08 no config.R: os valores padrao do curso
if (is.null(cfg$modelo)) cfg$modelo <- "bm25"   # estagio 1 = BM25 (quem nao fez a Aula 07)
if (is.null(cfg$lsa_k))  cfg$lsa_k  <- 2        # so usado com modelo "lsa" ou "hibrido"
if (is.null(cfg$rrf_c))  cfg$rrf_c  <- 60       # so usado com modelo "hibrido"
if (is.null(cfg$janela)) cfg$janela <- 3        # janela da proximidade (Aula 08)
estagio1 <- function(texto, ix, cfg, m) {                       # o motor do grupo (Parte D)
  rb <- ranking_bm25(texto, ix, cfg)                            # BM25 com k1 e b do grupo
  if (cfg$modelo == "bm25") return(rb)                          # "bm25": pronto
  rl <- ranking_lsa(texto, ix, cfg, m)                          # LSA da Aula 07
  if (cfg$modelo == "lsa") rl else rrf(rb, rl, c = cfg$rrf_c)   # "lsa" ou hibrido
}
m <- if (cfg$modelo == "bm25") NULL else lsa(ix, cfg$lsa_k)     # LSA so se usado
```
```r
dev   <- intersect(usar, nec$consulta[nec$conjunto == "dev"])          # aqui se escolhe
teste <- intersect(usar, nec$consulta[nec$conjunto == "teste"])        # so no fim
rks <- lapply(consultas[usar], function(tx) estagio1(tx, ix, cfg, m))  # estagio 1, uma vez
qts <- lapply(consultas[usar], function(tx) preparar(tx, cfg))         # tokens do grupo
seg1 <- system.time(for (q in dev) estagio1(consultas[[q]], ix, cfg, m))[["elapsed"]]
1000 * seg1 / length(dev)                                              # T1: ms por consulta
```
```r
med <- function(q, k, rks, qts, qrels, tokens, w, limiar)      # AP e nDCG de UMA consulta
  metricas(rerank_prox(rks[[q]], qts[[q]], tokens, k, w), qrels[[q]], limiar)[c("AP", "nDCG_grad")]
w  <- 3                                                        # a janela do grupo (Parte D)
ks <- c(0, 1, 2, 3, 5, 10, 20, 50, 100)                        # de 0 ate N
ks <- ks[ks <= ix$N]                                           # k nao passa de N
```
```r
tab <- t(sapply(ks, function(k) {                              # uma linha por k
  seg <- system.time(for (i in 1:20) for (q in dev)            # 20 voltas no dev...
    rerank_prox(rks[[q]], qts[[q]], ix$tokens, k, w))[["elapsed"]]   # ...so o estagio 2
  mt <- rowMeans(sapply(dev, function(q) med(q, k, rks, qts, qrels, ix$tokens, w, cfg$limiar)))
  c(k = k, MAP = mt[["AP"]], nDCG = mt[["nDCG_grad"]], ms = 1000 * seg / (20 * length(dev)))   # ms por consulta
}))
round(tab, 3)
```
```r
ap0 <- sapply(dev, function(q) med(q, 0, rks, qts, qrels, ix$tokens, w, cfg$limiar)[["AP"]])   # estagio 1
ap1 <- sapply(dev, function(q) med(q, 5, rks, qts, qrels, ix$tokens, w, cfg$limiar)[["AP"]])   # k = 5 (troquem)
dev[ap1 > ap0]; dev[ap1 < ap0]                                 # ajudou; atrapalhou
```

Leiam uma de cada (`q <- "q03"`, troquem): `docs[names(rks[[q]])[1:5]]` e `docs[rerank_prox(rks[[q]], qts[[q]], ix$tokens, 5, w)[1:5]]`. O grupo escolhe $k$, diz por quê, e só então:

```r
k_esc <- 5                                                     # O QUE O GRUPO ESCOLHEU (exemplo)
round(sapply(teste, function(q) c(antes  = med(q, 0, rks, qts, qrels, ix$tokens, w, cfg$limiar),
                                  depois = med(q, k_esc, rks, qts, qrels, ix$tokens, w, cfg$limiar))), 3)
```

**Exemplos que você mostra:**

- 8 documentos: MAP $0{,}833$ em $k = 1, 2$ e $1$ de $k = 3$ a $8$; o tempo, crescendo com $k$ — o $k$ a escolher é $3$;
- `MAP` parado em todo $k$: o estágio 1 já ordena bem (o LSA) ou as consultas têm um termo. $k = 0$ é escolha válida.

> **Erro previsto:** coluna `ms` com zeros. Sinal: `0.000` em vários $k$. Reação: dev pequeno, rápido demais para o relógio; aumentem as voltas (`1:20` → `1:200`).

> **Checkpoint 4.** *No dev: MAP $0{,}41$ ($k = 0$), $0{,}45$ ($k = 5$), $0{,}45$ ($k = 20$), $0{,}44$ ($k = 50$); ms por consulta $0$, $0{,}3$, $1{,}1$, $2{,}9$. Qual $k$, e por quê?*
> Esperado: $k = 5$ — o mesmo MAP de $k = 20$ com um quarto do custo; $k = 50$ custa mais e perde (promove erros de longe). Depois, o teste uma vez.

---
---

# PARTE C — Teste final: uma pergunta por módulo

Depois do Módulo 4, uma por vez; diga se acertou e, em uma linha, o que faltou.

| módulo | pergunta | esperado |
|---|---|---|
| **1** | Se o estágio 2 desse `d1` 2, `d2` 1, `d3` 0,5, qual o ranking com $k = 3$ e o AP (limiar 2)? | `d1 d2 d3 …`; relevantes em 2º e 3º → $\frac{1}{2}\left(\frac{1}{2} + \frac{2}{3}\right) = 0{,}583$, **pior** que o estágio 1 ($0{,}833$) |
| **2** | Na sua máquina, $k = 3$ e $k = 8$ levam $0{,}46$ e $0{,}71$ s; na do colega, $0{,}9$ e $1{,}4$ s. Quem está certo? | os dois: o tempo absoluto muda com a máquina; o que vale é a comparação — $k = 8$ custa ~50% a mais pela mesma qualidade |
| **3** | O estágio 1 tem $\text{R@}10 = 0{,}6$. Com reordenador perfeito e $k = 10$, quanto vale $\text{R@}10$ depois? | $0{,}6$: reordenar não muda **quem** está no top-10 |
| **4** | Por que se escolhe o **menor** $k$ entre os de MAP igual? | mesma qualidade, menos leituras por consulta, menos chance de promover um erro de longe |

---

# Fechamento

1. **Perguntas guardadas:** responda as curtas; encaminhe as de outras aulas (Aula 09: combinar sinais com pesos aprendidos; Aula 15: busca em escala).
2. **Consolidado** — avise que está gerando. Bloco de código Markdown, até 800 palavras, três partes, primeira pessoa, LaTeX, sem código, **sem a seção "Estado do R"** (quem a escreve é o R):

```markdown
# Consolidado — PI III — Aula 08 — Tema 4 (custo × qualidade) — <data>
*guia de tema versão 1 · tutora: <qual LLM> · grupo: <nome> · presentes: <nomes>*

## 1. O que foi passado
- M1 — curva de qualidade: AP $0{,}833$ em $k \le 2$, $1$ de $k = 3$ em diante
- M2 — `system.time`: o tempo cresce com $k$; $T(k) \approx T_1 + c_0 + k \cdot c$
- M3 — o $\text{R@}k$ do estágio 1 é o teto; cosseno: degrau em $k = 4$
- M4 — corpus do grupo: <tabela k × MAP × ms; k escolhido; teste; ajudou em …; atrapalhou em …>

## 2. Como foi o aprendizado — opinião da tutora
<um parágrafo: preveram o degrau? entenderam o ruído do tempo? leram os textos?>
**Teste final:** acertou M<lista>; a revisar M<lista> — <o que faltou>.

## 3. Observações para a frente
<para a apresentação: a tabela e o k escolhido; perguntas guardadas — aula>
```

3. **Passos de fechamento**, logo abaixo do consolidado:
   1. Copie o bloco e salve como **`aula08_tema_consolidado.md`**.
   2. No Colab, sem fechar a sessão, envie o arquivo; `list.files()` tem que mostrá-lo solto, com esse nome.
   3. Rode `anexar_estado("aula08_tema_consolidado.md")`.
   4. Baixe de volta e confira que a seção "Estado do R" apareceu no fim.
   5. Envie ao repositório do grupo, em **`consolidados/aula08_tema/`**.
