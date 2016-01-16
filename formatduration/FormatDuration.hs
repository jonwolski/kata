module FormatDuration (formatDuration) where

import Data.List (intercalate)

-- simple duration with a single magnitude and unit
data Duration = Duration { magnitude :: Int, unit :: String }

instance Show Duration where
  show (Duration 1 u) = "1 " ++ u
  show (Duration m u) = show m ++ " " ++ u ++ "s"

formatDuration :: (Integral i) => i -> String
formatDuration 0 = "now"
formatDuration n = combined durationStrings
  where durationStrings = map show $ filter nonZero $ durations n
        nonZero = (0 /=) . magnitude
        combined (s:[]) = s
        combined (s1:s2:[]) = s1 ++ " and " ++ s2
        combined (s1:ss) = s1 ++ ", " ++ (combined ss)



durations :: (Integral i) => i -> [Duration]
durations n = zipWith Duration (durationValues n) ["_", "year", "day", "hour", "minute", "second"]

durationValues :: (Integral i) => i -> [Int]
durationValues n = map fst $ scanl (quotRem . snd) (0,fromIntegral n) [31536000, 86400, 3600, 60, 1]


