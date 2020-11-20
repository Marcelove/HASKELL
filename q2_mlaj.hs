{-
2. (2.5) Implemente a função replace :: String -> String -> String -> String que
retorne o terceiro argumento, substituindo neste toda ocorrência do primeiro argumento pelo
segundo. Não use compreensão de lista nem funções predefinidas em Haskell. Exemplo:
*Main> replace "segunda" "quinta" "As aulas ocorrem nas segundas."

"As aulas ocorrem nas quintas."
*Main>

Conteúdo relacionado: lista
-}

replace :: String -> String -> String -> String
replace [] _ zs = zs
replace xs [] zs = procura xs xs [] zs --Substituir uma palavra por vazio é eliminála
replace _ _ [] = []                    --QUalquer operação em uma string vazia retorna uma string vazia
replace xs ys zs = procura xs xs ys zs


procura ::  String -> String -> String -> String -> String
procura _ _ _ [] = []
procura (a:as) xs ys (z:zs)
    | a == z = verifica as xs ys zs (z:zs) --Se o caracter for igual, inicia-se a verificação
    | otherwise = [z] ++ procura (a:as) xs ys zs --Se não for, passo pro próximo

verifica :: String -> String -> String -> String -> String -> String
verifica (a:as) _ _ [] original = original          --Cheguei ao fim da frase, e ainda tinha palavras pra procurar, ou seja: printo a string inalterada
verifica [] _ ys [] _ = ys                          --Cheguei ao fim da frase! apenas printo
verifica [] xs ys zs _ = ys ++ procura xs xs ys zs  --Encontrei a string a ser eliminada! printo a que quero inserir e continuo a busca após o limite da eliminada
verifica (a:as) xs ys (z:zs) (o:original)
    | a == z = verifica as xs ys zs (o:original)   --Se for igual, passo pro próximo!
    | otherwise = [o] ++ procura xs xs ys original --Não era igual. Retorno ele e continuo a busca de onde parei