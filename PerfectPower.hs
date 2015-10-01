module PerfectPower
( isPP
, nearestLog
) where

import Data.List

isPP :: Integer -> Maybe (Integer, Integer)
isPP 0 = Nothing
isPP 1 = Nothing
isPP n =  find (\(m,k) -> m^k ==n) [ (m, k) | m <- [2 .. j], k <- [2 .. (fst $ n `nearestLog` m)]]
   where j = floor . sqrt . fromIntegral $ n

nearestLog :: Integer -> Integer -> (Integer, Integer)
nearestLog m base
  | base > 1 = until (\(_, accumulator) -> accumulator >= m ) (\(count, accumulator) -> (count+1, accumulator*base)) (0, 1)
