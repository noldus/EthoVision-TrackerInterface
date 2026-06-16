//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   NoldusTeeFilter
// Module     :   NoldusTeeFilter
// File       :   TfNTeeInterface2.h
//----------------------------------------------------------------------------
// Revisions  :
// 12-05-2014 Krizsán Péter             - Original version
//----------------------------------------------------------------------------

#ifndef TFNTEEINTERFACE2_H
#define TFNTEEINTERFACE2_H

#pragma once

#define STR_INPUT           L"Input\0"
#define STR_INPUTPIN        L"Input Pin\0"
#define STR_OUTPUT          L"Output\0"
#define STR_OUTPUTPIN       L"Output Pin\0"
#define STR_CAPTUREPIN      L"Capture\0"
#define STR_PREVIEWPIN      L"Preview\0"
#define STR_TEEFILTERNAME	L"NoldusTee\0"


// Guid for Noldus Tee filter - {05372FC1-8CD8-4959-B5BD-362A003BCD0E}
static const GUID CLSID_NTEE2 = 
{ 0x5372fc1, 0x8cd8, 0x4959, { 0xb5, 0xbd, 0x36, 0x2a, 0x0, 0x3b, 0xcd, 0xe } };


// Guid for Noldus Tee filter's about page - {6E80CF20-FA15-4E07-BFA0-CEAE11388D51}
static const GUID CLSID_TeeAbout = 
{ 0x6e80cf20, 0xfa15, 0x4e07, { 0xbf, 0xa0, 0xce, 0xae, 0x11, 0x38, 0x8d, 0x51 } };


// {DFF7CE4E-5B1B-4EEF-840E-5796CF972AD9}
DEFINE_GUID(IID_INoldusTee2, 0xdff7ce4e, 0x5b1b, 0x4eef, 0x84, 0xe, 0x57, 0x96, 0xcf, 0x97, 0x2a, 0xd9);

DECLARE_INTERFACE_(INoldusTee, IUnknown)
{
    STDMETHOD_(void, SetPreviewPlayDelay)				(LONGLONG nDelay)		PURE;
    STDMETHOD_(void, SetPreviewFrameLength)				(LONGLONG nFrameLength) PURE;
	STDMETHOD_(void, SetRecalculatePreviewTimeStamps)	(bool bRecalculate)		PURE;
};

#endif //TFNTEEINTERFACE2_H
