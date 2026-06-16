//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   NoldusRTSPSourceFilter4
// Module     :   NoldusRTSPSource
// File       :   TfNRTSPInterface4.h
//----------------------------------------------------------------------------
// Revisions  :
// 12-05-2017 adr                          - Original version
//----------------------------------------------------------------------------


#ifndef TFNRTSPINTERFACE4_H
#define TFNRTSPINTERFACE4_H

#pragma once

// Filter name shown in GraphEdit tool
#define STR_FILTERNAME  L"NoldusRTSPSource\0"

// GUID for Noldus RTSP Source filter - {7749D2C6-FA19-46E4-A093-E7FE3D68A049}
static const GUID CLSID_RTSPSRC4 =
{ 0x7749d2c6, 0xfa19, 0x46e4, { 0xa0, 0x93, 0xe7, 0xfe, 0x3d, 0x68, 0xa0, 0x49 } };

// GUID for the AboutBox of the RTSP Source Filter - {F99797A1-F0DC-4DBF-913D-BEF1BB45761A}
static const GUID CLSID_RTSPSRCAbout4 =
{ 0xf99797a1, 0xf0dc, 0x4dbf, { 0x91, 0x3d, 0xbe, 0xf1, 0xbb, 0x45, 0x76, 0x1a } };

// GUID for the Settings of the RTSP Source Filter - {00B6CD92-D327-4CAD-95FB-2E6199C9E2A3}
static const GUID CLSID_RTSPSRCSettings4 =
{ 0xb6cd92, 0xd327, 0x4cad, { 0x95, 0xfb, 0x2e, 0x61, 0x99, 0xc9, 0xe2, 0xa3 } };


// {00B6CD92-D327-4CAD-95FB-2E6199C9E2A3}
DEFINE_GUID(IID_INoldusRTSPSource4, 0xb6cd92, 0xd327, 0x4cad, 0x95, 0xfb, 0x2e, 0x61, 0x99, 0xc9, 0xe2, 0xa3);

DECLARE_INTERFACE_(INoldusRTSPSource4, IUnknown)
{
    STDMETHOD_(HRESULT, RequestStreamingOverTCP)			(bool bTCP) PURE;
    STDMETHOD_(REFERENCE_TIME, GetTimeStampFromSeiNALUnit)	(__int64 currentTime) PURE;
    STDMETHOD_(bool, IsServerConnectionLost)				() PURE;
    STDMETHOD_(void, SetOffsets)	                        (int nVideoOffsetMs, int nAudioOffsetMs) PURE;
    STDMETHOD_(int, GetVideoOffset)                         () PURE;
    STDMETHOD_(int, GetAudioOffset)	                        () PURE;
    STDMETHOD_(void, SetTimeStampMode)                      (int nMode) PURE;
    STDMETHOD_(int, GetTimeStampMode)                       () PURE;
};

#endif //TFNRTSPINTERFACE3_H
