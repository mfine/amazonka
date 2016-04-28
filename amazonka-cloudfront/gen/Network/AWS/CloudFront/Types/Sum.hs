{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE LambdaCase         #-}
{-# LANGUAGE OverloadedStrings  #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.CloudFront.Types.Sum
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
module Network.AWS.CloudFront.Types.Sum where

import           Network.AWS.Prelude

data CertificateSource
    = Acm
    | Cloudfront
    | IAM
    deriving (Eq,Ord,Read,Show,Enum,Bounded,Data,Typeable,Generic)

instance FromText CertificateSource where
    parser = takeLowerText >>= \case
        "acm" -> pure Acm
        "cloudfront" -> pure Cloudfront
        "iam" -> pure IAM
        e -> fromTextError $ "Failure parsing CertificateSource from value: '" <> e
           <> "'. Accepted values: acm, cloudfront, iam"

instance ToText CertificateSource where
    toText = \case
        Acm -> "acm"
        Cloudfront -> "cloudfront"
        IAM -> "iam"

instance Hashable     CertificateSource
instance NFData       CertificateSource
instance ToByteString CertificateSource
instance ToQuery      CertificateSource
instance ToHeader     CertificateSource

instance FromXML CertificateSource where
    parseXML = parseXMLText "CertificateSource"

instance ToXML CertificateSource where
    toXML = toXMLText

data GeoRestrictionType
    = Blacklist
    | None
    | Whitelist
    deriving (Eq,Ord,Read,Show,Enum,Bounded,Data,Typeable,Generic)

instance FromText GeoRestrictionType where
    parser = takeLowerText >>= \case
        "blacklist" -> pure Blacklist
        "none" -> pure None
        "whitelist" -> pure Whitelist
        e -> fromTextError $ "Failure parsing GeoRestrictionType from value: '" <> e
           <> "'. Accepted values: blacklist, none, whitelist"

instance ToText GeoRestrictionType where
    toText = \case
        Blacklist -> "blacklist"
        None -> "none"
        Whitelist -> "whitelist"

instance Hashable     GeoRestrictionType
instance NFData       GeoRestrictionType
instance ToByteString GeoRestrictionType
instance ToQuery      GeoRestrictionType
instance ToHeader     GeoRestrictionType

instance FromXML GeoRestrictionType where
    parseXML = parseXMLText "GeoRestrictionType"

instance ToXML GeoRestrictionType where
    toXML = toXMLText

data ItemSelection
    = ISAll
    | ISNone
    | ISWhitelist
    deriving (Eq,Ord,Read,Show,Enum,Bounded,Data,Typeable,Generic)

instance FromText ItemSelection where
    parser = takeLowerText >>= \case
        "all" -> pure ISAll
        "none" -> pure ISNone
        "whitelist" -> pure ISWhitelist
        e -> fromTextError $ "Failure parsing ItemSelection from value: '" <> e
           <> "'. Accepted values: all, none, whitelist"

instance ToText ItemSelection where
    toText = \case
        ISAll -> "all"
        ISNone -> "none"
        ISWhitelist -> "whitelist"

instance Hashable     ItemSelection
instance NFData       ItemSelection
instance ToByteString ItemSelection
instance ToQuery      ItemSelection
instance ToHeader     ItemSelection

instance FromXML ItemSelection where
    parseXML = parseXMLText "ItemSelection"

instance ToXML ItemSelection where
    toXML = toXMLText

data Method
    = Delete
    | Get
    | Head
    | Options
    | Patch
    | Post
    | Put
    deriving (Eq,Ord,Read,Show,Enum,Bounded,Data,Typeable,Generic)

instance FromText Method where
    parser = takeLowerText >>= \case
        "delete" -> pure Delete
        "get" -> pure Get
        "head" -> pure Head
        "options" -> pure Options
        "patch" -> pure Patch
        "post" -> pure Post
        "put" -> pure Put
        e -> fromTextError $ "Failure parsing Method from value: '" <> e
           <> "'. Accepted values: DELETE, GET, HEAD, OPTIONS, PATCH, POST, PUT"

instance ToText Method where
    toText = \case
        Delete -> "DELETE"
        Get -> "GET"
        Head -> "HEAD"
        Options -> "OPTIONS"
        Patch -> "PATCH"
        Post -> "POST"
        Put -> "PUT"

instance Hashable     Method
instance NFData       Method
instance ToByteString Method
instance ToQuery      Method
instance ToHeader     Method

instance FromXML Method where
    parseXML = parseXMLText "Method"

instance ToXML Method where
    toXML = toXMLText

data MinimumProtocolVersion
    = MPVSSLV3
    | MPVTLSV1
    deriving (Eq,Ord,Read,Show,Enum,Bounded,Data,Typeable,Generic)

instance FromText MinimumProtocolVersion where
    parser = takeLowerText >>= \case
        "sslv3" -> pure MPVSSLV3
        "tlsv1" -> pure MPVTLSV1
        e -> fromTextError $ "Failure parsing MinimumProtocolVersion from value: '" <> e
           <> "'. Accepted values: SSLv3, TLSv1"

instance ToText MinimumProtocolVersion where
    toText = \case
        MPVSSLV3 -> "SSLv3"
        MPVTLSV1 -> "TLSv1"

instance Hashable     MinimumProtocolVersion
instance NFData       MinimumProtocolVersion
instance ToByteString MinimumProtocolVersion
instance ToQuery      MinimumProtocolVersion
instance ToHeader     MinimumProtocolVersion

instance FromXML MinimumProtocolVersion where
    parseXML = parseXMLText "MinimumProtocolVersion"

instance ToXML MinimumProtocolVersion where
    toXML = toXMLText

data OriginProtocolPolicy
    = HTTPOnly
    | HTTPSOnly
    | MatchViewer
    deriving (Eq,Ord,Read,Show,Enum,Bounded,Data,Typeable,Generic)

instance FromText OriginProtocolPolicy where
    parser = takeLowerText >>= \case
        "http-only" -> pure HTTPOnly
        "https-only" -> pure HTTPSOnly
        "match-viewer" -> pure MatchViewer
        e -> fromTextError $ "Failure parsing OriginProtocolPolicy from value: '" <> e
           <> "'. Accepted values: http-only, https-only, match-viewer"

instance ToText OriginProtocolPolicy where
    toText = \case
        HTTPOnly -> "http-only"
        HTTPSOnly -> "https-only"
        MatchViewer -> "match-viewer"

instance Hashable     OriginProtocolPolicy
instance NFData       OriginProtocolPolicy
instance ToByteString OriginProtocolPolicy
instance ToQuery      OriginProtocolPolicy
instance ToHeader     OriginProtocolPolicy

instance FromXML OriginProtocolPolicy where
    parseXML = parseXMLText "OriginProtocolPolicy"

instance ToXML OriginProtocolPolicy where
    toXML = toXMLText

data PriceClass
    = PriceClass100
    | PriceClass200
    | PriceClassAll
    deriving (Eq,Ord,Read,Show,Enum,Bounded,Data,Typeable,Generic)

instance FromText PriceClass where
    parser = takeLowerText >>= \case
        "priceclass_100" -> pure PriceClass100
        "priceclass_200" -> pure PriceClass200
        "priceclass_all" -> pure PriceClassAll
        e -> fromTextError $ "Failure parsing PriceClass from value: '" <> e
           <> "'. Accepted values: PriceClass_100, PriceClass_200, PriceClass_All"

instance ToText PriceClass where
    toText = \case
        PriceClass100 -> "PriceClass_100"
        PriceClass200 -> "PriceClass_200"
        PriceClassAll -> "PriceClass_All"

instance Hashable     PriceClass
instance NFData       PriceClass
instance ToByteString PriceClass
instance ToQuery      PriceClass
instance ToHeader     PriceClass

instance FromXML PriceClass where
    parseXML = parseXMLText "PriceClass"

instance ToXML PriceClass where
    toXML = toXMLText

data SSLProtocol
    = SSLV3
    | TLSV1
    | TLSV1_1
    | TLSV1_2
    deriving (Eq,Ord,Read,Show,Enum,Bounded,Data,Typeable,Generic)

instance FromText SSLProtocol where
    parser = takeLowerText >>= \case
        "sslv3" -> pure SSLV3
        "tlsv1" -> pure TLSV1
        "tlsv1.1" -> pure TLSV1_1
        "tlsv1.2" -> pure TLSV1_2
        e -> fromTextError $ "Failure parsing SSLProtocol from value: '" <> e
           <> "'. Accepted values: SSLv3, TLSv1, TLSv1.1, TLSv1.2"

instance ToText SSLProtocol where
    toText = \case
        SSLV3 -> "SSLv3"
        TLSV1 -> "TLSv1"
        TLSV1_1 -> "TLSv1.1"
        TLSV1_2 -> "TLSv1.2"

instance Hashable     SSLProtocol
instance NFData       SSLProtocol
instance ToByteString SSLProtocol
instance ToQuery      SSLProtocol
instance ToHeader     SSLProtocol

instance FromXML SSLProtocol where
    parseXML = parseXMLText "SSLProtocol"

instance ToXML SSLProtocol where
    toXML = toXMLText

data SSLSupportMethod
    = SNIOnly
    | VIP
    deriving (Eq,Ord,Read,Show,Enum,Bounded,Data,Typeable,Generic)

instance FromText SSLSupportMethod where
    parser = takeLowerText >>= \case
        "sni-only" -> pure SNIOnly
        "vip" -> pure VIP
        e -> fromTextError $ "Failure parsing SSLSupportMethod from value: '" <> e
           <> "'. Accepted values: sni-only, vip"

instance ToText SSLSupportMethod where
    toText = \case
        SNIOnly -> "sni-only"
        VIP -> "vip"

instance Hashable     SSLSupportMethod
instance NFData       SSLSupportMethod
instance ToByteString SSLSupportMethod
instance ToQuery      SSLSupportMethod
instance ToHeader     SSLSupportMethod

instance FromXML SSLSupportMethod where
    parseXML = parseXMLText "SSLSupportMethod"

instance ToXML SSLSupportMethod where
    toXML = toXMLText

data ViewerProtocolPolicy
    = VPPAllowAll
    | VPPHTTPSOnly
    | VPPRedirectToHTTPS
    deriving (Eq,Ord,Read,Show,Enum,Bounded,Data,Typeable,Generic)

instance FromText ViewerProtocolPolicy where
    parser = takeLowerText >>= \case
        "allow-all" -> pure VPPAllowAll
        "https-only" -> pure VPPHTTPSOnly
        "redirect-to-https" -> pure VPPRedirectToHTTPS
        e -> fromTextError $ "Failure parsing ViewerProtocolPolicy from value: '" <> e
           <> "'. Accepted values: allow-all, https-only, redirect-to-https"

instance ToText ViewerProtocolPolicy where
    toText = \case
        VPPAllowAll -> "allow-all"
        VPPHTTPSOnly -> "https-only"
        VPPRedirectToHTTPS -> "redirect-to-https"

instance Hashable     ViewerProtocolPolicy
instance NFData       ViewerProtocolPolicy
instance ToByteString ViewerProtocolPolicy
instance ToQuery      ViewerProtocolPolicy
instance ToHeader     ViewerProtocolPolicy

instance FromXML ViewerProtocolPolicy where
    parseXML = parseXMLText "ViewerProtocolPolicy"

instance ToXML ViewerProtocolPolicy where
    toXML = toXMLText
