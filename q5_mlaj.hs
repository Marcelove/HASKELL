{-
5. (2.5) Defina uma função compareSets :: (Eq t) => [t] -> [t] -> String que
responda se o primeiro conjunto A contém o segundo conjunto B, se B contém A, se há
interseção entre eles, se eles são disjuntos ou se eles são iguais. Caso A contenha B, a saída
deve ser "B c A"; caso B contenha A, a saída deve ser "A c B"; caso haja interseção, mas
nenhum conjunto contenha o outro, a saída deve ser "Intersection"; caso não haja nenhum
elemento em comum, a saída deve "Disjoint"; caso os conjuntos sejam iguais, a saída deve
ser "A = B". Nos conjuntos, a ordem e a quan.dade de vezes que os elementos estão listados
na coleção não é relevante. Não aplique funções predefinidas em Haskell.

*Main> compareSets [1,2,3,4,5] [3,4]
"B c A"
*Main> compareSets "banana" "nanaba" 
"A = B"
*Main> compareSets "caco" "macaco"
"A c B"
*Main> compareSets [True] [False] 
"Disjoint"
*Main> compareSets ['b','o','l','a'] ['b','u','l','e']
"Intersection"
-}



--Função de utilidade pra saber o tamanho da lista
tamanho :: [t] -> Int
tamanho [] = 0
tamanho (x:xs) = 1 + tamanho xs

--Função principal. Vai separar as operações
--compareSets :: (Eq t) => [t] -> [t] -> String
compareSets :: (Eq t) => [t] -> [t] -> String
compareSets [] [] = "A = B"
compareSets [] _ = "A c B"
compareSets _ [] = "B c A"
compareSets as bs = verificador as bs 

verificador :: (Eq t) => [t] -> [t] -> String
verificador [] _ = "Disjoint"
verificador _ [] = "Disjoint"
verificador as bs
    | ((diferentes as bs)==0) && ((diferentes bs as)==0) = "A = B"
    | (aINb as bs) == (tamanho as) = "A c B"
    | (bINa as bs) == (tamanho bs) = "B c A"
    | (intersection as bs) /= 0 = "Intersection" 
    | (intersection bs as) /= 0 = "Intersection"
    | otherwise = "Disjoint"

--Procura caracteres de A em B
aINb :: (Eq t) => [t] -> [t] -> Int
aINb [] (b:bs) = 0
aINb (a:as) bs = (procurax a bs) + aINb as bs

--Procura caracteres de B em A
bINa :: (Eq t) => [t] -> [t] -> Int
bINa (a:as) [] = 0
bINa as (b:bs) = (procurax b as) + bINa as bs

--Vê se ao menos tem uma interseção
intersection :: (Eq t) => [t] -> [t] -> Int
intersection [] (b:bs) = 0
intersection (a:as) [] = 0
intersection (a:as) bs = (procurax a bs) + intersection as bs
 
--Inverte uma string
inverte :: [a] -> [a]
inverte (a:[]) = [a]
inverte (a:as) = (inverte as) ++ [a]

--Ver se são 100% iguais
iguais :: (Eq t) => [t] -> [t] -> Int
iguais [] [] = 1
iguais (a:as) (b:bs)
    | a == b = iguais as bs
    | otherwise = 0

--Procurar caracter em lista e retornar vezes que aparece
procurax :: (Eq a) => a -> [a] -> Int
procurax _ [] = 0
procurax a (x:xs)
    | a == x = 1 -- + procurax a xs
    | otherwise = procurax a xs

--Procura caracteres diferentes
diferentes :: (Eq t) => [t] -> [t] -> Int
diferentes [] _ = 0
diferentes (a:as) bs = (procurador a bs) + (diferentes as bs)

--Função que procura e se não encontrar diferenças retorna 0
procurador :: (Eq a) => a -> [a] -> Int
procurador _ [] = 1
procurador a (x:xs)
    | a == x = 0 -- + procurax a xs
    | otherwise = procurador a xs



