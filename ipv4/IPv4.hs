module IPv4 where
import Data.Int  (Int32)
import Data.List (intercalate)

type IPString = String

int32ToIP :: Int32 -> IPString
int32ToIP n = intercalate "." $ map show $ int32ToBytes n

int32ToBytes :: Int32 -> [Int]
int32ToBytes n =  take 4 $ int32ToBytesIter (fromIntegral n,0) [0,0,0,0]

ensurePositive :: Integral a => a -> a
ensurePositive a
  | a < 0 = a + 0x100000000
  | otherwise = a

int32ToBytesIter :: Integral a => (a,a) -> [a] -> [a]
int32ToBytesIter ( 0, 0) ns = ns
int32ToBytesIter ( q, r) ns = int32ToBytesIter (quotRem (ensurePositive q) 0x10) (r:ns)
