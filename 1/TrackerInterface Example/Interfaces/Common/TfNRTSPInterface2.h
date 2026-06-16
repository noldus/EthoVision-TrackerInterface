//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   NoldusRTSPSourceFilter
// Module     :   NoldusRTSPSource
// File       :   TfNRTSPInterface2.h
//----------------------------------------------------------------------------
// Revisions  :
// 11-06-2013 Krizsán Péter             - Original version
//----------------------------------------------------------------------------

#ifndef TFNRTSPINTERFACE2_H
#define TFNRTSPINTERFACE2_H

#pragma once

// Filter name shown in GraphEdit tool
#define STR_FILTERNAME  L"NoldusRTSPSource\0"

// GUID for Noldus RTSP Source filter - {53DF9B85-AA53-4CB0-B418-70A9436FE53E}
static const GUID CLSID_RTSPSRC2 = 
{ 0x53df9b85, 0xaa53, 0x4cb0, { 0xb4, 0x18, 0x70, 0xa9, 0x43, 0x6f, 0xe5, 0x3e } };

// GUID for the AboutBox of the RTSP Source Filter - {421F2732-D859-4D9E-8E3B-EA79BC3CC17F}
static const GUID CLSID_RTSPSRCAbout = 
{ 0x421f2732, 0xd859, 0x4d9e, { 0x8e, 0x3b, 0xea, 0x79, 0xbc, 0x3c, 0xc1, 0x7f } };


// {4B253EC7-2D70-4414-B8D8-6F03D2C76663}
DEFINE_GUID(IID_INoldusRTSPSource2, 0x4b253ec7, 0x2d70, 0x4414, 0xb8, 0xd8, 0x6f, 0x3, 0xd2, 0xc7, 0x66, 0x63);

DECLARE_INTERFACE_(INoldusRTSPSource, IUnknown)
{
    STDMETHOD_(HRESULT, RequestStreamingOverTCP)			(bool bTCP) PURE;
    STDMETHOD_(HRESULT, EnableReconnect)					(bool bEnable) PURE;
};

#endif //TFNRTSPINTERFACE2_H
