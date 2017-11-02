module Intermission3 where

-- 1. Given the type a -> a , which is the type for id , attempt to make 
-- a function that is not bottom and terminates successfully that does 
-- something other than returning the same value. This is impossible, but you 
-- should try it anyway
impossible :: a -> a
impossible x = id x


-- 2. Hypothetical function a -> a -> a has two–and only two–implementations.
-- Write both possible versions of a -> a -> a . After doing so, try to violate
-- the constraints of parametrically polymorphic values we outlined above.

impl1 :: a -> a -> a
impl1 x y = x

impl2 :: a -> a -> a
impl2 x y = y

-- impossible_impl :: a -> a -> a
-- impossible_impl True True = 0
-- impossible_impl x y = x


-- 3. Implement a -> b -> b . How many implementations can it have? Does the 
-- behavior change when the types of a and b𝑐change?

impl :: a -> b -> b
impl x y = y

-- it can have only one implementation, the behavior does not change as all
-- arguments are parametrically polymorphic