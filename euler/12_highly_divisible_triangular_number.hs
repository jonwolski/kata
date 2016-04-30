import Math.NumberTheory.Primes.Factorisation (tau)
import Data.List (find)

triangles :: [Integer]
triangles = scanl1 (+) [1 .. ]

numWithManyDivisors :: Integer
numWithManyDivisors = n
  where (Just n) = find ((>= 500) . tau) triangles
  -- no need to match `Nothing`. Since `triangles` is an infinite list, some value will meet the condition eventually.
  -- Also, `find` will never return `Nothing`; it would fail to terminate if the condition were never met.

main = putStrLn $ show $ numWithManyDivisors
