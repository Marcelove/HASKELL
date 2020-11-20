--current path: Desktop\Periodo 2.5\Meu estudo linguagem HASKELL

--Function to return the double of a given value
doubleMe x = x + x

--FUnction to return the sum of two doubled
--values
doubleUs x y = doubleMe x + doubleMe y

{-
maymulti x = if x<= 100
             then x*2
             else x
-}

--Function that may multiply a given number
--by 2, if it is lesser than 100, then 
--return it summed by 1. Otherwise, it
--just returns the given number summed by
--1	
maymulti x = (if x > 100 then x else x*2) +1

--Function that returns a list that can
--Be called afterwards
lostNumbers = [4,8,15,16,17,23]

--Function that concatenates [1,2,3] to the
--given list

concatenates = [1,2,3] ++ lostNumbers

--The last function sucks when adding some-
--thing to the beginning of a list. Try
--this one wich uses ':' operator. It's
--Instantaneous

instantconc = 1 : lostNumbers

--[1,2,3] is actually just syntactic sugar 
--for 1:2:3:[]. [] is an empty list

instantconca = 1:2:3 : lostNumbers

--Getting elements by its position in a 
--list: in C, you used to type list[x].
--Here you will use '!! x'

procura x = lostNumbers !! x

--Lists can contains lists inside it that
--contais even more lists

b = [[1,2,3,4],[5,3,3,3],[1,2],[1,2,3]] 

{-try  "b !! 1 "", then "b !! 1 !! 0".
Remember that lists of lists have also
to be from the same type (only ints, only
chars ...) -}

try = [['s'], ['S','o','m','m','e']]

--Lists can be compared if the stuff they
--store can be compared

see = [3,2,1] > [0,4,500]
seet = [100,1000,90000] < [101,0,0]
{-note that it doesnt sums. It compares
one by one.-}

--Some list operands:

--head: Returns it's first element

header = head [1,2,3]

--tail: Chops it's head and returns the list

tailer = tail [1,2,3]

--last: Returns list's last element

laster = last [1,2,3]

--init: Chops it's last element and returns 
--      the list.

initier = init [1,2,3]

--length: Returns list's length

lengleng = length [1,2,3]

--null: checks if a list is empty(boolean)

vedadi = null [1,2,3]

--reverse: reverses a list

reverso = reverse [1,2,3]

--take: extracts n first elements from a list
--      and return them

pega x = take x [1,2,3]

--drop: removes n first elements from a list
--     and return the list

dropa x = drop x [1,2,3]

--maximum: takes the max element from a list
--         that can be sorted in some kind
--         of order

maior = maximum [1,2,3]

--minimum: takes the min element from a list
--         that can be sorted in some kind
--         of order

menor = minimum [1,2,3]

--sum: takes a list of numbers and retur
--     their sum

somatudo = sum [1,2,3]

--elem: takes an element and a list of ele
--ments from the same type and tells us 
--if such element is inside that given
--list(boolean)

elemento x = x `elem` [1,2,3]

--Rangeeessssss
--Typing [1..20] is the equivalent of typng
-- [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,
--17,18,19,20].

olhaARangedogaroto = [1..20]
olhaARangedomlk = ['a'..'z']

--You can specify steps aswell

especificamente = [2,4..20]
especificado = ['a', 'c'..'z']

{-You cant do [1,2,4,8,16..100] and expect
to get all powers of 2. Firstly, because
you can only specify one step and secondly
cause sequences that are not arithmetic 
are ambiguous


To make a list from 20 to 1, you cant just 
do [20..1]. You have to do [20, 19..1]
-}

--Its better if you dont operate float 
--values with range. See why

pieceofadvice = [0.1, 0.3..1]

--Try to get the first 24 multiples of 13.
--Yes, you could use [13, 26..24*13].
--But there is a better way

worse = [13, 26..24*13]
better = take 24 [13, 26..]

{-You are probably thinking that you
created an infinit list. BUt thats not
true! haskell is lazy. If you teel it to
just pick up the first 24 elements, it
wont even create an infinit list-}

--FUNctions that produce infinit lists
--Cycle: it goes on forever if you try
--to print it so you have to set up a lmit

ciclatrembolona = take 10 (cycle[1,2])

--Repeat: takes an element and produces an
--infinit list of just that element.

repetecaralho x = take 10 (repeat x)

