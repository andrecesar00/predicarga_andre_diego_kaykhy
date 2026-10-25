# Consolidado da Sessão Prática de Grupo — Aula 01 (Parte D)

## Parte 1: Resumo dos Módulos
- Módulo 11: Definição coletiva do tema focado no Centro Antigo e História de São Vicente, estabelecimento do público-alvo, formulação das perguntas de busca e definição do parágrafo (> 200 caracteres) como unidade de documento.
- Módulo 12: Coleta automatizada via API da Wikipédia utilizando httr2, segmentação textual, geração dos vetores nomeados docs (64 documentos) e origem, salvamento em docs.rds e origem.rds, e configuração do config.R.
- Módulo 13: Execução da cadeia de indexação com tokenização, construção da matriz termo-documento (2.136 linhas x 64 colunas), verificação da frequência de termos e validação funcional da busca booleana com o termo "ponte".

## Parte 2: Dinâmica e Avaliação da Sessão
O tema foi selecionado por consenso do grupo, aproveitando o contexto histórico de São Vicente dentro da Baixada Santista. O grupo participou ativamente no ajuste dos títulos da Wikipédia que geraram retorno nulo inicialmente, refinando o escopo para três páginas com conteúdo denso. A alternância ao teclado permitiu acompanhar as etapas de manipulação de vetores no R. Ao analisar os 10 termos mais frequentes, o grupo reconheceu imediatamente a predominância de palavras estruturais vazias de significado temático (como "de", "e", "a"), validando a necessidade futura de ponderação TF-IDF e limpeza. O fluxo no Colab correu de forma fluida após a recriação controlada das pastas do repositório.

## Parte 3: Próximos Passos
- Repositório no GitHub configurado com docs.rds, origem.rds, config.R, a ficha de projeto e o consolidado devidamente anexados com o estado do R.
- Três consultas de teste refinadas para aplicação na Aula 02 (Espaço Vetorial e similaridade de cosseno).
- Produzido: Corpus real indexado, matriz TDM funcional e ficha do projeto consolidada.

---

<!-- estado-R:inicio -->
## Estado do R ao fim da sessão
*gerado por `anexar_estado()` em 2026-10-25 01:23 · R version 4.6.1 (2026-06-24) · motor01 v1 2026-10-01 · não edite à mão*

### Objetos

