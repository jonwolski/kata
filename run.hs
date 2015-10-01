import PerfectPower
import System.Environment

main = do
  args <- getArgs
  putStrLn $ show $ isPP $ read $ head args
