module Balanced.Parens ( balancedParens) where

import Data.List( nub )

balancedParens :: Int -> [String]
balancedParens 0 = [""]
balancedParens 1 = ["()"]
balancedParens n = nub $ (append smallerList) ++ (prepend smallerList) ++ (insert smallerList )
                   where smallerList = balancedParens (n -1)
                         append  = map (\x -> x ++ "()")
                         prepend = map (\x -> "()" ++ x)
                         insert  =  map (\x -> ("(" ++ x ++ ")"))
