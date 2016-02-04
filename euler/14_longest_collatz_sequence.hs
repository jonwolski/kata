import Data.Function.Memoize (memoize)
import Data.Ord (comparing)
import Data.List (maximumBy, length)

main = putStrLn $ show $ longest_collatz_sequence_start

longest_collatz_sequence_start :: Integer
longest_collatz_sequence_start = fst $ maximumBy (comparing snd) $ map collatz_length_pair [1 .. 1000000]

collatz_length_pair :: Integer -> (Integer, Int)
collatz_length_pair n = (n, length (collatz n))

collatz :: Integer -> [Integer]
collatz = memoize collatz'

collatz' :: Integer -> [Integer]
collatz' 1 = []
collatz' n = next:collatz next
  where next
          | odd n = 3 * n + 1
          | even n = n `div` 2


