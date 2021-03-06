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
-- Module      : Network.AWS.Route53.DeleteTrafficPolicyInstance
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Deletes a traffic policy instance and all of the resource record sets
-- that Amazon Route 53 created when you created the instance.
--
-- To delete a traffic policy instance, send a 'DELETE' request to the
-- '\/Route 53 API version\/trafficpolicy\/traffic policy instance ID'
-- resource.
--
-- When you delete a traffic policy instance, Amazon Route 53 also deletes
-- all of the resource record sets that were created when you created the
-- traffic policy instance.
module Network.AWS.Route53.DeleteTrafficPolicyInstance
    (
    -- * Creating a Request
      deleteTrafficPolicyInstance
    , DeleteTrafficPolicyInstance
    -- * Request Lenses
    , dtpiId

    -- * Destructuring the Response
    , deleteTrafficPolicyInstanceResponse
    , DeleteTrafficPolicyInstanceResponse
    -- * Response Lenses
    , dtpirsResponseStatus
    ) where

import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response
import           Network.AWS.Route53.Types
import           Network.AWS.Route53.Types.Product

-- | A complex type that contains information about the traffic policy
-- instance that you want to delete.
--
-- /See:/ 'deleteTrafficPolicyInstance' smart constructor.
newtype DeleteTrafficPolicyInstance = DeleteTrafficPolicyInstance'
    { _dtpiId :: Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DeleteTrafficPolicyInstance' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dtpiId'
deleteTrafficPolicyInstance
    :: Text -- ^ 'dtpiId'
    -> DeleteTrafficPolicyInstance
deleteTrafficPolicyInstance pId_ =
    DeleteTrafficPolicyInstance'
    { _dtpiId = pId_
    }

-- | The ID of the traffic policy instance that you want to delete.
--
-- When you delete a traffic policy instance, Amazon Route 53 also deletes
-- all of the resource record sets that were created when you created the
-- traffic policy instance.
dtpiId :: Lens' DeleteTrafficPolicyInstance Text
dtpiId = lens _dtpiId (\ s a -> s{_dtpiId = a});

instance AWSRequest DeleteTrafficPolicyInstance where
        type Rs DeleteTrafficPolicyInstance =
             DeleteTrafficPolicyInstanceResponse
        request = delete route53
        response
          = receiveEmpty
              (\ s h x ->
                 DeleteTrafficPolicyInstanceResponse' <$>
                   (pure (fromEnum s)))

instance Hashable DeleteTrafficPolicyInstance

instance ToHeaders DeleteTrafficPolicyInstance where
        toHeaders = const mempty

instance ToPath DeleteTrafficPolicyInstance where
        toPath DeleteTrafficPolicyInstance'{..}
          = mconcat
              ["/2013-04-01/trafficpolicyinstance/", toBS _dtpiId]

instance ToQuery DeleteTrafficPolicyInstance where
        toQuery = const mempty

-- | An empty element.
--
-- /See:/ 'deleteTrafficPolicyInstanceResponse' smart constructor.
newtype DeleteTrafficPolicyInstanceResponse = DeleteTrafficPolicyInstanceResponse'
    { _dtpirsResponseStatus :: Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DeleteTrafficPolicyInstanceResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dtpirsResponseStatus'
deleteTrafficPolicyInstanceResponse
    :: Int -- ^ 'dtpirsResponseStatus'
    -> DeleteTrafficPolicyInstanceResponse
deleteTrafficPolicyInstanceResponse pResponseStatus_ =
    DeleteTrafficPolicyInstanceResponse'
    { _dtpirsResponseStatus = pResponseStatus_
    }

-- | The response status code.
dtpirsResponseStatus :: Lens' DeleteTrafficPolicyInstanceResponse Int
dtpirsResponseStatus = lens _dtpirsResponseStatus (\ s a -> s{_dtpirsResponseStatus = a});
