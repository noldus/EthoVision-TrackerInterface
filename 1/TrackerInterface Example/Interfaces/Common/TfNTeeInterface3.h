//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   NoldusTeeFilter
// Module     :   NoldusTeeFilter
// File       :   TfNTeeInterface3.h
//----------------------------------------------------------------------------
// Revisions  :
// 19-02-2019 Adrián Kovács             - Original version
//----------------------------------------------------------------------------
#ifndef TFNTEEINTERFACE3_H
#define TFNTEEINTERFACE3_H

#pragma once

#define STR_INPUT           L"Input\0"
#define STR_INPUTPIN        L"Input Pin\0"
#define STR_OUTPUT          L"Output\0"
#define STR_OUTPUTPIN       L"Output Pin\0"
#define STR_CAPTUREPIN      L"Capture\0"
#define STR_PREVIEWPIN      L"Preview\0"
#define STR_PREVIEWPIN2     L"Preview2\0"
#define STR_TEEFILTERNAME	L"NoldusTee\0"


// {333136AC-A270-4085-A48C-3D72580B0EE7}
static const GUID CLSID_NTEE3 =
{ 0x333136ac, 0xa270, 0x4085,{ 0xa4, 0x8c, 0x3d, 0x72, 0x58, 0xb, 0xe, 0xe7 } };

// {DA8B761C-03DB-4AAD-B693-DE0D0619DE78}
static const GUID CLSID_TeeAbout3 =
{ 0xda8b761c, 0x3db, 0x4aad,{ 0xb6, 0x93, 0xde, 0xd, 0x6, 0x19, 0xde, 0x78 } };

// {DA8B761C-03DB-4AAD-B693-DE0D0619DE78}
DEFINE_GUID(IID_INoldusTee3, 0xda8b761c, 0x3db, 0x4aad, 0xb6, 0x93, 0xde, 0xd, 0x6, 0x19, 0xde, 0x78);


//----------------------------------------------------------------------------
// Interface INoldusTee
//----------------------------------------------------------------------------
// Description  : NoldusTee filter interface functions
//----------------------------------------------------------------------------
DECLARE_INTERFACE_(INoldusTee, IUnknown)
{
    STDMETHOD_(void, SetPreviewPlayDelay)				(LONGLONG nDelay)		                                PURE;
    STDMETHOD_(void, SetPreviewFrameLength)				(LONGLONG nFrameLength)                                 PURE;
    STDMETHOD_(void, SetRecalculatePreviewTimeStamps)	(bool bRecalculate)		                                PURE;
    STDMETHOD_(void, GetPreferredMediaType)             (GUID* pSubtype, GUID* pFormattype)                     PURE;
    STDMETHOD_(void, SetPreferredMediaType)             (const GUID& crguidSubtype, const GUID& crguidFormat)   PURE;
};

#endif //TFNTEEINTERFACE3_H
