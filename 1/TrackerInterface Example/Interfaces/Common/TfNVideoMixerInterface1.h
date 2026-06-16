//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   NoldusVideoMixerFilter
// Module     :   NoldusVideoMixer
// File       :   TfNVideoMixerInterface1.h
//----------------------------------------------------------------------------
// Revisions  :
// 04-06-2020 Krizsán Péter             - Original version
//----------------------------------------------------------------------------
#ifndef TFNVIDEOMIXERINTERFACE1_H
#define TFNVIDEOMIXERINTERFACE1_H

#pragma once


// GUID for Noldus Video Mixer filter - {070D616A-44BC-42C8-A2FB-0CA0064B42A4}
static const GUID CLSID_VIDEOMIXER1 =
{ 0x70d616a, 0x44bc, 0x42c8, { 0xa2, 0xfb, 0xc, 0xa0, 0x6, 0x4b, 0x42, 0xa4 } };

// GUID for the AboutBox of the Noldus Video Mixer Filter - {AE05CB9F-3668-47A7-89D3-AE90DE7B9F2E}
static const GUID CLSID_VIDEOMIXERABOUT1 = 
{ 0xae05cb9f, 0x3668, 0x47a7, { 0x89, 0xd3, 0xae, 0x90, 0xde, 0x7b, 0x9f, 0x2e } };

// GUID for the Properties of the Noldus Video Mixer Filter - {AE05CB9F-3668-47A7-89D3-AE90DE7B9F2F}
static const GUID CLSID_VIDEOMIXERPROPERTIES1 =
{ 0xae05cb9f, 0x3668, 0x47a7, { 0x89, 0xd3, 0xae, 0x90, 0xde, 0x7b, 0x9f, 0x2f } };

// {493A4495-3FD0-4519-9061-C2DCA0344351}
DEFINE_GUID(IID_INoldusVideoMixer1, 0x493a4495, 0x3fd0, 0x4519, 0x90, 0x61, 0xc2, 0xdc, 0xa0, 0x34, 0x43, 0x51);


//----------------------------------------------------------------------------
// enum eVM_LostShow
//----------------------------------------------------------------------------
enum eVM_LostShow
{
    eVMLS_Hide          = 0,
    eVMLS_Last          = (eVMLS_Hide + 1),
    eVMLS_Black         = (eVMLS_Last + 1),
    eVMLS_White         = (eVMLS_Black + 1),
    eVMLS_Bars          = (eVMLS_White + 1),
    eVMLS_Prepared      = (eVMLS_Bars + 1)
};


//----------------------------------------------------------------------------
// enum eVM_Background
//----------------------------------------------------------------------------
enum eVM_Background
{
    eVMB_None           = 0,
    eVMB_Color          = (eVMB_None + 1)
};


//----------------------------------------------------------------------------
// enum eVM_Interlace
//----------------------------------------------------------------------------
enum eVM_Interlace
{
    eVMI_Auto           = 0,
    eVMI_Progressive    = (eVMI_Auto + 1),
    eVMI_Field1First    = (eVMI_Progressive + 1),
    eVMI_Field2First    = (eVMI_Field1First + 1)
};


//----------------------------------------------------------------------------
// enum eVM_Process
//----------------------------------------------------------------------------
enum eVM_Process
{
    eVMP_None           = 0,
    eVMP_OneField       = 0x1,
    eVMP_FlipHorz       = 0x2,
    eVMP_FlipVert       = 0x4,
    eVMP_AR_LetterBox   = 0x10,
    eVMP_AR_Crop        = 0x20
};


//----------------------------------------------------------------------------
// struct PIC_PROPS
//----------------------------------------------------------------------------
struct PIC_PROPS
{
    int         fccType;
    int         nWidth;
    int         nHeight;
    int         nRowWidth;
};


//----------------------------------------------------------------------------
// struct VM_VIDEO_PROPS
//----------------------------------------------------------------------------
struct VM_VIDEO_PROPS
{
    PIC_PROPS       picProps;
    eVM_Interlace   eInterlace;
    int             nAspectX;
    int             nAspectY;
    double          dblStreamFPS;
};


//----------------------------------------------------------------------------
// struct VM_MIXING_RECT
//----------------------------------------------------------------------------
struct VM_MIXING_RECT
{
    RECT        rcSource;
    RECT        rcTarget;
    double      dblAlpha;
    int         nBorderWidth;
    int         nBorderColor;
    double      dblViewAngle;
    double      dblHorzAngle;
    double      dblVertAngle;
    double      dblHorzOffset;
    double      dblVertOffset;
    eVM_Process eProcess;
};


//----------------------------------------------------------------------------
// Interface INoldusVideoMixer1
//----------------------------------------------------------------------------
DECLARE_INTERFACE_(INoldusVideoMixer1, IUnknown)
{
    STDMETHOD_(HRESULT, GetOfflineSourceMixing) (bool* pbOfflineSourceMixing) PURE;
    STDMETHOD_(HRESULT, SetOfflineSourceMixing) (bool bOfflineSourceMixing) PURE;
    STDMETHOD_(HRESULT, GetStreamCount)         (int* pnStreamCount) PURE;
    STDMETHOD_(HRESULT, GetInputProps)          (int nStreamIdx, VM_VIDEO_PROPS* pProps) PURE;
    STDMETHOD_(HRESULT, GetInputRect)           (int nStreamIdx, int nRectNum, VM_MIXING_RECT* pMixingRect) PURE;
    STDMETHOD_(HRESULT, SetInputRect)           (int nStreamIdx, int* pnRectNum, const VM_MIXING_RECT& crMixingRect) PURE;
    STDMETHOD_(HRESULT, IsStreamEnabled)        (int nStreamIdx, bool* pbEnabled) PURE;
    STDMETHOD_(HRESULT, EnableStream)           (int nStreamIdx, bool bEnable) PURE;
    STDMETHOD_(HRESULT, GetStreamLost)          (int nStreamIdx, bool* pbLost, eVM_LostShow* peLostShow) PURE;
    STDMETHOD_(HRESULT, SetStreamLost)          (int nStreamIdx, eVM_LostShow eLostShow) PURE;
    STDMETHOD_(HRESULT, GetStreamMaxWait)       (int nStreamIdx, int* pnMaxWaitFrames, eVM_LostShow* peLostShow) PURE;
    STDMETHOD_(HRESULT, SetStreamMaxWait)       (int nStreamIdx, int nMaxWaitFrames, eVM_LostShow eLostShow) PURE;
    STDMETHOD_(HRESULT, GetOutputProps)         (bool bGivenProps, VM_VIDEO_PROPS* pProps) PURE;
    STDMETHOD_(HRESULT, SetOutputProps)         (const VM_VIDEO_PROPS& crProps) PURE;
    STDMETHOD_(HRESULT, GetBackground)          (eVM_Background* peBackGround, int* pnColor) PURE;
    STDMETHOD_(HRESULT, SetBackground)          (eVM_Background eBackGround, int nColor) PURE;
};

#endif //TFNVIDEOMIXERINTERFACE1_H
