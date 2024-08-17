import Prelude
import Data.List

main :: IO()
main = return ()

square :: Num a => a -> a
square a = a * a

sumOfSquares :: Num a => a -> a -> a
sumOfSquares a b = (square a) + (square b)

f :: (Num a, Ord a) => [a] -> a
f xs = foldl (+) 0 $ map square $ take 2 $ sortBy (flip compare) xs
