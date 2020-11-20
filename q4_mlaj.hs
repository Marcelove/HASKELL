{-
4. (2.5) Implemente a função ordPairs que a partirr de uma lista de pares e um inteiro, ordene a
lista de acordo com a chave (campo da dupla) indicada pelo inteiro: 0 para o primeiro e 1 para o
segundo. U.lize funções de alta ordem, mas não aplique funções predefinidas em Haskell

*Main> ordPairs [('b',3),('c',2),('a',1)] 0
[('a',1),('b',3),('c',2)]

*Main> ordPairs [('b',3),('c',2),('a',1)] 1
[('a',1),('c',2),('b',3)]

-}

--Função de distribuição. Se n = 0, quero ordenar os primeiros. Se n = 1, quero ordenar os segundos
ordPairs :: (Ord a, Ord b) => [(a, b)] -> Int -> [(a, b)]
ordPairs [] _ = []
ordPairs pairList 0 = primeiros bubbleSort pairList
ordPairs pairList 1 = segundos bubbleSort pairList

--Função de alta ordem que recebe uma função como um de seus argumentos 
primeiros :: (Ord a, Ord b) => ([(a, b)] -> Int -> [(a, b)]) -> [(a, b)] -> [(a, b)]
primeiros f pairList = f pairList 1

--Função de alta ordem que recebe uma função como um de seus argumentos 
segundos :: (Ord a, Ord b) => ([(a, b)] -> Int -> [(a, b)]) -> [(a, b)] -> [(a, b)]
segundos f pairList = f pairList 2

--Função que realiza o método de ordenação bubblesort em tuplas
bubbleSort :: (Ord a, Ord b) => [(a,b)] -> Int -> [(a,b)]
bubbleSort [] _ = []
bubbleSort (x:[]) _= []
bubbleSort xs n = loopin xs (length xs) n


--Função que me garante que a lista sofrerá o sorting n vezes (bubblesort precisa verificar uma lista de elementos n vezes para ordena-los)
loopin :: (Ord a, Ord b) => [(a,b)] -> Int -> Int -> [(a,b)]
loopin xs 0 _ = xs
loopin xs n z
    | z == 1 = loopin (sort1 xs) (n-1) z
    | z == 2 = loopin (sort2 xs) (n-1) z


--Ordenação de primeiros elementos
sort1 :: (Ord a, Ord b) => [(a,b)] -> [(a,b)]
sort1 [] = []
sort1 (x:[]) = [x]
sort1 ((a,b) : (c,d) : xs)
    |  a >= c = (c,d) : sort1 ((a,b):xs)
    | otherwise = (a,b) : sort1 ((c,d):xs)


--Ordenação de segundos elementos
sort2 :: (Ord a, Ord b) => [(a,b)] -> [(a,b)]
sort2 [] = []
sort2 (x:[]) = [x]
sort2 ((a,b) : (c,d) : xs)
    |  d >= b = (a,b) : sort2 ((c,d):xs)
    | otherwise = (c,d) : sort2 ((a,b):xs)