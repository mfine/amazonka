{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.Inspector.LocalizeText
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Translates a textual identifier into a user-readable text in a specified
-- locale.
module Network.AWS.Inspector.LocalizeText
    (
    -- * Creating a Request
      localizeText
    , LocalizeText
    -- * Request Lenses
    , ltLocalizedTexts
    , ltLocale

    -- * Destructuring the Response
    , localizeTextResponse
    , LocalizeTextResponse
    -- * Response Lenses
    , ltrsResults
    , ltrsMessage
    , ltrsResponseStatus
    ) where

import           Network.AWS.Inspector.Types
import           Network.AWS.Inspector.Types.Product
import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'localizeText' smart constructor.
data LocalizeText = LocalizeText'
    { _ltLocalizedTexts :: ![LocalizedText]
    , _ltLocale         :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'LocalizeText' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ltLocalizedTexts'
--
-- * 'ltLocale'
localizeText
    :: Text -- ^ 'ltLocale'
    -> LocalizeText
localizeText pLocale_ =
    LocalizeText'
    { _ltLocalizedTexts = mempty
    , _ltLocale = pLocale_
    }

-- | A list of textual identifiers.
ltLocalizedTexts :: Lens' LocalizeText [LocalizedText]
ltLocalizedTexts = lens _ltLocalizedTexts (\ s a -> s{_ltLocalizedTexts = a}) . _Coerce;

-- | The locale that you want to translate a textual identifier into.
ltLocale :: Lens' LocalizeText Text
ltLocale = lens _ltLocale (\ s a -> s{_ltLocale = a});

instance AWSRequest LocalizeText where
        type Rs LocalizeText = LocalizeTextResponse
        request = postJSON inspector
        response
          = receiveJSON
              (\ s h x ->
                 LocalizeTextResponse' <$>
                   (x .?> "results" .!@ mempty) <*> (x .?> "message")
                     <*> (pure (fromEnum s)))

instance Hashable LocalizeText

instance NFData LocalizeText

instance ToHeaders LocalizeText where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("InspectorService.LocalizeText" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON LocalizeText where
        toJSON LocalizeText'{..}
          = object
              (catMaybes
                 [Just ("localizedTexts" .= _ltLocalizedTexts),
                  Just ("locale" .= _ltLocale)])

instance ToPath LocalizeText where
        toPath = const "/"

instance ToQuery LocalizeText where
        toQuery = const mempty

-- | /See:/ 'localizeTextResponse' smart constructor.
data LocalizeTextResponse = LocalizeTextResponse'
    { _ltrsResults        :: !(Maybe [Text])
    , _ltrsMessage        :: !(Maybe Text)
    , _ltrsResponseStatus :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'LocalizeTextResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'ltrsResults'
--
-- * 'ltrsMessage'
--
-- * 'ltrsResponseStatus'
localizeTextResponse
    :: Int -- ^ 'ltrsResponseStatus'
    -> LocalizeTextResponse
localizeTextResponse pResponseStatus_ =
    LocalizeTextResponse'
    { _ltrsResults = Nothing
    , _ltrsMessage = Nothing
    , _ltrsResponseStatus = pResponseStatus_
    }

-- | The resulting list of user-readable texts.
ltrsResults :: Lens' LocalizeTextResponse [Text]
ltrsResults = lens _ltrsResults (\ s a -> s{_ltrsResults = a}) . _Default . _Coerce;

-- | Confirmation details of the action performed.
ltrsMessage :: Lens' LocalizeTextResponse (Maybe Text)
ltrsMessage = lens _ltrsMessage (\ s a -> s{_ltrsMessage = a});

-- | The response status code.
ltrsResponseStatus :: Lens' LocalizeTextResponse Int
ltrsResponseStatus = lens _ltrsResponseStatus (\ s a -> s{_ltrsResponseStatus = a});
