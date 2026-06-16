//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   NoldusRTSPSourceFilter
// Module     :   NoldusRTSPSource
// File       :   TfNRTSPInterface1.h
//----------------------------------------------------------------------------
// Revisions  :
// 11-06-2013 Krizsán Péter             - Original version
//----------------------------------------------------------------------------

#ifndef TFNRTSPINTERFACE1_H
#define TFNRTSPINTERFACE1_H

#pragma once

// Filter name shown in GraphEdit tool
#define STR_FILTERNAME  L"NoldusRTSPSource\0"

// GUID for Noldus RTSP Source filter - {9062E444-461F-4C82-B6A1-56A52FE4F9A7}
static const GUID CLSID_RTSPSRC = 
{ 0x9062e444, 0x461f, 0x4c82, { 0xb6, 0xa1, 0x56, 0xa5, 0x2f, 0xe4, 0xf9, 0xa7 } };

// GUID for the AboutBox of the RTSP Source Filter - {9062E444-461F-4C82-B6A1-56A52FE4F9A8}
static const GUID CLSID_RTSPSRCAbout = 
{ 0x9062e444, 0x461f, 0x4c82, { 0xb6, 0xa1, 0x56, 0xa5, 0x2f, 0xe4, 0xf9, 0xa8 } };

// {F15F875E-2E56-4068-BA79-1D8C056D158C}
DEFINE_GUID(IID_INoldusRTSPSource, 0xf15f875e, 0x2e56, 0x4068, 0xba, 0x79, 0x1d, 0x8c, 0x5, 0x6d, 0x15, 0x8c);

// 7634706D-0000-0010-8000-00AA00389B71
DEFINE_GUID(MEDIASUBTYPE_mp4v, 0x7634706D, 0x0000, 0x0010, 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71);


DECLARE_INTERFACE_(INoldusRTSPSource, IUnknown)
{
    STDMETHOD(RequestStreamingOverTCP)(bool bTCP) PURE;
};

#endif //TFNRTSPINTERFACE1_H
