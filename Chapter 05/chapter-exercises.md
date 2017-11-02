Chapter exercises
=================

Multiple choice
---------------

1. A value of type [a] is  
   * a) a list of alphabetic characters  
   * b) a list of lists  
   * c) a list whose elements are all of some type 𝑏  
   * d) a list whose elements are all of different types  
  
   Answer: `a)`
   
2. A function of type [[a]] -> [a] could  
   * a) take a list of strings as an argument  
   * b) transform a character into a string  
   * c) transform a string in to a list of strings  
   * d) take two arguments
   
   Answer: `a)`
   
3. A function of type [a] -> Int -> a  
   * a) takes one argument  
   * b) returns one element of type a from a list  
   * c) must return an Int value  
   * d) is completely fictional
   
   Answer: `b)`
   
4. A function of type (a, b) -> a  
   a) takes a list argument and returns a Char value  
   b) has zero arguments  
   c) takes a tuple argument and returns the first value  
   d) requires that a and b be of different types
   
   Answer: `c)`
   
   
Determine the types
-------------------
For the following functions, determine the type of the specified value.

1. All function applications return a value. Determine the value returned by these function applications and the type of that
value.

   * a) (* 9) 6  
    `Num a => a`
   * b) head [(0,"doge"),(1,"kitteh")]  
    `Num a => (a, [Char])`
   * c) head [(0 :: Integer ,"doge"),(1,"kitteh")]   
    `(Integer, [Char])`
   * d) if False then True else False  
    `Bool`
   * e) length [1, 2, 3, 4, 5]  
    `Int`
   * f) (length [1, 2, 3, 4]) > (length "TACOCAT")  
    `Bool`
    
2. Given
   ```haskell
   x = 5
   y = x + 5
   w = y * 10
   ```
   What is the type of w? `Num a => a`
   
3. Given
   ```haskell
   x = 5
   y = x + 5
   z y = y * 10
   ```
   What is the type of z? `Num a => a -> a`
   
4. Given
   ```haskell
   x = 5
   y = x + 5
   f = 4 / y
   ```
   What is the type of f? `Fractional a => a`
   
5. Given
   ```haskell
   x = "Julie"
   y = " <3 "
   z = "Haskell"
   f = x ++ y ++ z
   ```
   What is the type of f? `[Char]`
   
Does it compile?
----------------

For each set of expressions, figure out which expression, if any, causes the compiler to squawk at you
(n.b. we do not mean literal squawking) and why. Fix it if you can.

1. <br/>

   ```haskell 
   bigNum = (^) 5 $ 10
   wahoo = bigNum $ 10
   ```
   
   **Fixed:**
   ```haskell
   bigNum = (^) 5 $ 10
   wahoo = bigNum
   ```
2. <br/>

   ```haskell
   x = print
   y = print "woohoo!"
   z = x "hello world"
   ```
   **OK!**
3. <br/>

   ```haskell
   a = (+)
   b = 5
   c = b 10
   d = c 200
   ```
   
   **Fixed:**
   ```haskell
   a = (+)
   b = 5
   c = a b 10
   d = a c 200
   ```
4. <br/>

   ```haskell
   a = 12 + b
   b = 10000 * c
   ```
   
   **Fixed:**
   ```haskell
   a = 12 + b
   b = 10000 * c
   c = 10
   ```
   

Type variable or specific type constructor?
-------------------------------------------

1. You will be shown a type declaration, and you should categorize each type. The choices are a fully polymorphic type variable,
constrained polymorphic type variable, or concrete type constructor.  
   ```haskell
   f :: Num a => a -> b -> Int -> Int
   --           [0]  [1]   [2]    [3]
   ```  
   Here, the answer would be: constrained polymorphic (Num) ([0]), fully polymorphic ([1]), and concrete ([2] and [3]).
  
  
2. Categorize each component of the type signature as described in the previous example.  
   ```haskell
   f :: zed -> Zed -> Blah
   --   [0]    [1]    [2]
   ```  
   Answer: [0] -> fully polymorphic, [1] -> concrete, [2] -> concrete

3. Categorize each component of the type signature
   ```haskell
   f :: Enum b => a -> b -> C
   --            [0]  [1]  [2]
   ```  
   Answer: [0] -> fully polymorphic, [1] -> constrained polymorphic (Enum), [2] -> concrete
   
4. Categorize each component of the type signature
   ```haskell
   f :: f -> g -> C
   --  [0]  [1]  [2]
   ```  
   Answer: [0] -> fully polymorphic, [1] -> fully polymorphic, [2] -> concrete
   
   
Write a type signature
----------------------
For the following expressions, please add a type signature. You should be able to rely on GHCi type inference to check your work,
although you might not have precisely the same answer as GHCi gives (due to polymorphism, etc).

