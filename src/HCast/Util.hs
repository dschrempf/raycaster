module HCast.Util (mergeBy) where

-- | Merges the elements of two sorted lists according to the given projection `f` in ascending order.
mergeBy :: (Ord b) => (a -> b) -> [a] -> [a] -> [a]
mergeBy _ xs [] = xs
mergeBy _ [] ys = ys
mergeBy f (x : xs) (y : ys) =
  if f x <= f y
    then x : mergeBy f xs (y : ys)
    else y : mergeBy f (x : xs) ys