module LastDigit where

import Data.List( foldl1' )

lastDigit :: Integer -> Integer -> Integer
lastDigit base exponent = foldl1' partialProduct [ unitsDigit base | _ <- [1..exponent]]

partialProduct :: Integer -> Integer -> Integer
partialProduct base = unitsDigit . (* base)

unitsDigit :: Integer -> Integer
unitsDigit = flip mod 10

