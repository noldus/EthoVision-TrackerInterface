//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   NoldusRTSPStreamFilter
// Module     :   NoldusRTSPStream
// File       :   TfNRTSPStreamInterface2.h
//----------------------------------------------------------------------------
// Revisions  :
// 23-03-2016 Krizsán Péter             - Original version
//----------------------------------------------------------------------------
#ifndef TFNRTSPSTREAMINTERFACE2_H
#define TFNRTSPSTREAMINTERFACE2_H

#pragma once

// Filter name shown in GraphEdit tool
#define STR_RTSPSTREAMFILTERNAME  L"NoldusRtspStream\0"

// GUID for Noldus RTSP Stream filter - {FDA04D65-1F83-4DE5-AA96-85A4FA784FE0}
static const GUID CLSID_RTSP_STREAM =
{ 0xfda04d65, 0x1f83, 0x4de5, { 0xaa, 0x96, 0x85, 0xa4, 0xfa, 0x78, 0x4f, 0xe0 } };

// About page - {FDA04D65-1F83-4DE5-AA96-85A4FA784FE1}
static const GUID CLSID_RTSPStreamAboutPage =
{ 0xfda04d65, 0x1f83, 0x4de5, { 0xaa, 0x96, 0x85, 0xa4, 0xfa, 0x78, 0x4f, 0xe1 } };

// Property page - {FDA04D65-1F83-4DE5-AA96-85A4FA784FE2}
static const GUID CLSID_RTSP_PROP_PAGE = 
{ 0xfda04d65, 0x1f83, 0x4de5, { 0xaa, 0x96, 0x85, 0xa4, 0xfa, 0x78, 0x4f, 0xe2 } };

// INoldusRtspStream interface - {FDA04D65-1F83-4DE5-AA96-85A4FA784FE3}
static const GUID IID_INoldusRtspStream =
{ 0xfda04d65, 0x1f83, 0x4de5, { 0xaa, 0x96, 0x85, 0xa4, 0xfa, 0x78, 0x4f, 0xe3 } };


DECLARE_INTERFACE_(INoldusRtspStream, IUnknown)
{
    STDMETHOD(GetIP)(char** pstrIP) PURE;
    STDMETHOD(GetPath)(char** pstrStreamPath) PURE;
    STDMETHOD(GetPort)(USHORT* nPort) PURE;
    STDMETHOD(GetUserAuthentication)(char** szUser, char** szPassword) PURE;
    STDMETHOD(SetPort)(USHORT nPort) PURE;
    STDMETHOD(SetUserAuthentication)(const char* szUser, const char* szPassword) PURE;
};

#endif //TFNRTSPSTREAMINTERFACE2_H
