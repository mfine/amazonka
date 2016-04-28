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
-- Module      : Network.AWS.CloudHSM.DescribeLunaClient
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Retrieves information about an HSM client.
module Network.AWS.CloudHSM.DescribeLunaClient
    (
    -- * Creating a Request
      describeLunaClient
    , DescribeLunaClient
    -- * Request Lenses
    , dlcClientARN
    , dlcCertificateFingerprint

    -- * Destructuring the Response
    , describeLunaClientResponse
    , DescribeLunaClientResponse
    -- * Response Lenses
    , drsClientARN
    , drsLastModifiedTimestamp
    , drsCertificateFingerprint
    , drsCertificate
    , drsLabel
    , drsResponseStatus
    ) where

import           Network.AWS.CloudHSM.Types
import           Network.AWS.CloudHSM.Types.Product
import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'describeLunaClient' smart constructor.
data DescribeLunaClient = DescribeLunaClient'
    { _dlcClientARN              :: !(Maybe Text)
    , _dlcCertificateFingerprint :: !(Maybe Text)
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DescribeLunaClient' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'dlcClientARN'
--
-- * 'dlcCertificateFingerprint'
describeLunaClient
    :: DescribeLunaClient
describeLunaClient =
    DescribeLunaClient'
    { _dlcClientARN = Nothing
    , _dlcCertificateFingerprint = Nothing
    }

-- | The ARN of the client.
dlcClientARN :: Lens' DescribeLunaClient (Maybe Text)
dlcClientARN = lens _dlcClientARN (\ s a -> s{_dlcClientARN = a});

-- | The certificate fingerprint.
dlcCertificateFingerprint :: Lens' DescribeLunaClient (Maybe Text)
dlcCertificateFingerprint = lens _dlcCertificateFingerprint (\ s a -> s{_dlcCertificateFingerprint = a});

instance AWSRequest DescribeLunaClient where
        type Rs DescribeLunaClient =
             DescribeLunaClientResponse
        request = postJSON cloudHSM
        response
          = receiveJSON
              (\ s h x ->
                 DescribeLunaClientResponse' <$>
                   (x .?> "ClientArn") <*>
                     (x .?> "LastModifiedTimestamp")
                     <*> (x .?> "CertificateFingerprint")
                     <*> (x .?> "Certificate")
                     <*> (x .?> "Label")
                     <*> (pure (fromEnum s)))

instance Hashable DescribeLunaClient

instance NFData DescribeLunaClient

instance ToHeaders DescribeLunaClient where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("CloudHsmFrontendService.DescribeLunaClient" ::
                       ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON DescribeLunaClient where
        toJSON DescribeLunaClient'{..}
          = object
              (catMaybes
                 [("ClientArn" .=) <$> _dlcClientARN,
                  ("CertificateFingerprint" .=) <$>
                    _dlcCertificateFingerprint])

instance ToPath DescribeLunaClient where
        toPath = const "/"

instance ToQuery DescribeLunaClient where
        toQuery = const mempty

-- | /See:/ 'describeLunaClientResponse' smart constructor.
data DescribeLunaClientResponse = DescribeLunaClientResponse'
    { _drsClientARN              :: !(Maybe Text)
    , _drsLastModifiedTimestamp  :: !(Maybe Text)
    , _drsCertificateFingerprint :: !(Maybe Text)
    , _drsCertificate            :: !(Maybe Text)
    , _drsLabel                  :: !(Maybe Text)
    , _drsResponseStatus         :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'DescribeLunaClientResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'drsClientARN'
--
-- * 'drsLastModifiedTimestamp'
--
-- * 'drsCertificateFingerprint'
--
-- * 'drsCertificate'
--
-- * 'drsLabel'
--
-- * 'drsResponseStatus'
describeLunaClientResponse
    :: Int -- ^ 'drsResponseStatus'
    -> DescribeLunaClientResponse
describeLunaClientResponse pResponseStatus_ =
    DescribeLunaClientResponse'
    { _drsClientARN = Nothing
    , _drsLastModifiedTimestamp = Nothing
    , _drsCertificateFingerprint = Nothing
    , _drsCertificate = Nothing
    , _drsLabel = Nothing
    , _drsResponseStatus = pResponseStatus_
    }

-- | The ARN of the client.
drsClientARN :: Lens' DescribeLunaClientResponse (Maybe Text)
drsClientARN = lens _drsClientARN (\ s a -> s{_drsClientARN = a});

-- | The date and time the client was last modified.
drsLastModifiedTimestamp :: Lens' DescribeLunaClientResponse (Maybe Text)
drsLastModifiedTimestamp = lens _drsLastModifiedTimestamp (\ s a -> s{_drsLastModifiedTimestamp = a});

-- | The certificate fingerprint.
drsCertificateFingerprint :: Lens' DescribeLunaClientResponse (Maybe Text)
drsCertificateFingerprint = lens _drsCertificateFingerprint (\ s a -> s{_drsCertificateFingerprint = a});

-- | The certificate installed on the HSMs used by this client.
drsCertificate :: Lens' DescribeLunaClientResponse (Maybe Text)
drsCertificate = lens _drsCertificate (\ s a -> s{_drsCertificate = a});

-- | The label of the client.
drsLabel :: Lens' DescribeLunaClientResponse (Maybe Text)
drsLabel = lens _drsLabel (\ s a -> s{_drsLabel = a});

-- | The response status code.
drsResponseStatus :: Lens' DescribeLunaClientResponse Int
drsResponseStatus = lens _drsResponseStatus (\ s a -> s{_drsResponseStatus = a});
