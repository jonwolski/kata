module Lib (
  lexiPos
  ) where
import Data.List

lexiPos :: String -> Integer
lexiPos s = 1 + lexiPos' s 0

lexiPos' :: String -> Integer -> Integer
lexiPos' [] n = n
lexiPos' s@(x:xs) n = lexiPos' xs $ n + value s

value :: String -> Integer
value xs@(x:_) = dp * p `div` l
  where l = toInteger $ length xs
        Just p = fmap toInteger $ elemIndex x $ s
        dp = distinct_permutations s
        s = sort xs

distinct_permutations :: String -> Integer
distinct_permutations [] = 0
distinct_permutations (_:[]) = 1
distinct_permutations xs = (factorial $ toInteger $ length xs ) `div` (product $ fmap factorial $ repititions xs)

factorial :: Integral a => a -> a
factorial n = product [1 .. n]

repititions :: String -> [Integer]
repititions xs = repititions' xs [] 1

repititions' :: String -> [Integer] -> Integer -> [Integer]
repititions' [] acc tally = acc
repititions' (a:[]) acc tally = tally:acc
repititions' (a:b:xs) acc tally
  | a == b     = repititions' (b:xs) acc (tally + 1)
  | otherwise  = repititions' (b:xs) (tally:acc) 1
