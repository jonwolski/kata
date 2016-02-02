import Math.NumberTheory.Primes.Factorisation (tau)
import Data.List (find)

triangles :: [Integer]
triangles = scanl1 (+) [1 .. ]

numWithManyDivisors :: Maybe Integer
numWithManyDivisors = find ((>= 500) . tau) triangles

main = putStrLn $ show $ numWithManyDivisors
