//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   NoldusGazeOverlayFilter
// Module     :   NoldusGazeOverlayFilter
// File       :   TfNNGOInterface1
//----------------------------------------------------------------------------
// Revisions  :
// 31-01-2014 Adrian Kovacs             - Original version
//----------------------------------------------------------------------------


#ifndef TFNNGOINTERFACE1_H
#define TFNNGOINTERFACE1_H

#pragma once

// Filter name shown in GraphEdit tool
#define STR_FILTERNAME  L"NoldusGazeOverlay\0"


// GUID for NoldusGazeOverlay filter - // {94771C5E-9355-4FA3-B786-A280B4FF7EA2}
static const GUID CLSID_NOLDUS_GAZEOVERLAY = 
{ 0x94771c5e, 0x9355, 0x4fa3, { 0xb7, 0x86, 0xa2, 0x80, 0xb4, 0xff, 0x7e, 0xa2 } };


// GUID for NoldusGazeOverlay interface // {32F46525-D4F0-43DB-810F-EBFF718F2F83}
static const GUID IID_INoldusGazeOverlay =
{ 0x32f46525, 0xd4f0, 0x43db, { 0x81, 0xf, 0xeb, 0xff, 0x71, 0x8f, 0x2f, 0x83 } };


DECLARE_INTERFACE_(INoldusGazeOverlay, IUnknown)
{
    STDMETHOD(SetOffset)(long long nTime) PURE;
    STDMETHOD(AddPos)(long long nTime, int nX, int nY, int status) PURE;
    STDMETHOD(SetBrushColor)(BYTE nA, BYTE nR, BYTE nG, BYTE nB) PURE;
    STDMETHOD(SetCirleSize)(int nSize) PURE;
    STDMETHOD(SetPenColor)(BYTE nA, BYTE nR, BYTE nG, BYTE nB) PURE;
    STDMETHOD(EnableHistory)(bool nEnable) PURE;
    STDMETHOD(SetHistoryLength)(UINT nTime) PURE;
    STDMETHOD(UseFrameTime)(bool bUseFrameTime) PURE;
    STDMETHOD(GetFrameTime)(long long* pnFrameTime) PURE;
    STDMETHOD(SetFlipVertical)(bool bFlipVertical) PURE;
};

#endif //TFNNGOINTERFACE1_H
