{-# LANGUAGE OverloadedStrings #-}

import           Data.Monoid    ((<>))
import           Data.Text.Lazy (Text, pack)
import qualified DB             as DB
import           Prelude        hiding (span)
import           Web.Scotty


main :: IO ()
main = do
  allRows <- DB.allRows
  let dbData = mconcat (displayRow <$> allRows)
  scotty 3000 $ do
    get "/:word" $ do
      someWord <- param "word" :: ActionM Text
      html (p someWord <> dbData)


displayRow :: (Int, String, String) -> Text
displayRow (_, name, email) =
  p $ (span $ "Name: " <> pack name) <> br <> (span $ "Email: " <> pack email)



-- HTML Helpers

element :: Text -> Text -> Text
element el s =
  mconcat ["<", el, ">", s, "</", el, ">"]

span :: Text -> Text
span =
  element "span"

p :: Text -> Text
p =
  element "p"

br :: Text
br =
  "<br>"

