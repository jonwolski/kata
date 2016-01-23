import System.Environment (getArgs)
import Data.Maybe

-- from http://stackoverflow.com/a/3596543/623316
primes :: [Integer]
primes = 2: 3: sieve (tail primes) [5,7..]
 where
  sieve (p:ps) xs = h ++ sieve ps [x | x <- t, x `rem` p /= 0]
                  where (h,~(_:t)) = span (< p*p) xs

sumOfPrimesUpTo :: Integer -> Integer
sumOfPrimesUpTo n = sum $ takeWhile ( n >= ) primes

main = do
  primeMax <- fmap (maybe 2000000 read . listToMaybe) getArgs
  putStrLn $ show $ sumOfPrimesUpTo primeMax
