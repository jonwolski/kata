module Sierpinsky  where
import Data.List

sierpinsky :: Integral a => a -> String
sierpinsky n = intercalate "\n" $ map color_pascal_odds $ naive_pascal (2^n -1)

color_pascal_odds :: Integral a => [a] -> String
color_pascal_odds ns =  intersperse ' ' $ map color_pascal_odd_element ns

color_pascal_odd_element :: Integral a => a -> Char
color_pascal_odd_element n
  | odd n = 'L'
  | otherwise = ' '


naive_pascal :: Integral a => a -> [[a]]
naive_pascal 0 = [[1]]
naive_pascal 1 = [[1],[1,1]]
naive_pascal 2 = [[1],[1,1],[1,2,1]]
naive_pascal 3 = [[1],[1,1],[1,2,1],[1,3,3,1]]
naive_pascal 4 = [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
naive_pascal 5 = [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1],[1,5,10,10,5,1]]
naive_pascal 6 = [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1],[1,5,10,10,5,1],[1,6,15,20,15,6,1]]
naive_pascal 7 = [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1],[1,5,10,10,5,1],[1,6,15,20,15,6,1],[1,7,21,35,35,21,7,1]]
naive_pascal 8 = [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1],[1,5,10,10,5,1],[1,6,15,20,15,6,1],[1,7,21,35,35,21,7,1],[1,8,28,56,70,56,28,8,1]]
naive_pascal _ = [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1],[1,5,10,10,5,1],[1,6,15,20,15,6,1],[1,7,21,35,35,21,7,1],[1,8,28,56,70,56,28,8,1]]

pascal :: (Integral a, Integral b) => a -> [[b]]
pascal n = pascal_iter n 0 [[1]]


pascal_iter :: (Integral a, Integral b) => a -> a -> [[b]] -> [[b]]
pascal_iter _ 0 ps = ps
pascal_iter counter iteration ps = pascal_iter (counter + 1 ) (iteration - 1) ((pascal_next_iteration . tail ps):ps)

pascal_next_iteration :: Integral a => [a] -> [a]
pascal_next_iteration (_:[]) = [1,1]
--pascal_next_iteration (a:b:xs) =


