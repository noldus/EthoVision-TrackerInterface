//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   NoldusRTSPSourceFilter
// Module     :   NoldusRTSPSource
// File       :   TfNRTSPInterface3.h
//----------------------------------------------------------------------------
// Revisions  :
// 11-06-2013 Krizsán Péter             - Original version
//----------------------------------------------------------------------------

#ifndef TFNRTSPINTERFACE3_H
#define TFNRTSPINTERFACE3_H

#pragma once

// Filter name shown in GraphEdit tool
#define STR_FILTERNAME  L"NoldusRTSPSource\0"

// GUID for Noldus RTSP Source filter - {5BCCF046-39A5-4F7C-A53E-E6FF16561FEE}
static const GUID CLSID_RTSPSRC3 = 
{ 0x5bccf046, 0x39a5, 0x4f7c, { 0xa5, 0x3e, 0xe6, 0xff, 0x16, 0x56, 0x1f, 0xee } };


// GUID for the AboutBox of the RTSP Source Filter - {1A52BDD7-C663-4679-9E37-1AE13A13F0B0}
static const GUID CLSID_RTSPSRCAbout = 
{ 0x1a52bdd7, 0xc663, 0x4679, { 0x9e, 0x37, 0x1a, 0xe1, 0x3a, 0x13, 0xf0, 0xb0 } };


// {BC0F8824-DD57-4C5D-8291-03822BDE254A}
DEFINE_GUID(IID_INoldusRTSPSource3, 0xbc0f8824, 0xdd57, 0x4c5d, 0x82, 0x91, 0x3, 0x82, 0x2b, 0xde, 0x25, 0x4a);


DECLARE_INTERFACE_(INoldusRTSPSource, IUnknown)
{
    STDMETHOD_(HRESULT, RequestStreamingOverTCP)			(bool bTCP) PURE;
    STDMETHOD_(HRESULT, EnableReconnect)					(bool bEnable) PURE;
    STDMETHOD_(REFERENCE_TIME, GetTimeStampFromSeiNALUnit)	(__int64 currentTime) PURE;
    STDMETHOD_(bool, IsServerConnectionLost)				() PURE;
};

#endif //TFNRTSPINTERFACE3_H
