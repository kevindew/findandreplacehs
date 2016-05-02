module Main where

import System.Environment
import qualified Data.List.Utils as Utils

main :: IO ()

main = do
  args <- getArgs
  case args of
    [find, replace, input] -> do
      contents <- findReplaceFile find replace input
      putStrLn contents
    _ -> putStrLn "Usage: [find] [replace] [input]"

findReplaceFile :: String -> String -> String -> IO String

findReplaceFile find replace input = do
  contents <- readFile input
  let replaced = findReplace find replace contents
  return replaced

findReplace :: String -> String -> String -> String

findReplace = Utils.replace
