{-# LANGUAGE OverloadedStrings #-}

{- |
Module      : AddProject
Description : Add a new Haskell project to the repo (programatically, of course).
License     : BSD
Maintainer  : spano@michalspano.com
Stability   : experimental
Authors     : Michal Spano
-}

module AddProject (appendProj) where

import Haskeww
import System.IO (hFlush, stdout)
import Data.Aeson (encode, object, (.=))
import qualified Data.ByteString.Lazy as B

-- | Prompt the user with a message, read a line from @stdin@.
prompt :: String -> IO String
prompt msg = do
  putStrLn msg
  hFlush stdout
  getLine

-- | Function to write the projects to a JSON file. It wraps the projects into
-- a JSON object with a key @projects@.
toJSONProjects :: FilePath -> [Project] -> IO ()
toJSONProjects filePath projects = do
  B.writeFile filePath json
    where
      json = encode $ object ["projects" .= projects]

-- | The main entry of the module
appendProj :: IO ()
appendProj = do
  projs <- readProjects "projects.json"
  case projs of
    Left err       -> putStrLn $ "Error: " ++ err
    Right projects -> do
      putStrLn "Adding a new project to the repo..."
      n <- prompt "What's the name of the project?\n> "
      l <- prompt "What's a link to the project?\n> "
      d <- prompt "Description of the project?\n> "
      let newProject = Project n l d -- construct a new @Project@.
      toJSONProjects "projects.json" (projects ++ [newProject])
