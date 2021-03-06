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
-- Module      : Network.AWS.SSM.DescribeInstanceInformation
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Describes one or more of your instances. You can use this to get
-- information about instances like the operating system platform, the SSM
-- agent version, status etc. If you specify one or more instance IDs, it
-- returns information for those instances. If you do not specify instance
-- IDs, it returns information for all your instances. If you specify an
-- instance ID that is not valid or an instance that you do not own, you
-- receive an error.
module Network.AWS.SSM.DescribeInstanceInformation
    (
    -- * Creating a Request
      describeInstanceInformation
    , DescribeInstanceInformation
    -- * Request Lenses
    , diiInstanceInformationFilterList
    , diiNextToken
    , diiMaxResults

    -- * Destructuring the Response
    , describeInstanceInformationResponse
    , DescribeInstanceInformationResponse
    -- * Response Lenses
    , diirsNextToken
    , diirsInstanceInformationList
    , diirsResponseStatus
    ) where

import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response
import           Network.AWS.SSM.Types
import           Network.AWS.SSM.Types.Product

-- | /See:/ 'describeInstanceInformation' smart constructor.
data DescribeInstanceInformation = DescribeInstanceInformation'
    { _diiInstanceInformationFilterList :: !(Maybe (List1 InstanceInformationFilter))
    , _diiNextToken                     :: !(Maybe Text)
    , _diiMaxResults                    :: !(Maybe Nat)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DescribeInstanceInformation' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'diiInstanceInformationFilterList'
--
-- * 'diiNextToken'
--
-- * 'diiMaxResults'
describeInstanceInformation
    :: DescribeInstanceInformation
describeInstanceInformation =
    DescribeInstanceInformation'
    { _diiInstanceInformationFilterList = Nothing
    , _diiNextToken = Nothing
    , _diiMaxResults = Nothing
    }

-- | One or more filters. Use a filter to return a more specific list of
-- instances.
diiInstanceInformationFilterList :: Lens' DescribeInstanceInformation (Maybe (NonEmpty InstanceInformationFilter))
diiInstanceInformationFilterList = lens _diiInstanceInformationFilterList (\ s a -> s{_diiInstanceInformationFilterList = a}) . mapping _List1;

-- | The token for the next set of items to return. (You received this token
-- from a previous call.)
diiNextToken :: Lens' DescribeInstanceInformation (Maybe Text)
diiNextToken = lens _diiNextToken (\ s a -> s{_diiNextToken = a});

-- | The maximum number of items to return for this call. The call also
-- returns a token that you can specify in a subsequent call to get the
-- next set of results.
diiMaxResults :: Lens' DescribeInstanceInformation (Maybe Natural)
diiMaxResults = lens _diiMaxResults (\ s a -> s{_diiMaxResults = a}) . mapping _Nat;

instance AWSRequest DescribeInstanceInformation where
        type Rs DescribeInstanceInformation =
             DescribeInstanceInformationResponse
        request = postJSON ssm
        response
          = receiveJSON
              (\ s h x ->
                 DescribeInstanceInformationResponse' <$>
                   (x .?> "NextToken") <*>
                     (x .?> "InstanceInformationList" .!@ mempty)
                     <*> (pure (fromEnum s)))

instance Hashable DescribeInstanceInformation

instance ToHeaders DescribeInstanceInformation where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("AmazonSSM.DescribeInstanceInformation" ::
                       ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON DescribeInstanceInformation where
        toJSON DescribeInstanceInformation'{..}
          = object
              (catMaybes
                 [("InstanceInformationFilterList" .=) <$>
                    _diiInstanceInformationFilterList,
                  ("NextToken" .=) <$> _diiNextToken,
                  ("MaxResults" .=) <$> _diiMaxResults])

instance ToPath DescribeInstanceInformation where
        toPath = const "/"

instance ToQuery DescribeInstanceInformation where
        toQuery = const mempty

-- | /See:/ 'describeInstanceInformationResponse' smart constructor.
data DescribeInstanceInformationResponse = DescribeInstanceInformationResponse'
    { _diirsNextToken               :: !(Maybe Text)
    , _diirsInstanceInformationList :: !(Maybe [InstanceInformation])
    , _diirsResponseStatus          :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DescribeInstanceInformationResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'diirsNextToken'
--
-- * 'diirsInstanceInformationList'
--
-- * 'diirsResponseStatus'
describeInstanceInformationResponse
    :: Int -- ^ 'diirsResponseStatus'
    -> DescribeInstanceInformationResponse
describeInstanceInformationResponse pResponseStatus_ =
    DescribeInstanceInformationResponse'
    { _diirsNextToken = Nothing
    , _diirsInstanceInformationList = Nothing
    , _diirsResponseStatus = pResponseStatus_
    }

-- | The token to use when requesting the next set of items. If there are no
-- additional items to return, the string is empty.
diirsNextToken :: Lens' DescribeInstanceInformationResponse (Maybe Text)
diirsNextToken = lens _diirsNextToken (\ s a -> s{_diirsNextToken = a});

-- | The instance information list.
diirsInstanceInformationList :: Lens' DescribeInstanceInformationResponse [InstanceInformation]
diirsInstanceInformationList = lens _diirsInstanceInformationList (\ s a -> s{_diirsInstanceInformationList = a}) . _Default . _Coerce;

-- | The response status code.
diirsResponseStatus :: Lens' DescribeInstanceInformationResponse Int
diirsResponseStatus = lens _diirsResponseStatus (\ s a -> s{_diirsResponseStatus = a});
