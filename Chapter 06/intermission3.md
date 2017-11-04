Intermission 3
==============
Write the Eq instance for the datatype provided.

1. <br/>

   ```haskell
   data TisAnInteger =
     TisAn Integer
   ```
   
   ```haskell
   instance Eq TisAnInteger where
     (==) (TisAn x) (TisAn x') = x == x'
   ```
2. <br/>

   ```haskell
   data TwoIntegers =
     Two Integer Integer
   ```
   
   ```haskell
   instance Eq TwoIntegers where
     (==) (Two x y) (Two x' y') = x == x' && y == y'
   ```
3. <br/>

   ```haskell
   data StringOrInt =
       TisAnInt Int
     | TisAString String
   ```
   
   ```haskell
   instance Eq StringOrInt where
     (==) (TisAnInt x) (TisAnInt x') = x == x'
     (==) (TisAString x) (TisAString x') = x == x'
     (==) _ _ = False
   ```
4. <br/>

   ```haskell
   data Pair a =
     Pair a a
   ```
   
   ```haskell
   instance Eq a => Eq (Pair a) where
     (==) (Pair x y) (Pair x' y') = x == x' && y == y'
   ```
5. <br/>

   ```haskell
   data Tuple a b =
     Tuple a b
   ```
   
   ```haskell
   instance (Eq a, Eq b) => Eq (Tuple a b) where
     (==) (Tuple x y) (Tuple x' y') = x == x' && y == y'
   ```
6. <br/>

   ```haskell
   data Which a =
       ThisOne a
     | ThatOne a
   ```
   
   ```haskell
   instance Eq a => Eq (Which a) where
     (==) (ThisOne x) (ThisOne x') = x == x'
     (==) (ThatOne x) (ThatOne x') = x == x'
     (==) _ _ = False
   ```
7. <br/>

   ```haskell
   data EitherOr a b =
       Hello a
     | Goodbye b
   ```
   
   ```haskell
   instance (Eq a, Eq b) => Eq (EitherOr a b) where
     (==) (Hello x) (Hello x') = x == x'
     (==) (Goodbye x) (Goodbye x') = x == x'
     (==) _ _ = False
   ```