--SO Its simpler to use replicate. Yes, 
--I did not mention it at the beggining.
--Yes, you had to type these brainer 
--functions. No, it IS funny

vaitomarnocu x = replicate 10 x

--List comprehension
--You could use a function inside a list
--to tell haskell what you want. Lets re
--plicate 'take 10 [2,4..]' :

replicadocaralho = [x*2 | x <- [1..10]]
{-notice that 'x' is drawn from the list 
and each time it gets 'x', 'x' gets doubl-
ed-}

--Now lets add a conditional to the last 
--function

replicaAte = [x*2 | x <-[1..10], x*2 >= 12]

{-read this like: double X, where X is 
taken from this list, but ONLY if x dou-
bled is equal or greater than 12.

This seems familiar?

Yes, it looks like a for loop, but in 
a different order-}

--A function that returns all numbers from
--50 to 100 whose remainder when divided
--by 7 is 3

bojack = [x | x <- [50..100], x `mod`7 ==3]
{-this operation is also called filtering-}

--A function that extracts odd numbers 
--from a list and, if they are less than
--10, you get "pequenino"; else "grandinho"

extraifdp xs = [if x < 10 then "pequenino" else "grandinho" | x <- xs, odd x]

{-Maybe now you were able to identify the
pattern:

[(EXTERNAL VALUE) | (VALUE) <-(WHERE ITS BEING EXTRACTED), (EXTRACTION CONDITONAL)]
-}

--Extracting all even numbers from a certain given range

printace y z = [x | x <- [y..z], (x `mod` 2)== 0]

--There are some interesting operations that can be done with two or more lists

multiplicatudo = [x*y | x <- [1,2,3,4,5], y <- [4,5,6,7,8]]

--Lets say we want all combinatios of two string's lists

magaiaPutoGenerator = [x ++ " " ++ y ++ " " ++ z | x <- ["Marcelove", "Abliptos", "Yuvulcon", "Darko"], y <- ["Birdman", "Cagão", "Vulcon", "Sereio Jack"], z <- ["Pastel", "Pincel", "Intel", "Excel"]]

--What if we wanted all possible products of two given strings that are greater than 50?

possiveL xs ys = [x*y | x <- xs, y <- ys, (x*y) > 50]

--What if we wanted all possible products of two given strings that are more than 50 and are odd?

possivEl xs ys = [x*y | x <- xs, y <- ys, ((x*y) `mod` 2) /= 0]

--I know! Let's write our own version of length! We'll call it length'.Test this function with a list of chars: See the difference between haskell and C?

length' xs = sum [1 | _ <- xs]

--Removing all lowercases or uppercases from a string

removelowercases xs = [x | x <- xs, x `elem` ['A'..'Z']]

removeuppercases xs = [x | x <- xs, x `elem` ['a'..'z']]

--Extracting all even numbers from a list inside a list withou breaking the nested list

nestedevens xxs = [[x | x <- xs, even x] | xs <- xxs]

--Tuples can store multiple element types. Its similar to a structure in C

printatupla :: (String, Int) -> (Int, String)
printatupla (x, y) = (y, x)

--Useful functions are fst and snd. Both only work on pairs

tupla = (8, 9) -- try 'fst tupla', or 'snd tupla'

--Zip function can create a list of pairs. Take a look.

banana1 = [1,2,3,4,5,6]
banana2 = ["One", "Two", "Three", "Four", "Five", "Six"] --try 'zip banana1 banana2'

{-Because haskell is lazy, if you try to zip a 'n length' list with a '(>n) length' list,
you get the only n first results. Bigger list gets chopped off  -}

--A function that generetes all possible right triangles wiht y perimeter mannn (max side size is x)

rightTriangles x y = [(a,b,c) | a <- [1..x], b <- [1..a], c <- [1..b], c^2 + b^2 == a^2, (a+b+c) <= y]

------------------------------------------------------------------------------------------------------
--             TYPES AND TELLING WHAT IS VALID OR NOT BEFORE THE PROGRAM EVEN COMPILES              --
------------------------------------------------------------------------------------------------------

--Haskell has such a mechanism that if you do a single invalid operation, the program doesnt even compiles

--olhaOerrovocenaovainemconseguirchamaressafuncaoporissoelatatodaerradaKkKKkK = 10 `mod` False
{-Failed, no modules loaded.-}

--You can use :t in Prelude and while code is running as well to identify any element type
{-:t 'C'
above input will retur something like " 'C' :: Char". Learn to read '::' as 'has type of'.
-}

