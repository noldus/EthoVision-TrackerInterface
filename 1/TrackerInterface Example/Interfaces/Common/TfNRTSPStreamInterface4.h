//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   Common
// Module     :   NoldusRTSPStream
// File       :   TfNRTSPStreamInterface4.h
//----------------------------------------------------------------------------
// Revisions  :
// 08-08-2022 Krizsán Péter             - Original version
//----------------------------------------------------------------------------
#ifndef TFNRTSPSTREAMINTERFACE4_H
#define TFNRTSPSTREAMINTERFACE4_H

#pragma once

// Filter name shown in GraphEdit tool
#define STR_RTSPSTREAMFILTERNAME  L"NoldusRtspStream\0"

// GUID for Noldus RTSP Stream filter - {A734EE74-41B7-4A04-A950-638CBD905589}
static const GUID CLSID_RTSP_STREAM4 = 
{ 0xa734ee74, 0x41b7, 0x4a04, { 0xa9, 0x50, 0x63, 0x8c, 0xbd, 0x90, 0x55, 0x89 } };

// About page - {A734EE74-41B7-4A04-A950-638CBD905590}
static const GUID CLSID_RTSPStreamAboutPage4 =
{ 0xa734ee74, 0x41b7, 0x4a04, { 0xa9, 0x50, 0x63, 0x8c, 0xbd, 0x90, 0x55, 0x90 } };

// Property page - {A734EE74-41B7-4A04-A950-638CBD905591}
static const GUID CLSID_RTSP_PROP_PAGE4 =
{ 0xa734ee74, 0x41b7, 0x4a04, { 0xa9, 0x50, 0x63, 0x8c, 0xbd, 0x90, 0x55, 0x91 } };

// INoldusRtspStream4 interface - {A734EE74-41B7-4A04-A950-638CBD905592}
DEFINE_GUID(IID_INoldusRtspStream4, 0xa734ee74, 0x41b7, 0x4a04, 0xa9, 0x50, 0x63, 0x8c, 0xbd, 0x90, 0x55, 0x92);


DECLARE_INTERFACE_(INoldusRtspStream4, IUnknown)
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
	
	// Get Multicast destination address
	STDMETHOD(GetMulticastAddress)(char** pstrMulticastAddress) PURE;
    
    // Set port of the stream server. 
    // It will take effect only after the streaming starts/restarts, it's not possible to change port of running stream server.
    STDMETHOD(SetPort)(USHORT nPort) PURE;

    // Set username and password
    // It will take effect only after the streaming starts/restarts, it's not possible to change username/password of running stream server.
    STDMETHOD(SetUserAuthentication)(const char* szUser, const char* szPassword) PURE;

    // Set IP address to select the proper network adapter
    STDMETHOD(SelectNetworkAdapterByIp)(const char* pstrIP) PURE;
	
	// Set Multicast destination address
	STDMETHOD(SetMulticastAddress)(const char* pstrMulticastAddress) PURE;
};

#endif //TFNRTSPSTREAMINTERFACE4_H
