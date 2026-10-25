# ==========================================================================
# config.R -- decisoes do grupo Predicarga
# Caminho: estrutura/codigo/config.R
#
# Este arquivo deve corresponder as decisoes da secao 6 da ficha do projeto.
# ==========================================================================

cfg <- list(
  # --- Aula 01: criterio de documento -----------------------------------
  minimo = 200,

  # --- Aula 03: limpeza e stopwords -------------------------------------
  limpar = TRUE,
  acentos = "translit",
  stopwords = c(
    "de", "e", "a", "o", "em", "da", "do",
    "que", "foi", "no", "para", "com"
  ),

  # --- Aula 04: BM25 ----------------------------------------------------
  k1 = 1.2,
  b = 0.75,

  # --- Aula 5,5: metricas -- ainda nao configuradas ----------------------
  # limiar = 2,
  # juizes = c("Andre"),

  # --- Aula 06: realimentacao -------------------------------------------
  # prf_k = 0,
  # rocchio = c(a = 1, b = 0.75, g = 0.15),

  # --- Aula 07: LSA e busca hibrida --------------------------------------
  # modelo = "bm25",
  # lsa_k = 20,
  # rrf_c = 60,

  # --- Aula 08: reordenacao ---------------------------------------------
  # rerank_k = 0,
  # janela = 3,

  # --- Identificacao do grupo ------------------------------------------
  grupo = "Predicarga"
)
