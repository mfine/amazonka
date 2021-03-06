{-# LANGUAGE DeriveGeneric          #-}
{-# LANGUAGE FlexibleInstances      #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE LambdaCase             #-}
{-# LANGUAGE MultiParamTypeClasses  #-}
{-# LANGUAGE OverloadedStrings      #-}
{-# LANGUAGE StandaloneDeriving     #-}
{-# LANGUAGE TemplateHaskell        #-}

-- Module      : Gen.Types.URI
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : provisional
-- Portability : non-portable (GHC extensions)

module Gen.Types.URI where

import           Control.Applicative
import           Control.Lens
import           Data.Aeson
import           Data.Attoparsec.Text (Parser)
import qualified Data.Attoparsec.Text as Parse
import           Data.Text            (Text)
import qualified Data.Text            as Text
import           Gen.TH
import           Gen.Types.Id
import           GHC.Generics         (Generic)

data Segment
    = Tok Text
    | Var Id
      deriving (Eq, Show)

makePrisms ''Segment

data URI = URI'
    { _uriPath  :: [Segment]
    , _uriQuery :: [Segment]
    } deriving (Eq, Show)

makeClassy ''URI

segments :: Traversal' URI Segment
segments f x = URI' <$> traverse f (_uriPath x) <*> traverse f (_uriQuery x)

-- variables :: HasUrTraversal' URI Id
-- variables = segments . _Var

instance FromJSON URI where
    parseJSON = withText "uri" (either fail return . Parse.parseOnly uriParser)

uriParser :: Parser URI
uriParser = URI'
    <$> some seg
    <*> Parse.option [] (Parse.char '?' *> some seg)
    <*  Parse.endOfInput
  where
    seg = Tok <$> Parse.takeWhile1 (end '{')
      <|> Var <$> var

    var = mkId . Text.filter rep <$>
        (Parse.char '{' *> Parse.takeWhile1 (end '}') <* Parse.char '}')

    end x y | x == y = False
    end _ '?'        = False
    end _  _         = True

    rep '+' = False
    rep  _  = True

data Method
    = GET
    | POST
    | HEAD
    | PUT
    | DELETE
    | PATCH
      deriving (Eq, Show, Generic)

instance FromJSON Method where
    parseJSON = gParseJSON' upper

methodToText :: Method -> Text
methodToText = \case
   GET    -> "get"
   POST   -> "post"
   HEAD   -> "head'"
   PUT    -> "put"
   DELETE -> "delete"
   PATCH  -> "patch"

data HTTP f = HTTP
    { _method       :: !Method
    , _requestURI   :: URI
    , _responseCode :: f Int
    } deriving (Generic)

deriving instance Show (HTTP Identity)

makeClassy ''HTTP

instance HasURI (HTTP f) where
    uRI = requestURI

instance FromJSON (HTTP Maybe) where
    parseJSON = gParseJSON' camel
