module Balanced.Parens ( balancedParens) where

import Data.List
import Data.Maybe

balancedParens :: Int -> [String]
balancedParens n = filter balanced $ nub $ permutations $ take (2*n) $ cycle "()"

balanced :: String -> Bool
balanced (')':_) = False
balanced s = 0 == (snd (fromMaybe ("",-1) (balance_depth (Just(s, 0)))))

balance_depth :: Maybe (String, Integer) -> Maybe (String, Integer)
balance_depth Nothing = Nothing
balance_depth (Just (_, n)) | n < 0 = Nothing
balance_depth (Just ('(':s, n)) = balance_depth $ Just (s, n+1)
balance_depth (Just (')':s, n)) = balance_depth $ Just (s, n-1)
balance_depth (Just ([], n)) = Just ([], n)

