module IsbnVerifier
  ( isbn
  )
where

import           Data.Char
import           Control.Monad

isbn :: String -> Bool
isbn = isValid . zipWithM translateChar [0 ..] . filter (/= '-') where
  translateChar :: (Eq a, Num a) => a -> Char -> Maybe Int
  translateChar 9 'X' = Just 10
  translateChar _ c | isDigit c = Just (read [c] :: Int)
                    | otherwise = Nothing

isValid :: Integral a => Maybe [a] -> Bool
isValid (Just [x1, x2, x3, x4, x5, x6, x7, x8, x9, x10]) =
  ( (x1 * 10)
    + (x2 * 9)
    + (x3 * 8)
    + (x4 * 7)
    + (x5 * 6)
    + (x6 * 5)
    + (x7 * 4)
    + (x8 * 3)
    + (x9 * 2)
    + (x10 * 1)
    )
    `mod` 11
    ==    0
isValid _ = False
