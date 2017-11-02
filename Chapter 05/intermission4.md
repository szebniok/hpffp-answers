Intermission 4
==============

One function is unapplied, so the compiler will infer maximally polymorphic type. The second function has been applied to a value,
so the inferred type signature may have become concrete, or at least less polymorphic. Figure out how the type would change

1. 
```haskell
-- Type signature of general function
(++) :: [a] -> [a] -> [a]

-- How might that change when we apply
-- it to the following value?
myConcat x = x ++ " yo"
```

Answer: `[Char]`

2.
```haskell
-- General function
(*) :: Num a => a -> a -> a

-- Applied to a value
myMult x = (x / 3) * 5
```

Answer: `Fractional a => a`

3.
```haskell
take :: Int -> [a] -> [a]

myTake x = take x "hey you"
```

Answer: `[Char]`

4.
```haskell
(>) :: Ord a => a -> a -> Bool

myCom x = x > (length [1..10])
```

Answer: `Bool`

5.
```haskell
(<) :: Ord a => a -> a -> Bool

myAlph x = x < 'z'
```

Answer: `Bool`
