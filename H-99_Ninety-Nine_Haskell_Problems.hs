--H-99: Ninety-Nine Haskell Problems

--Problem 1: Find the last element of a list.

lastelement :: [a] -> [a]
lastelement [] = []
lastelement xs = ultimo xs (length xs)

ultimo :: [a] -> Int -> [a]
ultimo xs a = [xs!!(a-1)]

--Problem 2´: Find the last but one element of a list.

lastButOne :: [a] -> [a]
lastButOne [] = []
lastButOne xs = penultimo xs (length xs)

penultimo :: [a] -> Int -> [a]
penultimo xs a = [xs!!(a-2)]

--Problem 3 : Find the K'th element of a list. The first element in the list is number 1.

findNelement :: [a] -> Int -> [a]
findNelement [] _ = []
findNelement xs a = [xs!!(a-1)]

--Problem 4 : Find the number of elements of a list.

length' :: [a] -> Int
length' [] = 0
length' (a:as) = 1 + length' as

--Problem 5 : Reverse a list.

reverte :: [a] -> [a]
reverte [] = []
reverte (a:as) = reverte as ++ [a]

--Problem 6: Find out whether a list is a palindrome. A palindrome can be read forward or backward; e.g. (x a m a x).

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome xs = xs == (reverte xs)

reverte :: [a] -> [a]
reverte [] = []
reverte (x:xs) = (reverte xs) ++ [x]

--Problem 7 :Flatten a nested list structure; Transform a list, possibly holding lists as elements into a `flat' list by replacing each list with its elements (recursively).

flatten :: [[a]] -> [a]
flatten [] = []
flatten (a:as) = a ++ flatten as

--Problem 8 : Eliminate consecutive duplicates of list elements.If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.

eliminateDupli :: (Eq a) => [a] -> [a]
eliminateDupli [] = []
eliminateDupli (a:[]) = [a]
eliminateDupli (a:as)
    | a == head(as) = eliminateDupli as
    | otherwise = [a] ++ eliminateDupli as

--Problem 9: Pack consecutive duplicates of list elements into sublists. If a list contains repeated elements they should be placed in separate sublists.

pack :: (Eq a) => [a] -> [[a]]
pack [] = []
pack (x:[]) = [[x]]
pack (x:xs) = (pegar x xs) : pack (tirar x xs)

pegar :: (Eq a) => a -> [a] -> [a]
pegar _ [] = []
pegar x (z:zs)
    | x == z = z : pegar x zs
    | otherwise = pegar x zs

tirar :: (Eq a) => a -> [a] -> [a]
tirar _ [] = []
tirar x (z:zs)
    | x == z = tirar x zs
    | otherwise = z : tirar x zs

--Problem 10: Run-length encoding of a list. Use the result of problem P09 to implement the so-called run-length encoding data compression method. Consecutive duplicates of elements are encoded as lists (N E) where N is the number of duplicates of the element E.

encode :: String -> [(Int, Char)]
encode [] = []
encode xs = encoder xs 1

encoder :: String -> Int -> [(Int, Char)]
encoder [] _ = [] 
encoder (x:[]) cont = [(cont, x)]
encoder (x:xs) cont
    | x == head xs = encoder xs (cont+1)
    | otherwise = [(cont, x)] ++ encoder xs 1

--Problem 11: Modify the result of problem 10 in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as (N E) lists.