{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE LambdaCase         #-}
{-# LANGUAGE OverloadedStrings  #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.CognitoIdentity.Types.Sum
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
module Network.AWS.CognitoIdentity.Types.Sum where

import           Network.AWS.Prelude

data CognitoErrorCode
    = AccessDenied
    | InternalServerError
    deriving (Eq,Ord,Read,Show,Enum,Bounded,Data,Typeable,Generic)

instance FromText CognitoErrorCode where
    parser = takeLowerText >>= \case
        "accessdenied" -> pure AccessDenied
        "internalservererror" -> pure InternalServerError
        e -> fromTextError $ "Failure parsing CognitoErrorCode from value: '" <> e
           <> "'. Accepted values: AccessDenied, InternalServerError"

instance ToText CognitoErrorCode where
    toText = \case
        AccessDenied -> "AccessDenied"
        InternalServerError -> "InternalServerError"

instance Hashable     CognitoErrorCode
instance NFData       CognitoErrorCode
instance ToByteString CognitoErrorCode
instance ToQuery      CognitoErrorCode
instance ToHeader     CognitoErrorCode

instance FromJSON CognitoErrorCode where
    parseJSON = parseJSONText "CognitoErrorCode"
