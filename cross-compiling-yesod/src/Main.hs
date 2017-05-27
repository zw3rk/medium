{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
import           Yesod

data HelloWorld = HelloWorld

mkYesod "HelloWorld" [parseRoutes|
/ HomeR GET
/page1 Page1R GET
/page2 Page2R GET
|]

instance Yesod HelloWorld

getHomeR :: Handler Html
getHomeR  = defaultLayout [whamlet|Hello World! <a href=@{Page1R}>Go to page 1!|]
getPage1R = defaultLayout [whamlet|Page 1 <a href=@{Page2R}>Go to page 2!|]
getPage2R = defaultLayout [whamlet|Page 2 <a href=@{HomeR}>Go home!|]

main :: IO ()
main = warp 3000 HelloWorld
