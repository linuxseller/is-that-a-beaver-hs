{-# LANGUAGE TemplateHaskell #-}
module Main where

import Raylib.Core (clearBackground, initWindow, setTargetFPS, windowShouldClose, closeWindow)
import Raylib.Core.Textures (loadImage, loadTextureFromImage, drawTextureEx)
import Raylib.Types.Core (Vector2 (Vector2))
import Raylib.Core.Text (drawText)
import Raylib.Core.Shapes (drawRectangle)
import Raylib.Util (drawing, raylibApplication, WindowResources, withWindow, whileWindowOpen)
import Raylib.Util.Colors (red, green, white)

wdt = 720
hght = 720
spacingf :: Float
spacingf = 15
spacing :: Int
spacing = 15

main :: IO ()
main = do
    withWindow
        wdt
        hght
        "Is That bóbr OMG?!?!?"
        29
        (\window -> do
            bobrtxt <- loadImage "./beavers/bobr_01.png" >>= (`loadTextureFromImage` window)
            result <- whileWindowOpen
                (\_ -> do
                    drawing
                        (do
                            let btnWdt = wdt`div`2-spacing
                            clearBackground white
                            drawTextureEx bobrtxt (Vector2 spacingf spacingf) 0 0.5 white
                            drawRectangle spacing (hght-50) btnWdt 40 green
                            drawRectangle (spacing+wdt`div`2) (hght-50) btnWdt 40 red
                            drawText "YES" (wdt`div`4-spacing) (hght-35-spacing) 35 red
                            drawText "NO" (wdt`div`4*3-spacing) (hght-35-spacing) 35 green
                        )
                    return 0
                )
                1
            closeWindow window
        )
