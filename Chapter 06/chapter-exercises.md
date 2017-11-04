Chapter exercises
=================

Multiple choice
---------------

1. The Eq class  
   * a) includes all types in Haskell  
   * b) is the same as the Ord class  
   * c) makes equality tests possible  
   * d) only includes numeric types  
   
   Answer: `c)`
   
2. The typeclass Ord
   * a) allows any two values to be compared  
   * b) is a subclass of Eq  
   * c) is a superclass of Eq  
   * d) has no instance for Bool  
   
   Answer: `b)`
   
3. Suppose the typeclass Ord has an operator >. What is the type of >?
   * a) Ord a => a -> a -> Bool  
   * b) Ord a => Int -> Bool  
   * c) Ord a => a -> Char  
   * d) Ord a => Char -> [Char]  
   
   Answer: `a)`
   
4. In x = divMod 16 12
   * a) the type of x is Integer  
   * b) the value of x is undecidable  
   * c) the type of x is a tuple  
   * d) x is equal to 12 / 16  
   
   Answer: `c)`
   
5. The typeclass Integral includes  
   * a) Int and Integer numbers  
   * b) integral, real, and fractional numbers  
   * c) Schrodinger’s cat   
   * d) only positive numbers  
   
   Answer: `a)`
  
  
Does it typecheck?
------------------

For this section of exercises, you’ll be practicing looking for type and typeclass errors.
   
Examine the following code and decide whether it will typecheck. Then load it in GHCi and see if you were correct. 
If it doesn’t typecheck, try to match the type error against your understanding of why it didn’t work. 
If you can, fix the error and re-run the code.

1. Does the following code typecheck? If not, why not?
   ```haskell
   data Person = Person Bool
   
   printPerson :: Person -> IO ()
   printPerson person = putStrLn (show person)
   ```
   This code doesn't typecheck because instance of Show for datatype Person doesn't exist. We can fix it by deriving it or 
   defining it manually
   ```haskell
   data Person = Person Bool deriving Show
   ```
   
2. Does the following typecheck? If not, why not?
   ```haskell
   data Mood = Blah
             | Woot deriving Show
             
   settleDown x = if x == Woot
                    then Blah
                    else x
   ```
   This code doesn't typecheck because instance of Eq for datatype Mood doesn't exist. We can create it by deriving or we can write it
   manually
   ```haskell
   data Mood = Blah
             | Woot deriving (Show, Eq)
   ```
   
3. If you were able to get settleDown to typecheck:
   * a) What values are acceptable inputs to that function?  
     The acceptable inputs are data constructors for datatype Mood (Blah and Woot)
   * b) What will happen if you try to run settleDown 9? Why?  
     It won't compile because inferred type for function `settleDown` is `Mood -> Mood`
   * c) What will happen if you try to run Blah > Woot? Why?  
     It won't compile because there is no instance of Ord for datatype Mood
     
4. Does the following typecheck? If not, why not?
   ```haskell
   type Subject = String
   type Verb = String
   type Object = String
   
   data Sentence =
     Sentence Subject Verb Object
     deriving (Eq, Show)
     
   s1 = Sentence "dogs" "drool"
   s2 = Sentence "Julie" "loves" "dogs"
   ```
   It doesn't typecheck because we did not pass enough arguments to the Sentence data constructor when we were trying to assign value
   to s1 variable
   Possible fix: 
   ```haskell
   s1 = Sentence "cats" "dont" "drool"
   ```
   
   
Given a datatype declaration, what can we do?
---------------------------------------------

Given the following datatype definitions:
```haskell
data Rocks =
  Rocks String deriving (Eq, Show)
  
data Yeah =
  Yeah Bool deriving (Eq, Show)
  
data Papu =
  Papu Rocks Yeah
  deriving (Eq, Show)
```
Which of the following will typecheck? For the ones that don’t typecheck, why don’t they?
1. <br/>  

   ```haskell
   phew = Papu "chases" True
   ```
   This won't typecheck because we have to pass in values of `Rocks` and `Yeah` and not just arguments that these datatypes accect
