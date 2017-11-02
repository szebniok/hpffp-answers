module Chapter04 where

awesome = ["Papuchon", "curry", ":)"]
alsoAwesome = ["Quake", "The Simons"]
allAwesome = [awesome, alsoAwesome]

-- 1. Given the definition of length above, what would the type signature be?
-- How many arguments, of what type does it take? What is the type of the
-- result it evaluates to?
-- 
-- length :: [a] -> Int
-- It takes one argument, which type is List of any type and it evaluates to 
-- int


-- 2. What are the results of the following expressions?
-- a) length [1, 2, 3, 4, 5]
-- b) length [(1, 2), (2, 3), (3, 4)]
-- c) length allAwesome
-- d) length (concat allAwesome)

-- a) 5
-- b) 3
-- c) 2
-- d) 5


-- 3. Look at these two expressions. One works and one returns an error. 
-- Determine which will return an error and why.
-- Prelude> 6 / 3
-- Prelude> 6 / length [1, 2, 3]

-- The second expression will return an error because return type of length
-- is Int which don't implement the Fractional typeclass 


-- 4. How can you fix the broken code from the preceding exercise using 
-- a different division function/operator?

ex4 = 6 `div` length [1, 2, 3]


-- 5. What is the type of the expression 2 + 3 == 5 ? What would we expect as
-- a result?

-- The type is Bool, the result is True


-- 6. What is the type and expected result value of the following
-- Prelude> let x = 5
-- Prelude> x + 3 == 5

-- type: Bool, result: False


-- 7. Below are some bits of code. Which will work? Why or why not? If they 
-- will work, what value would these reduce to?

-- Prelude> length allAwesome == 2
-- True

--Prelude> length [1, 'a', 3, 'b']
-- It won't work as we can't have list of different types

-- Prelude> length allAwesome + length awesome
-- 5

-- Prelude> (8 == 8) && ('b' < 'a')
-- False

--Prelude> (8 == 8) && 9
-- It won't work as the (&&) function expect value of Bool type


-- 8. Write a function that tells you whether or not a given String (or list)
-- is a palindrome.
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = x == reverse x


-- 9. Write a function to return the absolute value of a number using 
-- if-then-else
myAbs :: Integer -> Integer
myAbs x = if (x < 0) then -x else x


-- 10. Fill in the definition of the following function, using fst and snd :
-- f :: (a, b) -> (c, d) -> ((b, d), (a, c))

f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f x y = ((snd x, snd y), (fst x, fst y))



-- READING SYNTAX

-- 1. Here, we want a function that adds 1 to the length of a string argument
-- and returns that result.
-- x = (+)
-- F xs = w 'x' 1
--      where w = length xs
x = (+)
f' xs = w `x` 1
      where w = length xs


-- 2. 2. This is supposed to be the identity function, id.
-- \ X = x
id' = \x -> x


-- 3. When fixed, this function will return 1 from the value [1, 2, 3].
-- Hint: you may need to refer back to the section about variables conventions
-- in “Hello Haskell” to refresh your memory of this notation.
-- \ x : xs -> x
head' = \(x : xs) -> x


-- 3.  When fixed, this function will return 1 from the value (1, 2)
-- f (a b) = A

f'' (a, b) = a



-- MATCH THE FUNCTION NAMES TO THEIR TYPES

-- 1. Which of the following types is the type of show ?
-- Show a => a -> String


-- 2. Which of the following types is the type of (==)?
-- Eq a => a -> a -> Bool


-- 3. Which of the following types is the type of fst?
-- (a, b) -> a


-- 4. Which of the following types is the type of (+)?
-- Num a => a -> a -> a