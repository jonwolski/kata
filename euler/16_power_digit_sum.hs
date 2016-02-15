import Data.Char (digitToInt)

main = putStrLn $ show $ sum $ map digitToInt $ show $ 2 ^ 1000

