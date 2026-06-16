//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   NoldusWebRTCStreamFilter
// Module     :   NoldusWebRTCStream
// File       :   TfNWebRTCStreamInterface1.h
//----------------------------------------------------------------------------
// Revisions  :
// 14-08-2019 Krizsán Péter             - Original version
//----------------------------------------------------------------------------
#ifndef TFNWEBRTCSTREAMINTERFACE1_H
#define TFNWEBRTCSTREAMINTERFACE1_H

#pragma once

// Filter name shown in GraphEdit tool
#define STR_WEBRTCSTREAMFILTERNAME  L"NoldusWebRTCStream\0"

// GUID for Noldus WebRTC Stream filter - {B134839C-352E-481B-A181-AC5BD6AF33A8}
static const GUID CLSID_WEBRTC_STREAM1 =
{ 0xb134839c, 0x352e, 0x481b,{ 0xa1, 0x81, 0xac, 0x5b, 0xd6, 0xaf, 0x33, 0xa8 } };

// About page - {7C9C2BA4-9C98-4B0A-A41F-0CB3C38451C6}
static const GUID CLSID_WEBRTCStreamAboutPage1 =
{ 0x7c9c2ba4, 0x9c98, 0x4b0a,{ 0xa4, 0x1f, 0xc, 0xb3, 0xc3, 0x84, 0x51, 0xc6 } };

// INoldusWebRTCStream1 interface - {CA36076E-4B2B-415C-B6DF-DF990CD99690}
DEFINE_GUID(IID_INoldusWebRTCStream1, 0xca36076e, 0x4b2b, 0x415c, 0xb6, 0xdf, 0xdf, 0x99, 0xc, 0xd9, 0x96, 0x90);


// INoldusWebRTCStream1 interface declaration
DECLARE_INTERFACE_(INoldusWebRTCStream1, IUnknown)
{
    // Returns the port of the stream server that the user set, if it's not set it will be 8554.
    STDMETHOD(GetWebRTCPort)(USHORT* nPort) PURE;

    // Set port of the stream server.
    STDMETHOD(SetWebRTCPort)(USHORT nPort) PURE;
};

#endif //TFNWEBRTCSTREAMINTERFACE1_H