1. While we haven’t fully explained this syntax yet, you’ve seen it in Chapter 2 and as a solution to an exercise in Chapter 4. This
syntax is a way of destructuring a single element of a list.  
   ```haskell
   functionH ::
   functionH (x:_) = x
   ```
   
   ```haskell
   functionH :: [a] -> a
   ```
2. <br/>

   ```haskell
   functionC ::
   functionC x y = if (x > y) then True else False
   ```
   
   ```haskell
   functionC :: Ord a => a -> a -> Bool
   ```
3. <br/>

   ```haskell
   functionS ::
   functionS (x, y) = y
   ```
   
   ```haskell
   functionS :: (a, b) -> b
   ```
   
   
Given a type, write the function
--------------------------------
You will be shown a type and a function that needs to be written. Use the information the type provides to determine what the function
should do. We’ll also tell you how many ways there are to write the function. (Syntactically different but semantically equivalent 
implementations are not counted as being different).

1. There is only one implementation that typechecks.
   ```haskell
   i :: a -> a
   ```  
   ```haskell
   i x = x
   ```
   
2. There is only one version that works.
   ```haskell
   c :: a -> b -> a
   ```  
   ```haskell
   c x y = x
   ```
3. Given alpha equivalence are c” and c (see above) the same thing?
   ```haskell
   c'' :: b -> a -> b
   ```
   ```haskell
   c'' x y = x
   ```
4. Only one version that works.
   ```haskell
   c' :: a -> b -> b
   ```
   ```haskell
   c' x y = y
   ```
5. There are multiple possibilities, at least two of which you’ve seen in previous chapters.
   ```haskell
   r :: [a] -> [a]
   ```
   ```haskell
   r x = take 1 x
   -- or
   r x = drop 1 x
   ```
6. Only one version that will typecheck.
   ```haskell
   co :: (b -> c) -> (a -> b) -> (a -> c)
   ```
   ```haskell
   co f g = \x -> f $ g x
   ```
7. One version will typecheck.
   ```haskell
   a :: (a -> c) -> a -> a
   ```
   ```haskell
   a f x = x
   ```
8. One version will typecheck.
   ```haskell
   a' :: (a -> b) -> a -> b
   ```
   ```haskell
   a' f x = f x
   ```
   
   
Fix it
------
Won’t someone take pity on this poor broken code and fix it up? Be sure to check carefully for things like capitalization, parentheses,
and indentation.

1. <br/>

   ```haskell
   module sing where
   
   fstString :: [Char] ++ [Char]
   fstString x = x ++ " in the rain"
   
   sndString :: [Char] -> Char
   sndString x = x ++ " over the rainbow"
   
   sing = if (x > y) then fstString x or sndString y
   where x = "Singin"
         x = "Somewhere"
   ```
   ```haskell
   module Sing where
   
   fstString :: [Char] -> [Char]
   fstString x = x ++ " in the rain"
   
   sndString :: [Char] -> [Char]
   sndString x = x ++ " over the rainbow"
   
   sing = if (x > y) then fstString x else sndString y
          where x = "Singin"
                y = "Somewhere"
   ```
2. Now that it’s fixed, make a minor change and make it sing the other song. If you’re lucky, you’ll end up with both songs stuck
in your head!
   ```haskell
   -- (...)
   y = "Programmin"
   -- (...)
   ```
3. <br/>

   ```haskell
   -- arith3broken.hs
   module Arith3Broken where
   
   main :: IO ()
   Main = do
     print 1 + 2
     putStrLn 10
     print (negate -1)
     print ((+) 0 blah)
     where blah = negate 1
   ```
   ```haskell
   module Arith3Broken where
   
   main :: IO ()
   Main = do
     print $ 1 + 2
     putStrLn "10"
     print (negate $ -1)
     print ((+) 0 blah)
     where blah = negate 1
   ```
   

Type-Kwon-Do
------------
The idea is to only fill in what we’ve marked with ???.

*Not all terms will always be used in the intended solution for a problem.*

1. <br/>

   ```haskell
   f :: Int -> String
   f = undefined
   
   g :: String -> Char
   g = undefined
   
   h :: Int -> Char
   h = ???
   ```
   ```haskell
   h = \x -> g $ f x
   ```
2. <br/>

   ```haskell
   data A
   data B
   data C
   
   q :: A -> B
   q = undefined
   
   w :: B -> C
   w = undefined
   
   e :: A -> C
   e = ???
   ```
   ```haskell
   e = \x -> w $ q x
   ```
3. <br/>

   ```haskell
   data X
   data Y
   data Z
   
   xz :: X -> Z
   xz = undefined
   
   yz :: Y -> Z
   yz = undefined
   
   xform :: (X, Y) -> (Z, Z)
   xform = ???
   ```
   ```haskell
   xform = \(x, y) -> (xz x, yz y)
   ```

4. <br/>

   ```haskell
   munge :: (x -> y) -> (y -> (w, z)) -> x -> w
   munge = ???
   ```
   ```haskell
   munge = \f g x -> fst $ g $ f x 
   ```
