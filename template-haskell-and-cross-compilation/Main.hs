{-# LANGUAGE TemplateHaskell, LambdaCase #-}
module Main where
import Development.GitRev (gitHash)
import Data.FileEmbed     (embedStringFile)
import System.Environment (getProgName, getArgs)
import System.Exit        (die)
main :: IO ()
main = getArgs >>= \case
  ["--licenses"] -> putStrLn $(embedStringFile "LICENSES")
  ["--version"]  -> putStrLn ("Version " ++ $gitHash)
  _otherwise     -> do
    prog <- getProgName
    die $ "usage: " ++ prog ++ " [--licenses] [--version]"
