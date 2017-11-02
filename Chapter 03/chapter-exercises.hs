-- Reading syntax
--
-- 1. For the following lines of code, read the syntasx carefully and decide if
-- they are written correctly. Test them in your REPL after you've decided to
-- check your work. Correct as many as you can.
-- a) it is written correctly
-- b) (++) [1, 2, 3] [4, 5, 6]
-- c) it is written correctly
-- d) ["hello" ++ "world"]
-- e) "hello" !! 4
-- f) it is written correctly
-- g) take 4 "lovely"
-- h) it is written correctly
--
-- 2. Next we have two sets: the first set is lines of code and the other is
-- a set of results. Read the code and figure out which results came
-- from which lines of code. Be sure to test them in the REPL.
-- a) concat [[1 * 6], [2 * 6], [3 * 6]]
-- b) "rain" ++ drop 2 "elbow"
-- c) 10 * head [1, 2, 3]
-- d) (take 3 "Julie") ++ (tail "yes")
-- e) concat [tail [1, 2, 3],
-- tail [4, 5, 6],
-- tail [7, 8, 9]]
-- Can you match each of the previous expressions to one of these
-- results presented in a scrambled order?
-- a) "Jules"
-- b) [2,3,5,6,8,9]
-- c) "rainbow"
-- d) [6,12,18]
-- e) 10
-- ANSWER: 
-- a - d
-- b - c
-- c - e
-- d - a
-- e - b

-- BUILDING FUNCTIONS
-- 1a: "Curry is awesome" ++ "!" == "Curry is awesome!"
-- 1b: drop 4 (take 5 "Curry is awesome!") == "y"
-- 1c: drop 9 "Curry is awesome!" == "awesome!"
-- 
-- 2 Now take each of the above and rewrite it in a source file as a general 
-- function.

exclaim str = str ++ "!"
fifth str = drop 4 (take 5 str)
drop9 str = drop 9 str

-- 3 Write a function of type String -> Char which returns the third
-- character in a String.

thirdLetter :: String -> Char
thirdLetter str = str !! 2

-- 4 Now change that function so the string input is always the same and the 
-- variable represents the number of the letter you want to return

letterIndex :: Int -> Char
letterIndex x = "Curry is awesome!" !! x

-- 5 Using the take and drop functions we looked at above, see if you can write
-- a function called rvrs. rvrs should take the string “Curry is awesome” and
-- return the result “awesome is Curry.”

rvrs x = (drop 9 x) ++ " " ++ (drop 6 (take 8 x)) ++ " " ++ (take 5 x)

-- 6 expand that function into a module
-- module Reverse where
-- 
-- rvrs :: String -> String
-- rvrs x = (drop 9 x) ++ " " ++ (drop 6 (take 8 x)) ++ " " ++ (take 5 x)
-- 
-- main :: IO ()
-- main = print $ rvrs Curry is awesome