module Intermission1 where

-- Given the following datatype, answer the following questions:
data Mood = Blah | Woot deriving Show

-- 1. What is the type constructor, or name of this type?
-- Mood

-- 2. f the function requires a Mood value, what are the values you
-- could possibly use there?
-- Blah and Woot

-- 3. We are trying to write a function changeMood to change Chris’s
-- mood instantaneously. So far, we’ve written a type signature
-- changeMood :: Mood -> Woot . What’s wrong with that?
-- The return type should be type constructor (Mood), not data constructor (Woot)
changeMood :: Mood -> Mood

-- 4. Now we want to write the function that changes his mood. Given an input 
-- mood, it gives us the other one. Fix any mistakes and complete the function:
-- changeMood Mood = Woot
-- changeMood _ = Blah

changeMood Blah = Woot
changeMood Woot = Blah
