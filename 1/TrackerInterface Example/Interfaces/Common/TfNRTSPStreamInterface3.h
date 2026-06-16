//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   Common
// Module     :   NoldusRTSPStream
// File       :   TfNRTSPStreamInterface3.h
//----------------------------------------------------------------------------
// Revisions  :
// 19-04-2018 Tijmen van Voorthuijsen - Original version
//----------------------------------------------------------------------------
#ifndef TFNRTSPSTREAMINTERFACE3_H
#define TFNRTSPSTREAMINTERFACE3_H

#pragma once

// Filter name shown in GraphEdit tool
#define STR_RTSPSTREAMFILTERNAME  L"NoldusRtspStream\0"

// GUID for Noldus RTSP Stream filter - {F2B416C5-DDCB-4445-9D77-8E2B256DDAC8}
static const GUID CLSID_RTSP_STREAM3 =
{ 0xf2b416c5, 0xddcb, 0x4445,{ 0x9d, 0x77, 0x8e, 0x2b, 0x25, 0x6d, 0xda, 0xc8 } };

// About page - {1F62D0C9-4B92-4881-989A-476816409176}
static const GUID CLSID_RTSPStreamAboutPage3 =
{ 0x1f62d0c9, 0x4b92, 0x4881,{ 0x98, 0x9a, 0x47, 0x68, 0x16, 0x40, 0x91, 0x76 } };

// Property page - {29EA4D8F-6864-4858-B33A-8B979837D22C}
static const GUID CLSID_RTSP_PROP_PAGE3 =
{ 0x29ea4d8f, 0x6864, 0x4858,{ 0xb3, 0x3a, 0x8b, 0x97, 0x98, 0x37, 0xd2, 0x2c } };


// INoldusRtspStream3 interface - {2FD8840B-281D-4DA8-A804-57BC94F731DE}
DEFINE_GUID(IID_INoldusRtspStream3, 0x2fd8840b, 0x281d, 0x4da8, 0xa8, 0x4, 0x57, 0xbc, 0x94, 0xf7, 0x31, 0xde);


DECLARE_INTERFACE_(INoldusRtspStream3, IUnknown)
{
    // Returns the current IP address of the stream server. Available only after the stream server started.
    STDMETHOD(GetIP)(char** pstrIP) PURE;

    // Returns the stream path without ip and port, like "/VideoStream"
    // Full rtsp path can be built like "rtsp://" + username + ":" + password + "@" + ipaddress + ":" + port + this path
    // Default full path: rtsp://a:a@localhost:8554/VideoStream
    STDMETHOD(GetPath)(char** pstrStreamPath) PURE;

    // Returns the port of the stream server that the user set, if it's not set it will be 8554.
    STDMETHOD(GetPort)(USHORT* nPort) PURE;

    // Returns username and password that the user set, if it's not set it will be user="a" and password="a".
    STDMETHOD(GetUserAuthentication)(char** szUser, char** szPassword) PURE;
    
    // Set port of the stream server. 
    // It will take effect only after the streaming starts/restarts, it's not possible to change port of running stream server.
    STDMETHOD(SetPort)(USHORT nPort) PURE;

    // Set username and password
    // It will take effect only after the streaming starts/restarts, it's not possible to change username/password of running stream server.
    STDMETHOD(SetUserAuthentication)(const char* szUser, const char* szPassword) PURE;

    // Set IP address to select the proper network adapter
    STDMETHOD(SelectNetworkAdapterByIp)(const char* pstrIP) PURE;
};

#endif //TFNRTSPSTREAMINTERFACE3_H
