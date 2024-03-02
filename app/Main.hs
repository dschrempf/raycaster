{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import Control.Monad (unless)
import Paths_hcast (getDataFileName)
import qualified SDL

main :: IO ()
main = do
  SDL.initializeAll

  window <- SDL.createWindow "Hello World!" SDL.defaultWindow
  renderer <- SDL.createRenderer window (-1) SDL.defaultRenderer

  bmp <- getDataFileName "img/tng.bmp" >>= SDL.loadBMP
  tex <- SDL.createTextureFromSurface renderer bmp
  SDL.freeSurface bmp

  let loop = do
        SDL.clear renderer
        SDL.copy renderer tex Nothing Nothing
        SDL.present renderer

        events <- SDL.pollEvents
        unless (elem SDL.QuitEvent $ map SDL.eventPayload events) loop

  loop

  SDL.destroyTexture tex
  SDL.destroyRenderer renderer
  SDL.destroyWindow window

  SDL.quit
