module CollatzConjecture
  ( collatz
  )
where

collatz :: Integer -> Maybe Integer
collatz n | n < 1     = Nothing
          | otherwise = Just . conjectureCount 0 $ n

conjectureCount :: (Enum a, Integral b) => a -> b -> a
conjectureCount count 1 = count
conjectureCount count n | even n    = conjectureCount (succ count) (n `div` 2)
                        | otherwise = conjectureCount (succ count) (3 * n + 1)
