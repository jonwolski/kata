module LastDigit where

lastDigit :: Integer -> Integer -> Integer
lastDigit b e = iterate (partialProduct b ) 1 !! fromIntegral e

partialProduct :: Integer -> Integer -> Integer
partialProduct n = unitsDigit . (* n)

unitsDigit :: Integer -> Integer
unitsDigit = flip mod 10


