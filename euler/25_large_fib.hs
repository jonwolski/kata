import Data.Function
import Data.List
import Data.Maybe
import System.Environment (getArgs)

fib :: (Int -> Integer) -> Int -> Integer
fib f 0 = 1
fib f 1 = 1
fib f n = f (n - 1) + f (n - 2)

memoize :: (Int -> a) -> (Int -> a)
memoize f = (map f [0 ..] !!)

fibMemo :: Int -> Integer
fibMemo = fix (memoize . fib)

indexFibOfLength :: Int -> Int
indexFibOfLength n = (+) 2 $ fromMaybe 0 $ findIndex ((n <=) . length . show) $ map fibMemo [1,2..]

findFibOfLength :: Int -> Integer
findFibOfLength n = fromMaybe 0 $ find ((n <=) . length . show) $ map fibMemo [1,2..]

fibOfLength :: Int -> String
fibOfLength = show . indexFibOfLength

main = do
  minSize <- fmap (maybe 100 read . listToMaybe) getArgs
  putStrLn $ fibOfLength minSize
