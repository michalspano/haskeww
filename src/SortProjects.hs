{-# LANGUAGE OverloadedStrings #-}

-- |
-- Module      : SortProjects
-- Description : Sort the existing projects in an alphabetical order.
-- License     : BSD
-- Maintainer  : spano@michalspano.com
-- Stability   : experimental
-- Authors     : Michal Spano

module SortProjects (sortProjs) where

-- | Module imports
import Haskeww
import Data.List (sortBy)
import qualified Data.Text as T
import qualified Data.Text.IO as TIO

-- | Write sorted projects (alphabetically, by name) to the README.md file.
writeProjectsToReadme :: FilePath -> [Project] -> IO ()
writeProjectsToReadme filePath projects = do
  let sortedProjects = sortBy (\p1 p2 -> compare (name p1) (name p2)) projects
  TIO.appendFile filePath (T.unlines $ map formatProject sortedProjects)
  where
    formatProject p = T.pack $ formatMDLink p

-- | Helper funtion to format a @Project@ to
-- ```
--   [{NAME}]({LINK}) - {DESCRIPTION}.
-- ```
formatMDLink :: Project -> String
formatMDLink (Project n l d) = "- [" ++ n ++ "]" ++ "(" ++ l ++ ")" ++ " - " ++ d

-- | Main entry of the module
sortProjs :: IO ()
sortProjs = do
  result <- readProjects "projects.json"
  case result of
    Left err       -> putStrLn $ "Error: " ++ err
    Right projects -> writeProjectsToReadme "README.md" projects

