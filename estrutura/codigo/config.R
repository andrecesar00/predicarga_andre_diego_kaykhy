cfg <- list(
  minimo = 200,
  limpar = TRUE,
  acentos = "translit",
  stopwords = c(
    "de", "e", "a", "o", "em", "da", "do",
    "que", "foi", "no", "para", "com"
  ),
  grupo = "Predicarga",
  k1 = 1.2,
  b = 0.75,
  limiar = 1,

  # --- Aula 06: realimentacao ---------------------------------------------
  prf_k   = 0,                            # 0 = sem pseudo-realimentacao
  rocchio = c(a = 1, b = 0.75, g = 0.15)  # pesos testados do Rocchio
)