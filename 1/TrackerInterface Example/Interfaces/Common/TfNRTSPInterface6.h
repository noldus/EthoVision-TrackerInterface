//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   NoldusRTSPSourceFilter6
// Module     :   NoldusRTSPSource
// File       :   TfNRTSPInterface6.h
//----------------------------------------------------------------------------
// Revisions  :
// 27-10-2022 Krizsán Péter             - Original version
//----------------------------------------------------------------------------


#ifndef TFNRTSPINTERFACE6_H
#define TFNRTSPINTERFACE6_H

#pragma once

// Filter name shown in GraphEdit tool
#define STR_FILTERNAME  L"NoldusRTSPSource\0"

// GUID for Noldus RTSP Source filter 6 - {ECFE4D57-5031-4F06-B0BE-6694B3A45C80}
static const GUID CLSID_RTSPSRC6 =
{ 0xecfe4d57, 0x5031, 0x4f06, { 0xb0, 0xbe, 0x66, 0x94, 0xb3, 0xa4, 0x5c, 0x80 } };

// GUID for the AboutBox of the RTSP Source Filter 6 - {ECFE4D57-5031-4F06-B0BE-6694B3A45C81}
static const GUID CLSID_RTSPSRCAbout6 =
{ 0xecfe4d57, 0x5031, 0x4f06, { 0xb0, 0xbe, 0x66, 0x94, 0xb3, 0xa4, 0x5c, 0x81 } };

// GUID for the Settings of the RTSP Source Filter 6 - {ECFE4D57-5031-4F06-B0BE-6694B3A45C82}
static const GUID CLSID_RTSPSRCSettings6 =
{ 0xecfe4d57, 0x5031, 0x4f06, { 0xb0, 0xbe, 0x66, 0x94, 0xb3, 0xa4, 0x5c, 0x82 } };


// IID_INoldusRTSPSource6 - {ECFE4D57-5031-4F06-B0BE-6694B3A45C83}
DEFINE_GUID(IID_INoldusRTSPSource6, 0xecfe4d57, 0x5031, 0x4f06, 0xb0, 0xbe, 0x66, 0x94, 0xb3, 0xa4, 0x5c, 0x83);

DECLARE_INTERFACE_(INoldusRTSPSource6, IUnknown)
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
    STDMETHOD_(int, GetStreamCount)                         () PURE;
    STDMETHOD_(bool, IsStreamEnabled)                       (int nStreamIdx) PURE;
    STDMETHOD_(bool, EnableStream)                          (int nStreamIdx, bool bEnable) PURE;
    STDMETHOD_(bool, EnableAllStreams)                      (bool bEnable) PURE;
};

#endif //TFNRTSPINTERFACE6_H
