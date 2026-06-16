//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   Components
// Module     :   NoldusD2DVideoRenderer
// File       :   TfND2RfInterface1.h
//----------------------------------------------------------------------------
// Revisions  :
// 16-05-2013 Laszlo Abari-Toth         - Original version
//----------------------------------------------------------------------------

#ifndef IVIDEORENDERER_H
#define IVIDEORENDERER_H

#pragma once

// {C4D00AA2-278E-4BCB-BC76-3DC0F593FD74}
static const GUID CLSID_NoldusDirect2DVideoRenderer = 
{ 0xc4d00aa2, 0x278e, 0x4bcb, { 0xbc, 0x76, 0x3d, 0xc0, 0xf5, 0x93, 0xfd, 0x74 } };

// {82E31D86-DDDB-4424-8A90-25C126E3F629}
static const GUID IID_INoldusD2DVideoRenderer = 
{ 0x82e31d86, 0xdddb, 0x4424, { 0x8a, 0x90, 0x25, 0xc1, 0x26, 0xe3, 0xf6, 0x29 } };

// {12A36748-E56A-4575-89FA-12C5F818F634}
static const GUID CLSID_ND2DVRQualityPage = 
{ 0x12a36748, 0xe56a, 0x4575, { 0x89, 0xfa, 0x12, 0xc5, 0xf8, 0x18, 0xf6, 0x34 } };

#define FILTER_NAME L"Noldus D2D Video Renderer 1.2.0"

enum DisplayMode
{
	KeepAspectRatio = 0,
	Fill = 1
};

DECLARE_INTERFACE_(ID2DVideoRenderer, IUnknown)
{
	STDMETHOD(SetVideoWindow)(HWND hWnd) PURE;
    STDMETHOD_(HWND, GetVideoWindow)(void) PURE;
	STDMETHOD_(void, SetDisplayMode)(DisplayMode) PURE;
	STDMETHOD_(DisplayMode, GetDisplayMode)(void) PURE;
	STDMETHOD_(void, SetVideoPosition)(const RECT&) PURE;
    STDMETHOD(RepaintWnd)() PURE;
    STDMETHOD(GetVideoSize)(LONG* piWidth, LONG* piHeight) PURE;
    STDMETHOD_(HRESULT, SetOverlayImage)(BOOL bEnable, HBITMAP hBitmap) PURE;

};
#endif //IVIDEORENDERER_H
