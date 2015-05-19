import Graphics.Element exposing (..)
import Time
import Window
import Color exposing (..)
import Graphics.Collage exposing (..)
import Graphics.Element exposing (..)
import Keyboard
import Text exposing (monospace, fromString)
import Time exposing (..)
import Window
import Signal exposing ((<~), (~), foldp, sampleOn)
import Debug exposing (log, watch)


type H = H

(gameWidth,gameHeight) = (600,400)
(halfWidth,halfHeight) = (300,200)
pongGreen = rgb 60 100 60
textGreen = rgb 160 200 160

-- Exercise 2.6
-- Let's put it all together by creating a scene composed of the court and the two paddles,
-- one on each side of the court

-- -- Solution
display : (Int,Int) -> Element
display (w,h) =
  container w h middle <|
  collage gameWidth gameHeight
              [ filled pongGreen (rect gameWidth gameHeight),
                move (20-halfWidth, 0) (filled white (rect 10 40)),
                move (halfWidth-20, 0) (filled white (rect 10 40))
              ]

main = Signal.map display Window.dimensions
