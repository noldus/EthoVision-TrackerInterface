//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   NoldusBallSourceFilter
// Module     :   NoldusBallSourceFilter
// File       :   SfBlInterface1.h
//----------------------------------------------------------------------------
// Revisions  :
// 10-01-2018 Egon Schrasser            - Original version
//----------------------------------------------------------------------------
#ifndef SFBLINTERFACE1_H
#define SFBLINTERFACE1_H

#pragma once


#include <winerror.h>
#include <dshow.h>

typedef enum tagESfBlModellType
{
    eSfBlModellUndefined        = -1,
    eSfBlModellBegin            = 0,
    eSfBlModellBall             = eSfBlModellBegin,
    eSfBlModellRodent           = 1,
    eSfBlModellAdultZebraFish   = 2,
    eSfBlModellEnd

} ESfBlModellType;

//------------------------------------------------------------------------------
// Define new GUID and IID
//------------------------------------------------------------------------------
// {792EB99A-E982-4B9F-BDD0-F81B3F810F64}
DEFINE_GUID(CLSID_NoldusBallSourceFilter1, 
0x792eb99a, 0xe982, 0x4b9f, 0xbd, 0xd0, 0xf8, 0x1b, 0x3f, 0x81, 0xf, 0x64);


// {7DB70CA1-1FC2-42D3-831A-0245DAEAA447}
DEFINE_GUID(IID_INoldusBallSourceFilter1,
0x7db70ca1, 0x1fc2, 0x42d3, 0x83, 0x1a, 0x2, 0x45, 0xda, 0xea, 0xa4, 0x47);


// {DDD9F118-4E01-4B76-848A-CA9FE45680AA}
DEFINE_GUID(CLSID_NoldusBallSourceSettings1,
0xddd9f118, 0x4e01, 0x4b76, 0x84, 0x8a, 0xca, 0x9f, 0xe4, 0x56, 0x80, 0xaa);


//----------------------------------------------------------------------------
// struct INoldusBallSourceFilter1
//----------------------------------------------------------------------------
// Description: We define the interface the app can use to program us
//----------------------------------------------------------------------------
MIDL_INTERFACE("7DB70CA1-1FC2-42D3-831A-0245DAEAA447")
INoldusBallSourceFilter1 : public IUnknown
{
    virtual STDMETHODIMP    SetRequestedMediaSubtype    (const GUID* pGuid) = 0;
    virtual STDMETHODIMP    SetRequestedSize            (long nWidth, long nHeight) = 0;
    
    virtual STDMETHODIMP    GetEnforceTiming            (boolean* pEnforce) = 0;
    virtual STDMETHODIMP    SetEnforceTiming            (boolean bEnforce) = 0;
    
    virtual STDMETHODIMP    GetUseNoise                 (boolean* pNoise) = 0;
    virtual STDMETHODIMP    SetUseNoise                 (boolean bNoise) = 0;

    virtual  STDMETHODIMP   GetUseModellType            (ESfBlModellType* peType) = 0;
    virtual STDMETHODIMP    SetUseModellType            (ESfBlModellType eType) = 0;

    virtual STDMETHODIMP    StoreActiveSettings         () = 0;
};


// Note: these defines are too keep the Filter name consistent with version changes.
#define SFBL_BALLSOURCEFILTER_NAMEA       "NoldusBallSourceFilter 1.2.2"
#define SFBL_BALLSOURCEFILTER_NAMEW      L"NoldusBallSourceFilter 1.2.2"


#endif //SFBLINTERFACE1_H
