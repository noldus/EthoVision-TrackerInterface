//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   NoldusTeeFilter
// Module     :   NoldusTeeFilter
// File       :   TfNTeeInterface1.h
//----------------------------------------------------------------------------
// Revisions  :
// 12-05-2014 Krizsán Péter             - Original version
//----------------------------------------------------------------------------

#ifndef TFNTEEINTERFACE1_H
#define TFNTEEINTERFACE1_H

#pragma once

#define STR_INPUT           L"Input\0"
#define STR_INPUTPIN        L"Input Pin\0"
#define STR_OUTPUT          L"Output\0"
#define STR_OUTPUTPIN       L"Output Pin\0"
#define STR_CAPTUREPIN      L"Capture\0"
#define STR_PREVIEWPIN      L"Preview\0"
#define STR_TEEFILTERNAME	L"NoldusTee\0"


// Guid for Noldus Tee filter - {B65495A8-031A-41A3-AB18-CFBFCDE04832}
static const GUID CLSID_NTEE = 
{ 0xb65495a8, 0x31a, 0x41a3, { 0xab, 0x18, 0xcf, 0xbf, 0xcd, 0xe0, 0x48, 0x32 } };

// Guid for Noldus Tee filter's about page - {B65495A8-031A-41A3-AB18-CFBFCDE04833}
static const GUID CLSID_TeeAbout = 
{ 0xb65495a8, 0x31a, 0x41a3, { 0xab, 0x18, 0xcf, 0xbf, 0xcd, 0xe0, 0x48, 0x33 } };

// {A48B1A2D-9C49-489C-BB6B-CB782B3DBA81}
DEFINE_GUID(IID_INoldusTee, 0xa48b1a2d, 0x9c49, 0x489c, 0xbb, 0x6b, 0xcb, 0x78, 0x2b, 0x3d, 0xba, 0x81);


DECLARE_INTERFACE_(INoldusTee, IUnknown)
{
    STDMETHOD_(void, SetPreviewPlayDelay)				(LONGLONG nDelay)		PURE;
    STDMETHOD_(void, SetPreviewFrameLength)				(LONGLONG nFrameLength) PURE;
};

#endif //TFNTEEINTERFACE1_H