| objeto | tipo | tamanho | valor / amostra |
|---|---|---|---|
| `cfg$minimo` | numeric | 1 | 200 |
| `cfg$grupo` | character | 1 | <nome do grupo> |
| `consolidado_texto` | character | 1 | # Consolidado da Sessão Prá... |
| `df` | numeric, nomeado | 45 | a 4, acelera 1, aprendizado 1, avaliacao 1, bm25 1, busca 2, ... |
| `docs` | character, nomeado | 64 | d1 São Vicente, oficialmente E..., d2 São Vicente marca o início ..., d3 Com um PIB de mais de 6 bil..., d4 São Vicente preserva divers..., d5 A Ilha de Gohayó foi descob..., d6 Nas primeiras décadas do sé..., ... |
| `ficha_texto` | character | 1 | # Ficha do Projeto: Motor d... |
| `freq` | table, nomeado | 2136 | - 3, – 3, — 2, "berço 2, "bica 1, "biquinha". 1, ... |
| `idf` | numeric, nomeado | 45 | a 0.6931, acelera 2.079, aprendizado 2.079, avaliacao 2.079, bm25 2.079, busca 1.386, ... |
| `MOTOR_VERSAO` | character | 1 | motor01 v1 2026-10-01 |
| `N` | integer | 1 | 8 |
| `origem` | character, nomeado | 64 | d1 São Vicente (São Paulo), d2 São Vicente (São Paulo), d3 São Vicente (São Paulo), d4 São Vicente (São Paulo), d5 São Vicente (São Paulo), d6 São Vicente (São Paulo), ... |
| `pars$São Vicente (São Paulo)` | character | 23 | São Vicente, oficialmente E..., São Vicente marca o início ..., Com um PIB de mais de 6 bil..., São Vicente preserva divers..., A Ilha de Gohayó foi descob..., Nas primeiras décadas do sé..., ... |
| `pars$Martim Afonso de Sousa` | character | 29 | Martim Afonso de Sousa (Vil..., Martim Afonso era filho pri..., Algum tempo depois foi nome..., Martim Afonso de Sousa desc..., Martim Afonso de Sousa esca..., Deste casamento nasceu Lopo..., ... |
| `pars$Ponte Pênsil de São Vicente` | character | 12 | A Ponte Pênsil de São Vicen..., A ponte está localizada em ..., A ponte foi proposta pela p..., Faz parte, portanto, do con..., Os pontões da ponte foram i..., A ponte tem 6,4 metros de l..., ... |
| `tam` | integer, nomeado | 64 | d1 76, d2 170, d3 149, d4 211, d5 41, d6 103, ... |
| `tdm` | matrix | 2136 × 64 | linhas: -, –, —, ... \| colunas: d1, d2, d3, d4, ... |
| `textos$São Vicente (São Paulo)` | character | 1 | São Vicente, oficialmente E... |
| `textos$Martim Afonso de Sousa` | character | 1 | Martim Afonso de Sousa (Vil... |
| `textos$Ponte Pênsil de São Vicente` | character | 1 | A Ponte Pênsil de São Vicen... |
| `tfidf` | matrix | 45 × 8 | linhas: a, acelera, aprendizado, ... \| colunas: d1, d2, d3, d4, ... |
| `titulos` | character | 3 | São Vicente (São Paulo), Martim Afonso de Sousa, Ponte Pênsil de São Vicente |
| `tokens$d1` | character | 76 | são, vicente,, oficialmente, estância, balneária, de, ... |
| `tokens$d2` | character | 170 | são, vicente, marca, o, início, efetivo, ... |
| `tokens$d3` | character | 149 | com, um, pib, de, mais, de, ... |
| `tokens$d4` | character | 211 | são, vicente, preserva, diversos, sítios, e, ... |
| `tokens$d5` | character | 41 | a, ilha, de, gohayó, foi, descoberta, ... |
| `tokens$d6` | character | 103 | nas, primeiras, décadas, do, século, xvi,, ... |
| `tokens$d7` | character | 106 | entre, 1530, e, 1532,, a, expedição, ... |
| `tokens$d8` | character | 80 | "sustentou,, por, espaço, de, três, anos,, ... |
| `tokens$d9` | character | 45 | martim, afonso, também, introduziu, a, cultura, ... |
| `tokens$d10` | character | 47 | no, início, da, colonização, portuguesa,, o, ... |
| `tokens$d11` | character | 149 | a, guerra, de, iguape, ocorreu, entre, ... |
| `tokens$d12` | character | 78 | no, final, do, ano, de, 1541,, ... |
| `tokens$d13` | character | 54 | em, meados, do, século, xvi,, a, ... |
| `tokens$d14` | character | 47 | por, volta, de, 1560,, são, vicente, ... |
| `tokens$d15` | character | 69 | em, dezembro, de, 1591,, a, são, ... |
| `tokens$d16` | character | 58 | em, 1615,, outro, pirata, atacou, são, ... |
| `tokens$d17` | character | 52 | em, 1624,, devido, a, disputas, entre, ... |
| `tokens$d18` | character | 72 | segundo, a, enciclopédia, dos, municípios, brasileiros,, ... |
| `tokens$d19` | character | 67 | o, morro, do, voturuá, é, um, ... |
| `tokens$d20` | character | 66 | uma, das, características, da, região, é, ... |
| `tokens$d21` | character | 80 | o, cristianismo, se, faz, presente, na, ... |
| `tokens$d22` | character | 42 | o, sistema, de, telefones, automáticos, foi, ... |
| `tokens$d23` | character | 54 | a, universidade, estadual, paulista, (unesp), possui, ... |
| `tokens$d24` | character | 48 | martim, afonso, de, sousa, (vila, viçosa,, ... |
| `tokens$d25` | character | 92 | martim, afonso, era, filho, primogênito, de, ... |
| `tokens$d26` | character | 64 | algum, tempo, depois, foi, nomeado, pelo, ... |
| `tokens$d27` | character | 125 | martim, afonso, de, sousa, descendia, dos, ... |
| `tokens$d28` | character | 55 | martim, afonso, de, sousa, escapou, com, ... |
| `tokens$d29` | character | 84 | deste, casamento, nasceu, lopo, de, sousa,, ... |
| `tokens$d30` | character | 138 | ao, deixar, o, serviço, do, duque, ... |
| `tokens$d31` | character | 201 | acompanhou, a, rainha, viúva, d., leonor, ... |
| `tokens$d32` | character | 47 | em, espanha,, onde, viveu, quatro, anos,, ... |
| `tokens$d33` | character | 84 | iniciou, sua, carreira, de, homem, de, ... |
| `tokens$d34` | character | 62 | a, historiografia, tradicional, brasileira, encara, sua, ... |
| `tokens$d35` | character | 52 | fundou, em, 22, de, janeiro, de, ... |
| `tokens$d36` | character | 277 | "de, lisboa, saiu, o, governador, martim, ... |
| `tokens$d37` | character | 73 | depois, de, percorrer, todo, o, litoral, ... |
| `tokens$d38` | character | 69 | durante, o, ano, de, 1532,, perdeu, ... |
| `tokens$d39` | character | 42 | uma, onda, gigante,, um, possível, maremoto,, ... |
| `tokens$d40` | character | 73 | combateu, corsários, franceses, no, litoral, e, ... |
| `tokens$d41` | character | 49 | na, região, do, planalto,, na, aldeia, ... |
| `tokens$d42` | character | 109 | sua, expedição, trouxe, para, o, brasil,, ... |
| `tokens$d43` | character | 78 | já, em, 1533, se, encontrava, em, ... |
| `tokens$d44` | character | 53 | nomeado, capitão-mor, do, mar, das, índias, ... |
| `tokens$d45` | character | 159 | chegando, à, índia,, diz, a, «história, ... |
| `tokens$d46` | character | 270 | uma, carta, escrita, em, cochim, durante, ... |
| `tokens$d47` | character | 54 | há, controvérsia, quanto, ao, fim, de, ... |
| `tokens$d48` | character | 58 | foi, senhor, de, alcoentre,, que, comprou, ... |
| `tokens$d49` | character | 86 | ana, pimentel,, esposa, de, martim, afonso, ... |
| `tokens$d50` | character | 80 | rodrigo, afonso, de, sousa, que, entrou, ... |
| `tokens$d51` | character | 96 | segundo, o, livro, de, linhagens, do, ... |
| `tokens$d52` | character | 56 | o, seu, brasão, de, armas, é, ... |
| `tokens$d53` | character | 89 | a, ponte, pênsil, de, são, vicente, ... |
| `tokens$d54` | character | 62 | a, ponte, está, localizada, em, são, ... |
| `tokens$d55` | character | 73 | a, ponte, foi, proposta, pela, primeira, ... |
| `tokens$d56` | character | 34 | faz, parte,, portanto,, do, conjunto, de, ... |
| `tokens$d57` | character | 56 | os, pontões, da, ponte, foram, instalados, ... |
| `tokens$d58` | character | 89 | a, ponte, tem, 6,4, metros, de, ... |
| `tokens$d59` | character | 49 | a, manutenção, e, conservação, da, ponte, ... |
| `tokens$d60` | character | 41 | na, década, de, 1990,, o, piso, ... |
| `tokens$d61` | character | 106 | para, comemorar, o, aniversário, de, 100, ... |
| `tokens$d62` | character | 47 | a, restauração, foi, a, quinta, restauração, ... |
| `tokens$d63` | character | 152 | originalmente,, se, previa, reabrir, a, ponte, ... |
| `tokens$d64` | character | 75 | a, ponte, é, usada, por, 12, ... |
| `vocab` | character | 2136 | -, –, —, "berço, "bica, "biquinha"., ... |

### Funções definidas

`anexar_estado`, `baixar_wiki`, `busca_booleana`, `estado`, `tokenizar`
<!-- estado-R:fim -->