--Using type definition we can write our own functions. You know that. Lets rewrite removelower with a type definition:

removelowerr :: [Char] -> [Char]
removelowerr xs = [x | x <- xs, x `elem` ['A'..'Z']]

{-If you want to declare a function but dont know how it should look, you can always write the function anyway without
declaration and after finishing type :t to see how it should look -}

--Polimorphic functions: functions that can return any type
{-
:t fst  
fst :: (a, b) -> a 

:t head  
head :: [a] -> a  
-}

--You've used read function before. But keep in mind that it only works if the program can Infer what type to you want it to return.

{- read "4" wouldnt work, but 'read "4" :: Int' or 'read "4" * 5' would. 
Its like using google translator but you've not chosen the language you want to 
translate it to
-}

--Lets use typeclasses definitions. Use fromIntegral please

typeclassess = (fromIntegral 4) / 2.0

--Write a function that sums two vectors (tip: use TUPLES)

addVectors :: (Int, Int) -> (Int, Int) -> (Int, Int)
addVectors ta tu = (fst ta + fst tu, snd ta + snd tu)

--Thats OK. but you can do better

addVectorss :: (Int, Int) -> (Int, Int) -> (Int, Int)
addVectorss (x1, x2) (y1, y2) = (x1 + y1, x2 + y2)

--Cool. Lets now create our own function in case we want to extract the first second or third element of a triple

first :: (a, a, a) -> a
first (x, _, _) = x

second :: (a, a, a) -> a
second (_, x, _) = x

third :: (a, a, a) -> a
third (_, _, x) = x


--Now a function that sums tuples from a list of tuples called xinxa

xinxa = [(1,2), (1,3), (5,0)]
soma xinxa = [a+b | (a,b) <- xinxa]

--Create your own head function

head' :: [a] -> a
head' [] = error "pepe não está no escopo (provavelmente foi removido)"
head' (x:_) = x

--Telling random things. Note that you can use strings, chars or numbers

tell :: [a] -> String
tell [] = "Nothing"
tell (x:[]) = "Told me one thing"
tell (x:y:[]) = "Told me two things"
tell(x:y:_) = "I've heard about trash talkers, but thats too much mann!"

--Creating our own length function but thist time with recursion

lengiti :: [a] -> Int
lengiti [] = 0
lengiti (_:xs) = 1 + lengiti xs

--Creating your own sum function

summer :: [Int] -> Int
summer [] = 0
summer (x:xs) = x + summer xs

--Lets use de concept of as patterns. 'as patterns' is a way of repeating a part of the code without typing it all again

detudo :: String -> String
detudo [] = "VAzio BABACA"
detudo patterns@(x:xs) = "A primeira letra da palavra " ++ patterns ++ "e a letra: " ++ [x]

--BMI calculator

bmi :: Float -> Float -> String
bmi weight height
    | (weight / height^2) <= 18 = "You are underweight."
    | (weight / height^2) <= 25 = "You are fine."
    | (weight / height^2) <= 30 = "You are overweight."
    | otherwise = "You are obese"

--Lets write a comparing function, but in an exotic way (exotic == never seen)

meucompare :: (Ord a) => a -> a -> Ordering
a `meucompare` b
    | a > b = GT
    | a == b = EQ
    | a < b = LT

--Good coding in BMI function. But lets try to write it a little bit better 

bmiImproved :: Float -> Float -> String
bmiImproved weight height
    |bmmi <= 18.0 = skinny 
    |bmmi <= 25.0 = fine
    |bmmi <= 30.0 = overweight
    | otherwise = obese
    where bmmi = weight / height^2
          skinny = "You are underweight."
          fine = "You are fine."
          overweight = "You are overweight."
          obese = "You are obese."

--Now a function that calculates multiples bmi's from a list of weights and heights

calcBmi :: [(Float, Float)] -> [(Float)]
calcBmi xs = [bmi w h | (w, h) <- xs]
    where bmi w h = w / h^2

--Function to calculate a cilinder area

cilinderArea :: Float -> Float -> Float
cilinderArea r h = (2 * pi * r * h ) + (2 * (pi * r^2))

--Now the same function but it uses LET and IN

cilinderrArea :: Float -> Float -> Float
cilinderrArea r h =
    let sidearea = 2 * pi * r * h 
        toparea = pi * r^2
    in sidearea + 2 * toparea

