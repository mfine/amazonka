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
-- Module      : Network.AWS.SES.ListIdentityPolicies
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Returns a list of sending authorization policies that are attached to
-- the given identity (email address or domain). This API returns only a
-- list. If you want the actual policy content, you can use
-- 'GetIdentityPolicies'.
--
-- This API is for the identity owner only. If you have not verified the
-- identity, this API will return an error.
--
-- Sending authorization is a feature that enables an identity owner to
-- authorize other senders to use its identities. For information about
-- using sending authorization, see the
-- <http://docs.aws.amazon.com/ses/latest/DeveloperGuide/sending-authorization.html Amazon SES Developer Guide>.
--
-- This action is throttled at one request per second.
module Network.AWS.SES.ListIdentityPolicies
    (
    -- * Creating a Request
      listIdentityPolicies
    , ListIdentityPolicies
    -- * Request Lenses
    , lipIdentity

    -- * Destructuring the Response
    , listIdentityPoliciesResponse
    , ListIdentityPoliciesResponse
    -- * Response Lenses
    , liprsResponseStatus
    , liprsPolicyNames
    ) where

import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response
import           Network.AWS.SES.Types
import           Network.AWS.SES.Types.Product

-- | /See:/ 'listIdentityPolicies' smart constructor.
newtype ListIdentityPolicies = ListIdentityPolicies'
    { _lipIdentity :: Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ListIdentityPolicies' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'lipIdentity'
listIdentityPolicies
    :: Text -- ^ 'lipIdentity'
    -> ListIdentityPolicies
listIdentityPolicies pIdentity_ =
    ListIdentityPolicies'
    { _lipIdentity = pIdentity_
    }

-- | The identity that is associated with the policy for which the policies
-- will be listed. You can specify an identity by using its name or by
-- using its Amazon Resource Name (ARN). Examples: 'user\'example.com',
-- 'example.com',
-- 'arn:aws:ses:us-east-1:123456789012:identity\/example.com'.
--
-- To successfully call this API, you must own the identity.
lipIdentity :: Lens' ListIdentityPolicies Text
lipIdentity = lens _lipIdentity (\ s a -> s{_lipIdentity = a});

instance AWSRequest ListIdentityPolicies where
        type Rs ListIdentityPolicies =
             ListIdentityPoliciesResponse
        request = postQuery ses
        response
          = receiveXMLWrapper "ListIdentityPoliciesResult"
              (\ s h x ->
                 ListIdentityPoliciesResponse' <$>
                   (pure (fromEnum s)) <*>
                     (x .@? "PolicyNames" .!@ mempty >>=
                        parseXMLList "member"))

instance Hashable ListIdentityPolicies

instance NFData ListIdentityPolicies

instance ToHeaders ListIdentityPolicies where
        toHeaders = const mempty

instance ToPath ListIdentityPolicies where
        toPath = const "/"

instance ToQuery ListIdentityPolicies where
        toQuery ListIdentityPolicies'{..}
          = mconcat
              ["Action" =: ("ListIdentityPolicies" :: ByteString),
               "Version" =: ("2010-12-01" :: ByteString),
               "Identity" =: _lipIdentity]

-- | /See:/ 'listIdentityPoliciesResponse' smart constructor.
data ListIdentityPoliciesResponse = ListIdentityPoliciesResponse'
    { _liprsResponseStatus :: !Int
    , _liprsPolicyNames    :: ![Text]
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'ListIdentityPoliciesResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'liprsResponseStatus'
--
-- * 'liprsPolicyNames'
listIdentityPoliciesResponse
    :: Int -- ^ 'liprsResponseStatus'
    -> ListIdentityPoliciesResponse
listIdentityPoliciesResponse pResponseStatus_ =
    ListIdentityPoliciesResponse'
    { _liprsResponseStatus = pResponseStatus_
    , _liprsPolicyNames = mempty
    }

-- | The response status code.
liprsResponseStatus :: Lens' ListIdentityPoliciesResponse Int
liprsResponseStatus = lens _liprsResponseStatus (\ s a -> s{_liprsResponseStatus = a});

-- | A list of names of policies that apply to the specified identity.
liprsPolicyNames :: Lens' ListIdentityPoliciesResponse [Text]
liprsPolicyNames = lens _liprsPolicyNames (\ s a -> s{_liprsPolicyNames = a}) . _Coerce;
