{-# LANGUAGE Arrows #-}
module DB where


import           Data.Profunctor.Product    (p3)
import           Database.PostgreSQL.Simple (ConnectInfo (..), Connection,
                                             connect)
import           Opaleye


-- See http://haskell.vacationlabs.com/en/latest/docs/opaleye/instant-gratification.html#connecting-to-the-postgresql-database
-- for where most of this was taken from.

userTable :: Table
  (Column PGInt4, Column PGText, Column PGText)  -- read type
  (Column PGInt4, Column PGText, Column PGText) -- write type
userTable = Table "users" (p3 (required "id",
                               required "name",
                               required "email"))


selectAllRows :: Connection -> IO [(Int, String, String)]
selectAllRows conn = runQuery conn $ queryTable userTable


allRows :: IO [(Int, String, String)]
allRows = do
    conn <- connect ConnectInfo {connectHost="localhost"
                                ,connectPort=5432
                                ,connectDatabase="opaleye"
                                ,connectPassword="qwerty"
                                ,connectUser="test"
                                }
    selectAllRows conn
