{-# LANGUAGE OverloadedStrings #-}

-- |
-- Module      : Haskeww
-- Description : The core of Haskeww.
-- License     : BSD
-- Maintainer  : spano@michalspano.com
-- Stability   : experimental
-- Authors     : Michal Spano
module Haskeww (Project (..), readProjects) where

import Data.Aeson
import Data.Aeson.Types (Parser, parseEither)
import qualified Data.ByteString.Lazy as B
import qualified Data.Vector as V

-- | Definition of the @Project@ data type.
data Project = Project
  { name :: String,
    link :: String,
    desc :: String
  }
  deriving (Show)

instance Ord Project where
  compare p1 p2 = compare (name p1) (name p2)

instance Eq Project where
  p1 == p2 = name p1 == name p2

-- a @ToJSON@ property to serialize a @Project@.
instance ToJSON Project where
  toJSON (Project n l d) =
      object ["name" .= n, "link" .= l, "desc" .= d]

-- | Parse the "projects" attribute to a Vector of @Project@s.
parseProjects :: Value -> Parser [Project]
parseProjects = withObject "root" $ \obj -> do
  projectsArray <- obj .: "projects"
  V.toList <$> mapM parseProject (projectsArray :: V.Vector Value)

-- | Parse an individual @Project@ from the JSON format.
parseProject :: Value -> Parser Project
parseProject = withObject "project" $ \obj -> do
  n <- obj .: "name"
  l <- obj .: "link"
  d <- obj .: "desc"
  return $ Project n l d

-- | Read the input JSON file, parse it, detect any errors or return the found
-- projects.
readProjects :: FilePath -> IO (Either String [Project])
readProjects filePath = do
  content <- B.readFile filePath
  return $ eitherDecode content >>= parseEither parseProjects

