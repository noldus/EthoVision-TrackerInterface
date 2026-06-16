//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   Common
// Module     :   NoldusRTSPStream
// File       :   TfNRTSPStreamInterface1.h
//----------------------------------------------------------------------------
// Revisions  :
// 18-11-2013 Adrian Kovacs             - Original version
//----------------------------------------------------------------------------


#ifndef TFNRTSPSTREAMINTERFACE1_H
#define TFNRTSPSTREAMINTERFACE1_H

#pragma once

// Filter name shown in GraphEdit tool
#define STR_FILTERNAME  L"NoldusRtspStream\0"

// GUID for  Noldus RTSP Stream filter - {B363004E-0200-46E3-A040-C707E949C729}
static const GUID CLSID_RTSP_STREAM = 
{ 0xb363004e, 0x200, 0x46e3, { 0xa0, 0x40, 0xc7, 0x7, 0xe9, 0x49, 0xc7, 0x29 } };


// Property page - {767BAAA2-992D-40A9-B142-8B9F457C2D1D}
static const GUID CLSID_RTSP_PROP_PAGE = 
{ 0x767baaa2, 0x992d, 0x40a9, { 0xb1, 0x42, 0x8b, 0x9f, 0x45, 0x7c, 0x2d, 0x1d } };


// {8BBE1921-56E4-40CC-B61C-822578EBD2F0}
DEFINE_GUID(IID_INoldusRtspStream, 0x8bbe1921, 0x56e4, 0x40cc, 0xb6, 0x1c, 0x82, 0x25, 0x78, 0xeb, 0xd2, 0xf0);


DECLARE_INTERFACE_(INoldusRtspStream, IUnknown)
{
    STDMETHOD(GetIP)(char** pstrIP) PURE;
    STDMETHOD(GetPath)(char** pstrStreamPath) PURE;
    STDMETHOD(GetPort)(USHORT* nPort) PURE;
    STDMETHOD(GetUserAuthentication)(char** szUser, char** szPassword) PURE;
    STDMETHOD(SetPort)(USHORT nPort) PURE;
    STDMETHOD(SetUserAuthentication)(const char* szUser, const char* szPassword) PURE;
};

#endif //TFNRTSPSTREAMINTERFACE1_H
