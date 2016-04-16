import Data.Char (intToDigit)

type Digit = Char

number_letter_counts :: Int
number_letter_counts = sum $ map ( length . (filter letters_only) . number_to_english_string) [1 .. 1000]

letters_only :: Char -> Bool
letters_only = flip elem ['a' .. 'z']

number_to_english_string :: (Num a, Eq a, Show a) => a -> String
number_to_english_string 0 = "zero"
number_to_english_string 1000 = "one thousand"
number_to_english_string n = digits_to_english_string $ show n

digits_to_english_string :: [Digit]-> String
digits_to_english_string (d:"00") = digit_to_unit_word d ++ " hundred"
digits_to_english_string ('0':'1':units:[]) = digit_to_teen_word units
digits_to_english_string ('0':tens:units:[]) = digit_to_tens_word tens ++ "-" ++ digit_to_unit_word units
digits_to_english_string (hundreds:tens:units:[]) = digit_to_unit_word hundreds ++ " hundred and " ++ digits_to_english_string ('0':tens:units:[])
-- 0-pad fewer than 3 digits
digits_to_english_string (tens:units:[]) = digits_to_english_string( '0':tens:units:[] )
digits_to_english_string (units:[]) = digits_to_english_string( '0':'0':units:[] )
digits_to_english_string _ = ""

digit_to_unit_word :: Digit -> String
digit_to_unit_word '9' = "nine"
digit_to_unit_word '8' = "eight"
digit_to_unit_word '7' = "seven"
digit_to_unit_word '6' = "six"
digit_to_unit_word '5' = "five"
digit_to_unit_word '4' = "four"
digit_to_unit_word '3' = "three"
digit_to_unit_word '2' = "two"
digit_to_unit_word '1' = "one"
digit_to_unit_word _ = ""

digit_to_tens_word :: Digit -> String
digit_to_tens_word '9' = "ninety"
digit_to_tens_word '8' = "eighty"
digit_to_tens_word '7' = "seventy"
digit_to_tens_word '6' = "sixty"
digit_to_tens_word '5' = "fifty"
digit_to_tens_word '4' = "forty"
digit_to_tens_word '3' = "thirty"
digit_to_tens_word '2' = "twenty"
digit_to_tens_word '0' = ""

digit_to_teen_word :: Digit -> String
digit_to_teen_word '9' = "nineteen"
digit_to_teen_word '8' = "eighteen"
digit_to_teen_word '7' = "seventeen"
digit_to_teen_word '6' = "sixteen"
digit_to_teen_word '5' = "fifteen"
digit_to_teen_word '4' = "fourteen"
digit_to_teen_word '3' = "thirteen"
digit_to_teen_word '2' = "twelve"
digit_to_teen_word '1' = "eleven"
digit_to_teen_word '0' = "ten"

main = putStrLn $ show $ number_letter_counts
