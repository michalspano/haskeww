{- |
Module      : Main
Description : An easy JSON wrapper for the `Haskeww` project.
License     : BSD
Maintainer  : spano@michalspano.com
Stability   : experimental
Authors     : Michal Spano
-}

module Main where

import AddProject   (appendProj)
import SortProjects (sortProjs)

main :: IO ()
main = do
  appendProj
  sortProjs
