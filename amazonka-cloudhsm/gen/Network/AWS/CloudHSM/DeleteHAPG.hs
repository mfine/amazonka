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
-- Module      : Network.AWS.CloudHSM.DeleteHAPG
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Deletes a high-availability partition group.
module Network.AWS.CloudHSM.DeleteHAPG
    (
    -- * Creating a Request
      deleteHAPG
    , DeleteHAPG
    -- * Request Lenses
    , dhHAPGARN

    -- * Destructuring the Response
    , deleteHAPGResponse
    , DeleteHAPGResponse
    -- * Response Lenses
    , dhrsResponseStatus
    , dhrsStatus
    ) where

import           Network.AWS.CloudHSM.Types
import           Network.AWS.CloudHSM.Types.Product
import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | Contains the inputs for the < DeleteHapg> action.
--
-- /See:/ 'deleteHAPG' smart constructor.
newtype DeleteHAPG = DeleteHAPG'
    { _dhHAPGARN :: Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DeleteHAPG' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dhHAPGARN'
deleteHAPG
    :: Text -- ^ 'dhHAPGARN'
    -> DeleteHAPG
deleteHAPG pHAPGARN_ =
    DeleteHAPG'
    { _dhHAPGARN = pHAPGARN_
    }

-- | The ARN of the high-availability partition group to delete.
dhHAPGARN :: Lens' DeleteHAPG Text
dhHAPGARN = lens _dhHAPGARN (\ s a -> s{_dhHAPGARN = a});

instance AWSRequest DeleteHAPG where
        type Rs DeleteHAPG = DeleteHAPGResponse
        request = postJSON cloudHSM
        response
          = receiveJSON
              (\ s h x ->
                 DeleteHAPGResponse' <$>
                   (pure (fromEnum s)) <*> (x .:> "Status"))

instance Hashable DeleteHAPG

instance NFData DeleteHAPG

instance ToHeaders DeleteHAPG where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("CloudHsmFrontendService.DeleteHapg" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON DeleteHAPG where
        toJSON DeleteHAPG'{..}
          = object (catMaybes [Just ("HapgArn" .= _dhHAPGARN)])

instance ToPath DeleteHAPG where
        toPath = const "/"

instance ToQuery DeleteHAPG where
        toQuery = const mempty

-- | Contains the output of the < DeleteHapg> action.
--
-- /See:/ 'deleteHAPGResponse' smart constructor.
data DeleteHAPGResponse = DeleteHAPGResponse'
    { _dhrsResponseStatus :: !Int
    , _dhrsStatus         :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DeleteHAPGResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dhrsResponseStatus'
--
-- * 'dhrsStatus'
deleteHAPGResponse
    :: Int -- ^ 'dhrsResponseStatus'
    -> Text -- ^ 'dhrsStatus'
    -> DeleteHAPGResponse
deleteHAPGResponse pResponseStatus_ pStatus_ =
    DeleteHAPGResponse'
    { _dhrsResponseStatus = pResponseStatus_
    , _dhrsStatus = pStatus_
    }

-- | The response status code.
dhrsResponseStatus :: Lens' DeleteHAPGResponse Int
dhrsResponseStatus = lens _dhrsResponseStatus (\ s a -> s{_dhrsResponseStatus = a});

-- | The status of the action.
dhrsStatus :: Lens' DeleteHAPGResponse Text
dhrsStatus = lens _dhrsStatus (\ s a -> s{_dhrsStatus = a});
