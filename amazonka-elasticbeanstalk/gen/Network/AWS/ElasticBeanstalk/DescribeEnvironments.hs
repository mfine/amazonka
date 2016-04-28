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
-- Module      : Network.AWS.ElasticBeanstalk.DescribeEnvironments
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Returns descriptions for existing environments.
module Network.AWS.ElasticBeanstalk.DescribeEnvironments
    (
    -- * Creating a Request
      describeEnvironments
    , DescribeEnvironments
    -- * Request Lenses
    , dEnvironmentIds
    , dEnvironmentNames
    , dVersionLabel
    , dApplicationName
    , dIncludedDeletedBackTo
    , dIncludeDeleted

    -- * Destructuring the Response
    , environmentDescriptionsMessage
    , EnvironmentDescriptionsMessage
    -- * Response Lenses
    , edmEnvironments
    ) where

import           Network.AWS.ElasticBeanstalk.Types
import           Network.AWS.ElasticBeanstalk.Types.Product
import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- |
--
-- /See:/ 'describeEnvironments' smart constructor.
data DescribeEnvironments = DescribeEnvironments'
    { _dEnvironmentIds        :: !(Maybe [Text])
    , _dEnvironmentNames      :: !(Maybe [Text])
    , _dVersionLabel          :: !(Maybe Text)
    , _dApplicationName       :: !(Maybe Text)
    , _dIncludedDeletedBackTo :: !(Maybe ISO8601)
    , _dIncludeDeleted        :: !(Maybe Bool)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DescribeEnvironments' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dEnvironmentIds'
--
-- * 'dEnvironmentNames'
--
-- * 'dVersionLabel'
--
-- * 'dApplicationName'
--
-- * 'dIncludedDeletedBackTo'
--
-- * 'dIncludeDeleted'
describeEnvironments
    :: DescribeEnvironments
describeEnvironments =
    DescribeEnvironments'
    { _dEnvironmentIds = Nothing
    , _dEnvironmentNames = Nothing
    , _dVersionLabel = Nothing
    , _dApplicationName = Nothing
    , _dIncludedDeletedBackTo = Nothing
    , _dIncludeDeleted = Nothing
    }

-- | If specified, AWS Elastic Beanstalk restricts the returned descriptions
-- to include only those that have the specified IDs.
dEnvironmentIds :: Lens' DescribeEnvironments [Text]
dEnvironmentIds = lens _dEnvironmentIds (\ s a -> s{_dEnvironmentIds = a}) . _Default . _Coerce;

-- | If specified, AWS Elastic Beanstalk restricts the returned descriptions
-- to include only those that have the specified names.
dEnvironmentNames :: Lens' DescribeEnvironments [Text]
dEnvironmentNames = lens _dEnvironmentNames (\ s a -> s{_dEnvironmentNames = a}) . _Default . _Coerce;

-- | If specified, AWS Elastic Beanstalk restricts the returned descriptions
-- to include only those that are associated with this application version.
dVersionLabel :: Lens' DescribeEnvironments (Maybe Text)
dVersionLabel = lens _dVersionLabel (\ s a -> s{_dVersionLabel = a});

-- | If specified, AWS Elastic Beanstalk restricts the returned descriptions
-- to include only those that are associated with this application.
dApplicationName :: Lens' DescribeEnvironments (Maybe Text)
dApplicationName = lens _dApplicationName (\ s a -> s{_dApplicationName = a});

-- | If specified when 'IncludeDeleted' is set to 'true', then environments
-- deleted after this date are displayed.
dIncludedDeletedBackTo :: Lens' DescribeEnvironments (Maybe UTCTime)
dIncludedDeletedBackTo = lens _dIncludedDeletedBackTo (\ s a -> s{_dIncludedDeletedBackTo = a}) . mapping _Time;

-- | Indicates whether to include deleted environments:
--
-- 'true': Environments that have been deleted after
-- 'IncludedDeletedBackTo' are displayed.
--
-- 'false': Do not include deleted environments.
dIncludeDeleted :: Lens' DescribeEnvironments (Maybe Bool)
dIncludeDeleted = lens _dIncludeDeleted (\ s a -> s{_dIncludeDeleted = a});

instance AWSRequest DescribeEnvironments where
        type Rs DescribeEnvironments =
             EnvironmentDescriptionsMessage
        request = postQuery elasticBeanstalk
        response
          = receiveXMLWrapper "DescribeEnvironmentsResult"
              (\ s h x -> parseXML x)

instance Hashable DescribeEnvironments

instance NFData DescribeEnvironments

instance ToHeaders DescribeEnvironments where
        toHeaders = const mempty

instance ToPath DescribeEnvironments where
        toPath = const "/"

instance ToQuery DescribeEnvironments where
        toQuery DescribeEnvironments'{..}
          = mconcat
              ["Action" =: ("DescribeEnvironments" :: ByteString),
               "Version" =: ("2010-12-01" :: ByteString),
               "EnvironmentIds" =:
                 toQuery (toQueryList "member" <$> _dEnvironmentIds),
               "EnvironmentNames" =:
                 toQuery
                   (toQueryList "member" <$> _dEnvironmentNames),
               "VersionLabel" =: _dVersionLabel,
               "ApplicationName" =: _dApplicationName,
               "IncludedDeletedBackTo" =: _dIncludedDeletedBackTo,
               "IncludeDeleted" =: _dIncludeDeleted]
