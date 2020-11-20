{-
3. (2.5) Defina a função inverse que a partir de uma lista de Strings inverta as letras de cada
palavra bem como sua caixa (maiúsculo para minúsculo e vice-versa). Use as funções de folding
(foldr ou foldl) e map. Todas as demais funções usadas, mesmo predefinidas em Haskell,
precisam ser reescritas.

*Main> inverse ["eXeMpLoUm", "eXeMpLoDoIs"]
"MuOlPmExESiOdOlPmExE"

Conteúdo relacionado: lista, dobras e funções de alta ordem
-}

--Função principal. Ela vai me retornar a primeira string (invertida, e que seus elementos sofreram o map) Concatenada com as outras n strings
inverse :: [String] -> String
inverse [] = []
inverse (x:xs) = revertido (map (contrario) x) ++ (inverse xs)  --Aqui eu uso a função map

--Meu dicionário, que funciona basicamente como uma junção entre toLower e toUpper. Se o char não for uma letra, ele é retornado.
contrario :: Char -> Char
contrario 'a' = 'A'
contrario 'b' = 'B'
contrario 'c' = 'C'
contrario 'd' = 'D'
contrario 'e' = 'E'
contrario 'f' = 'F'
contrario 'g' = 'G'
contrario 'h' = 'H'
contrario 'i' = 'I'
contrario 'j' = 'J'
contrario 'k' = 'K'
contrario 'l' = 'L'
contrario 'm' = 'M'
contrario 'n' = 'N'
contrario 'o' = 'O'
contrario 'p' = 'P'
contrario 'q' = 'Q'
contrario 'r' = 'R'
contrario 's' = 'S'
contrario 't' = 'T'
contrario 'u' = 'U'
contrario 'v' = 'V'
contrario 'w' = 'W'
contrario 'x' = 'X'
contrario 'y' = 'Y'
contrario 'z' = 'Z'
contrario 'A' = 'a'
contrario 'B' = 'b'
contrario 'C' = 'c'
contrario 'D' = 'd'
contrario 'E' = 'e'
contrario 'F' = 'f'
contrario 'G' = 'g'
contrario 'H' = 'h'
contrario 'I' = 'i'
contrario 'J' = 'j'
contrario 'K' = 'k'
contrario 'L' = 'l'
contrario 'M' = 'm'
contrario 'N' = 'n'
contrario 'O' = 'o'
contrario 'P' = 'p'
contrario 'Q' = 'q'
contrario 'R' = 'r'
contrario 'S' = 's'
contrario 'T' = 't'
contrario 'U' = 'u'
contrario 'V' = 'v'
contrario 'W' = 'w'
contrario 'X' = 'x'
contrario 'Y' = 'y'
contrario 'Z' = 'z'
contrario x = x

revertido :: String -> String
revertido [] = []
revertido xs = foldr (\y z -> z ++ [y] ) [] xs --Aqui eu uso uma folding, para reverter a ordem
