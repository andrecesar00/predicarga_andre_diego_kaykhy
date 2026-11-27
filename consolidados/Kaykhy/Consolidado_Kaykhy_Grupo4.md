# Consolidado — PI III — Aula 08 — Tema 4 (custo × qualidade) — 2026-11-23
*guia de tema versão 1 · tutora: Gemini · grupo: Predicarga · presentes: <nomes>*

## 1. O que foi passado
- M1 — curva de qualidade: $\text{AP} = 0{,}833$ em $k \le 2$, $1$ de $k = 3$ em diante ($\text{nDCG}$ graduado sobe de $0{,}951$ para $0{,}982$).
- M2 — `system.time`: o tempo cresce com $k$; $T(k) \approx T_1 + c_0 + k \cdot c$, comparando a forma da curva em vez de tempos absolutos.
- M3 — o $\text{R@}k$ do estágio 1 é o teto; no BM25 o degrau ocorre em $k = 3$ e no cosseno em $k = 4$.
- M4 — corpus do grupo: execução no Colab pendente por indisponibilidade de acesso no momento; registrou-se $T_1 = 14$ ms no `dev`, ficando pendentes a tabela $k \times \text{MAP} \times \text{nDCG} \times \text{ms}$, a leitura dos textos de um caso em que ajudou e um em que atrapalhou, a escolha final de $k$ no `dev` e a rodada única no `teste`.

## 2. Como foi o aprendizado — opinião da tutora
Acompanhei uma boa evolução conceitual ao longo dos quatro módulos. O grupo previu corretamente o degrau em $k = 3$ no BM25 e em $k = 4$ no cosseno, entendeu por que cronometrar o vetor pré-calculado distorce o custo e reconheceu tanto o crescimento linear com $k$ quanto a variação de tempos entre máquinas. No Checkpoint 1, inicialmente esperou-se alteração no $\text{AP}$ binário com limiar $1$, ponto corrigido na discussão; no Checkpoint 3, acertou-se o menor $k$, mas os valores parciais de $\text{AP}$ ficaram sem conta explícita. Por falta de acesso ao Colab no Módulo 4, ainda não foi possível inspecionar os números reais do corpus nem ler os textos antes e depois da reordenação.
**Teste final:** acertou M1, M2, M3 e M4; a revisar nenhum módulo — apenas reforçar complementos curtos nas justificativas (em M1, notar que o reordenador piorou o estágio 1; em M2, explicitar a comparação relativa; em M3, destacar que o conjunto do top-$10$ não muda; em M4, lembrar do menor risco de promover erros vindos de longe).

## 3. Observações para a frente
Para a apresentação, assim que recuperarem o acesso ao Colab, gerem a tabela completa no `dev`, definam e justifiquem o $k$ escolhido pelo equilíbrio entre custo e qualidade, leiam um exemplo em que a proximidade ajudou e um em que atrapalhou e rodem o `teste` uma única vez. Não houve perguntas guardadas nesta sessão; os próximos passos naturais do curso ficam para a Aula 09 (combinar sinais com pesos aprendidos) e a Aula 15 (busca em escala).
