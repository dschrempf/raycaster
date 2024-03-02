module HCast.Util (mergeBy) where

-- | Merges the elements of two sorted lists according to the given projection
-- `f` in ascending order.
mergeBy :: (Ord b) => (a -> b) -> [a] -> [a] -> [a]
mergeBy _ xs [] = xs
mergeBy _ [] ys = ys
mergeBy f (x : xs) (y : ys)
  | f x < f y = x : mergeBy f xs (y : ys)
  | otherwise = y : mergeBy f (x : xs) ys
