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
-- Module      : Network.AWS.GameLift.DescribeFleetPortSettings
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Retrieves the port settings for a fleet. Port settings are used to limit
-- incoming traffic access to game servers in the fleet. To get a fleet\'s
-- port settings, specify a fleet ID. If successful, an < IpPermission>
-- object is returned for the requested fleet ID. If the requested fleet
-- has been deleted, the result set will be empty.
module Network.AWS.GameLift.DescribeFleetPortSettings
    (
    -- * Creating a Request
      describeFleetPortSettings
    , DescribeFleetPortSettings
    -- * Request Lenses
    , dfpsFleetId

    -- * Destructuring the Response
    , describeFleetPortSettingsResponse
    , DescribeFleetPortSettingsResponse
    -- * Response Lenses
    , dfpsrsInboundPermissions
    , dfpsrsResponseStatus
    ) where

import           Network.AWS.GameLift.Types
import           Network.AWS.GameLift.Types.Product
import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | Represents the input for a request action.
--
-- /See:/ 'describeFleetPortSettings' smart constructor.
newtype DescribeFleetPortSettings = DescribeFleetPortSettings'
    { _dfpsFleetId :: Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DescribeFleetPortSettings' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dfpsFleetId'
describeFleetPortSettings
    :: Text -- ^ 'dfpsFleetId'
    -> DescribeFleetPortSettings
describeFleetPortSettings pFleetId_ =
    DescribeFleetPortSettings'
    { _dfpsFleetId = pFleetId_
    }

-- | Unique identifier for the fleet you want to retrieve port settings for.
dfpsFleetId :: Lens' DescribeFleetPortSettings Text
dfpsFleetId = lens _dfpsFleetId (\ s a -> s{_dfpsFleetId = a});

instance AWSRequest DescribeFleetPortSettings where
        type Rs DescribeFleetPortSettings =
             DescribeFleetPortSettingsResponse
        request = postJSON gameLift
        response
          = receiveJSON
              (\ s h x ->
                 DescribeFleetPortSettingsResponse' <$>
                   (x .?> "InboundPermissions" .!@ mempty) <*>
                     (pure (fromEnum s)))

instance Hashable DescribeFleetPortSettings

instance ToHeaders DescribeFleetPortSettings where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("GameLift.DescribeFleetPortSettings" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON DescribeFleetPortSettings where
        toJSON DescribeFleetPortSettings'{..}
          = object
              (catMaybes [Just ("FleetId" .= _dfpsFleetId)])

instance ToPath DescribeFleetPortSettings where
        toPath = const "/"

instance ToQuery DescribeFleetPortSettings where
        toQuery = const mempty

-- | Represents the returned data in response to a request action.
--
-- /See:/ 'describeFleetPortSettingsResponse' smart constructor.
data DescribeFleetPortSettingsResponse = DescribeFleetPortSettingsResponse'
    { _dfpsrsInboundPermissions :: !(Maybe [IPPermission])
    , _dfpsrsResponseStatus     :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DescribeFleetPortSettingsResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dfpsrsInboundPermissions'
--
-- * 'dfpsrsResponseStatus'
describeFleetPortSettingsResponse
    :: Int -- ^ 'dfpsrsResponseStatus'
    -> DescribeFleetPortSettingsResponse
describeFleetPortSettingsResponse pResponseStatus_ =
    DescribeFleetPortSettingsResponse'
    { _dfpsrsInboundPermissions = Nothing
    , _dfpsrsResponseStatus = pResponseStatus_
    }

-- | Object containing port settings for the requested fleet ID.
dfpsrsInboundPermissions :: Lens' DescribeFleetPortSettingsResponse [IPPermission]
dfpsrsInboundPermissions = lens _dfpsrsInboundPermissions (\ s a -> s{_dfpsrsInboundPermissions = a}) . _Default . _Coerce;

-- | The response status code.
dfpsrsResponseStatus :: Lens' DescribeFleetPortSettingsResponse Int
dfpsrsResponseStatus = lens _dfpsrsResponseStatus (\ s a -> s{_dfpsrsResponseStatus = a});
