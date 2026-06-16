//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   NoldusRTSPSourceFilter5
// Module     :   NoldusRTSPSource
// File       :   TfNRTSPInterface5.h
//----------------------------------------------------------------------------
// Revisions  :
// 05-01-2021 pkr                          - Original version
//----------------------------------------------------------------------------


#ifndef TFNRTSPINTERFACE5_H
#define TFNRTSPINTERFACE5_H

#pragma once

// Filter name shown in GraphEdit tool
#define STR_FILTERNAME  L"NoldusRTSPSource\0"

// GUID for Noldus RTSP Source filter 5 - {FAB73023-65C0-47DD-B5E1-8D1E6913D8F1}
static const GUID CLSID_RTSPSRC5 =
{ 0xfab73023, 0x65c0, 0x47dd, { 0xb5, 0xe1, 0x8d, 0x1e, 0x69, 0x13, 0xd8, 0xf1 } };

// GUID for the AboutBox of the RTSP Source Filter 5 - {FAB73023-65C0-47DD-B5E1-8D1E6913D8F2}
static const GUID CLSID_RTSPSRCAbout5 =
{ 0xfab73023, 0x65c0, 0x47dd, { 0xb5, 0xe1, 0x8d, 0x1e, 0x69, 0x13, 0xd8, 0xf2 } };

// GUID for the Settings of the RTSP Source Filter 5 - {FAB73023-65C0-47DD-B5E1-8D1E6913D8F3}
static const GUID CLSID_RTSPSRCSettings5 =
{ 0xfab73023, 0x65c0, 0x47dd, { 0xb5, 0xe1, 0x8d, 0x1e, 0x69, 0x13, 0xd8, 0xf3 } };


// IID_INoldusRTSPSource5 - {FAB73023-65C0-47DD-B5E1-8D1E6913D8F4}
DEFINE_GUID(IID_INoldusRTSPSource5, 0xfab73023, 0x65c0, 0x47dd, 0xb5, 0xe1, 0x8d, 0x1e, 0x69, 0x13, 0xd8, 0xf4);

DECLARE_INTERFACE_(INoldusRTSPSource5, IUnknown)
{
    STDMETHOD_(HRESULT, RequestStreamingOverTCP)			(bool bTCP) PURE;
    STDMETHOD_(REFERENCE_TIME, GetTimeStampFromSeiNALUnit)	(__int64 currentTime) PURE;
    STDMETHOD_(bool, IsServerConnectionLost)				() PURE;
    STDMETHOD_(void, SetOffsets)	                        (int nVideoOffsetMs, int nAudioOffsetMs) PURE;
    STDMETHOD_(int, GetVideoOffset)                         () PURE;
    STDMETHOD_(int, GetAudioOffset)	                        () PURE;
    STDMETHOD_(void, SetTimeStampMode)                      (int nMode) PURE;
    STDMETHOD_(int, GetTimeStampMode)                       () PURE;
    STDMETHOD_(void, SetWaitForIFrameOnStart)               (bool bWaitForIFrameOnStart) PURE;
    STDMETHOD_(bool, GetWaitForIFrameOnStart)               () PURE;
};

#endif //TFNRTSPINTERFACE5_H