2. <br/>

   ```haskell
   truth = Papu (Rocks "chomskydoz")
                (Yeah True)
   ```
   OK!
3. <br/>

   ```haskell
   equalityForall :: Papu -> Papu -> Bool
   equalityForall p p' = p == p'
   ```
   OK!
4. <br/>

   ```haskell
   comparePapus :: Papu -> Papu -> Bool
   comparePapus p p' = p > p'
   ```
   This won't typecheck as there is no instance of Ord for Papu datatype
   
   
   
Match the types
---------------
We’re going to give you two types and their implementations. Then we’re going to ask you if you can substitute the second type for the
first. You can test this by typing the first declaration and its type into a file and editing in the new one, 
loading to see if it fails. Don’t just guess, test all your answers!
1. For the following definition.  
   a) 
   ```haskell
   i :: Num a => a
   i = 1
   ```
   b) Try replacing the type signature with the following:
   ```haskell
   i :: a
   ```
   
   Answer: Its not possible
2. a)  
   ```haskell
   f :: Float
   f = 1.0
   ```
   b) 
   ```haskell
   f :: Num a => a
   ```
   Answer: Its not possible
3. a)  
   ```haskell
   f :: Float
   f = 1.0
   ```
   b) 
   ```haskell
   f :: Fractional a => a
   ```
   Answer: OK!
4. Hint for the following: type :info RealFrac in your REPL.
   a) 
   ```haskell
   f :: Float
   f = 1.0
   ```
   b) 
   ```haskell
   f :: RealFrac a => a
   ```
   Answer: OK!
5. a) 
   ```haskell
   freud :: a -> a
   freud x = x
   ```
   b) 
   ```haskell
   freud :: Ord a => a -> a
   ```
   Answer: OK!
6. a) 
   ```haskell
   freud' :: a -> a
   freud' x = x
   ```
   b) 
   ```haskell
   freud' :: Int -> Int
   ```
   Answer: OK!
7. a) 
   ```haskell
   myX = 1 :: Int
   
   sigmund :: Int -> Int
   sigmund x = myX
   ```
   b) 
   ```haskell
   sigmund :: a -> a
   ```
   Answer: Its not possible
8. a) 
   ```haskell
   myX = 1 :: Int
   
   sigmund' :: Int -> Int
   sigmund' x = myX
   ```
   b) 
   ```haskell
   sigmund' :: Num a => a -> a
   ```
   Answer: Its not possible
9. a) You’ll need to import sort from Data.List
   ```haskell
   jung :: Ord a => [a] -> a
   jung xs = head (sort xs)
   ```
   b) 
   ```haskell
   jung :: [Int] -> Int
   ```
   Answer: OK!
10. a) 
    ```haskell
    young :: [Char] -> Char
    young xs = head (sort xs)
    ```  
    b)
    ```haskell
    young :: Ord a => [a] -> a
    ```
    Answer: OK!
   
11. a) 
    ```haskell
    mySort :: [Char] -> [Char]
    mySort = sort
    
    signifier :: [Char] -> Char
    signifier xs = head (mySort xs)
    ```
    b) 
    ```haskell
    signifier :: Ord a => [a] -> a
    ```
    Answer: Its not possible
    
Type-Kwon-Do
------------
Round Two! Same rules apply — you’re trying to fill in terms (code) which’ll fit the type. The idea with these exercises 
is that you’ll derive the implementation from the type information. You’ll probably need to use stuff from Prelude.
1. <br/>

   ```haskell
   chk :: Eq b => (a -> b) -> a -> b -> Bool
   chk = ???
   ```
   
   ```haskell
   chk = \f x y -> f x == y
   ```
2. <br/>

   ```haskell
   -- Hint: use some arithmetic operation to
   -- combine values of type 'b'. Pick one.
   arith :: Num b => (a -> b) -> Integer -> a -> b
   arith = ???
   ```
   
   ```haskell
   arith = \f x y -> (f y) + fromInteger x
   ```
