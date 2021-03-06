{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-orphans        #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Test.AWS.Gen.ImportExport
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
module Test.AWS.Gen.ImportExport where

import Data.Proxy
import Test.AWS.Fixture
import Test.AWS.Prelude
import Test.Tasty
import Network.AWS.ImportExport
import Test.AWS.ImportExport.Internal

-- Auto-generated: the actual test selection needs to be manually placed into
-- the top-level so that real test data can be incrementally added.
--
-- This commented snippet is what the entire set should look like:

-- fixtures :: TestTree
-- fixtures =
--     [ testGroup "request"
--         [ testGetShippingLabel $
--             getShippingLabel
--
--         , testCreateJob $
--             createJob
--
--         , testListJobs $
--             listJobs
--
--         , testUpdateJob $
--             updateJob
--
--         , testGetStatus $
--             getStatus
--
--         , testCancelJob $
--             cancelJob
--
--           ]

--     , testGroup "response"
--         [ testGetShippingLabelResponse $
--             getShippingLabelResponse
--
--         , testCreateJobResponse $
--             createJobResponse
--
--         , testListJobsResponse $
--             listJobsResponse
--
--         , testUpdateJobResponse $
--             updateJobResponse
--
--         , testGetStatusResponse $
--             getStatusResponse
--
--         , testCancelJobResponse $
--             cancelJobResponse
--
--           ]
--     ]

-- Requests

testGetShippingLabel :: GetShippingLabel -> TestTree
testGetShippingLabel = req
    "GetShippingLabel"
    "fixture/GetShippingLabel.yaml"

testCreateJob :: CreateJob -> TestTree
testCreateJob = req
    "CreateJob"
    "fixture/CreateJob.yaml"

testListJobs :: ListJobs -> TestTree
testListJobs = req
    "ListJobs"
    "fixture/ListJobs.yaml"

testUpdateJob :: UpdateJob -> TestTree
testUpdateJob = req
    "UpdateJob"
    "fixture/UpdateJob.yaml"

testGetStatus :: GetStatus -> TestTree
testGetStatus = req
    "GetStatus"
    "fixture/GetStatus.yaml"

testCancelJob :: CancelJob -> TestTree
testCancelJob = req
    "CancelJob"
    "fixture/CancelJob.yaml"

-- Responses

testGetShippingLabelResponse :: GetShippingLabelResponse -> TestTree
testGetShippingLabelResponse = res
    "GetShippingLabelResponse"
    "fixture/GetShippingLabelResponse.proto"
    importExport
    (Proxy :: Proxy GetShippingLabel)

testCreateJobResponse :: CreateJobResponse -> TestTree
testCreateJobResponse = res
    "CreateJobResponse"
    "fixture/CreateJobResponse.proto"
    importExport
    (Proxy :: Proxy CreateJob)

testListJobsResponse :: ListJobsResponse -> TestTree
testListJobsResponse = res
    "ListJobsResponse"
    "fixture/ListJobsResponse.proto"
    importExport
    (Proxy :: Proxy ListJobs)

testUpdateJobResponse :: UpdateJobResponse -> TestTree
testUpdateJobResponse = res
    "UpdateJobResponse"
    "fixture/UpdateJobResponse.proto"
    importExport
    (Proxy :: Proxy UpdateJob)

testGetStatusResponse :: GetStatusResponse -> TestTree
testGetStatusResponse = res
    "GetStatusResponse"
    "fixture/GetStatusResponse.proto"
    importExport
    (Proxy :: Proxy GetStatus)

testCancelJobResponse :: CancelJobResponse -> TestTree
testCancelJobResponse = res
    "CancelJobResponse"
    "fixture/CancelJobResponse.proto"
    importExport
    (Proxy :: Proxy CancelJob)
