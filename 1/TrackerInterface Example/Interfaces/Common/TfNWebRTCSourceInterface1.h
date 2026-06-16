//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   NoldusWebRTCSourceFilter
// Module     :   NoldusWebRTCSource
// File       :   TfNWebRTCSourceInterface1.h
//----------------------------------------------------------------------------
// Revisions  :
// 17-12-2019     Las                    - Original version
//----------------------------------------------------------------------------
#ifndef TFNWEBRTCSOURCEINTERFACE1_H
#define TFNWEBRTCSOURCEINTERFACE1_H
#pragma once


// GUID for Noldus WebRTC Source filter - {5B7E0971-DDCB-4912-AAB7-D761429CDED7}
static const GUID CLSID_WEBRTCSRC1 =
{ 0x5b7e0971, 0xddcb, 0x4912, { 0xaa, 0xb7, 0xd7, 0x61, 0x42, 0x9c, 0xde, 0xd7 } };

// GUID for the AboutBox of the WebRTC Source Filter - {EA6C3C3E-D467-4EE1-9B3D-C1E7533A0888}
static const GUID CLSID_WEBRTCSRCAbout1 =
{ 0xea6c3c3e, 0xd467, 0x4ee1, { 0x9b, 0x3d, 0xc1, 0xe7, 0x53, 0x3a, 0x8, 0x88 } };

// GUID for the Settings of the WebRTC Source Filter - {2AB5F7B9-B6ED-4EC8-8979-FEBA0C3E4420}
static const GUID CLSID_WEBRTCSRCSettings1 =
{ 0x2ab5f7b9, 0xb6ed, 0x4ec8, { 0x89, 0x79, 0xfe, 0xba, 0xc, 0x3e, 0x44, 0x20 } };

namespace NoldusWebRTCInterface
{
    typedef std::function<void(const char*)> MessageCallback;
}

// GUID for WebRTC Interface - {6810A2E9-4F38-4C2C-9335-9AD3947E659E}
DEFINE_GUID(IID_INoldusWebRTCSource1, 0x6810a2e9, 0x4f38, 0x4c2c, 0x93, 0x35, 0x9a, 0xd3, 0x94, 0x7e, 0x65, 0x9e);

DECLARE_INTERFACE_(INoldusWebRTCSource1, IUnknown)
{
    STDMETHOD_(HRESULT, SendMessage)                (const char* cpMessage) PURE;
    STDMETHOD_(void, SetWebRTCMessageCallback)      (NoldusWebRTCInterface::MessageCallback callback) PURE;
    STDMETHOD_(void, SetFilterMessageCallback)      (NoldusWebRTCInterface::MessageCallback callback) PURE;
    STDMETHOD_(const GUID&, GetWebRTCVideoFormat)   () const PURE;
    STDMETHOD_(void, SetWebRTCVideoFormat)          (const GUID& crguidVideoFormat) PURE;
};

#endif //TFNWEBRTCSOURCEINTERFACE1_H