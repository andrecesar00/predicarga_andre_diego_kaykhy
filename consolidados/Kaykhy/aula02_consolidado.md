# Relatório Consolidado: Aula 02 - Modelo de Espaço Vetorial e Cosseno

## 1. O Problema da Soma Simples
Somar pesos TF-IDF favorece injustamente documentos mais longos. Eles acumulam pontuações maiores simplesmente por terem mais palavras, não necessariamente por serem mais relevantes.

## 2. O Espaço Vetorial
Cada termo do vocabulário se torna uma dimensão independente. Um documento é um vetor nesse espaço multidimensional, onde as coordenadas são os pesos TF-IDF. A consulta do usuário habita esse exato mesmo espaço.

## 3. A Matriz TF-IDF
No R, construímos uma matriz `w` cruzando termos (linhas) e documentos (colunas). Um valor positivo sinaliza a força do termo no documento; um zero indica ausência total daquela palavra.

## 4. Similaridade do Cosseno
Mede a direção, não a magnitude. Avalia o ângulo entre a consulta e o documento. Ao dividir o produto escalar pelo comprimento (norma) dos vetores, documentos longos perdem a vantagem injusta de tamanho. Varia de 0 (nenhuma relação) a 1 (mesma proporção exata de termos).

## 5. Normalização Prévia
Dividir cada coluna da matriz pelo seu próprio comprimento cria "vetores unitários" (norma = 1). Isso permite que o cálculo do cosseno na hora da busca seja reduzido apenas ao produto escalar, eliminando divisões repetitivas e acelerando o motor.

## 6. A Consulta como Vetor
A frase buscada é convertida em vetor usando o vocabulário e o IDF originais do corpus. Palavras repetidas na busca ganham peso extra; palavras que o sistema desconhece são ignoradas sem gerar erros.

## 7. O Processo de Ranqueamento
Usando a função `apply()`, o produto escalar é calculado simultaneamente contra todos os documentos da matriz. A função `sort(decreasing = TRUE)` garante que os resultados de maior similaridade subam para o topo do ranking.

## 8. Forças e Limites
O modelo é rápido e interpretável, mas sofre com a "maldição da correspondência exata". Como as dimensões são independentes, plural/singular ("vetor" vs "vetores") e sinônimos ("carro" vs "automóvel") não se encontram. Para resolver a semântica, o futuro pede Recuperação Densa (Embeddings).
