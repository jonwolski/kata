module LastDigit where

lastDigit :: Integer -> Integer -> Integer
lastDigit _ 0 = 1
lastDigit 0 _ = 0
lastDigit a b = unitsDigit $ partialProduct (unitsDigit a) b

partialProduct :: Integer -> Integer -> Integer
partialProduct a 0 = 1
partialProduct a b = unitsDigit $ a * (partialProduct a (b-1))

unitsDigit :: Integer -> Integer
unitsDigit n = snd $ quotRem n 10
