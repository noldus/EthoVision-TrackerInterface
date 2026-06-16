//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   NoldusFrameCounter
// Module     :   NoldusFrameCounter
// File       :   TfNFrameCounterInterface2.h
//----------------------------------------------------------------------------
// Revisions  :
// 03-12-2020 Adrian Kovacs             - Original version
//----------------------------------------------------------------------------

#ifndef TFNFRAMECOUNTERINTERFACE2_H
#define TFNFRAMECOUNTERINTERFACE2_H

#pragma once

#include <winerror.h>
#include <dshow.h>


//------------------------------------------------------------------------------
// Define new GUID and IID
//------------------------------------------------------------------------------
// {DB6A0513-91C9-49D1-A83E-45749924CB6F}
DEFINE_GUID(CLSID_NOLDUS_FRAME_COUNTER2,
    0xdb6a0513, 0x91c9, 0x49d1, 0xa8, 0x3e, 0x45, 0x74, 0x99, 0x24, 0xcb, 0x6f);

// {76CC6FEE-0686-4D95-B2D0-5DE3801BD199}
DEFINE_GUID(IID_INoldusFrameCounter2,
    0x76cc6fee, 0x686, 0x4d95, 0xb2, 0xd0, 0x5d, 0xe3, 0x80, 0x1b, 0xd1, 0x99);


//----------------------------------------------------------------------------
// enum EFcFeature
//----------------------------------------------------------------------------
// Description: framecounter feature
//----------------------------------------------------------------------------
typedef enum tagEFcFeature
{
    eFcUndefined    = -1,
    eFcBegin        = 0,
    eFcEnd
} EFcFeature;


//----------------------------------------------------------------------------
// interface INoldusFrameCounter2
//----------------------------------------------------------------------------
// Description: We define the interface the app can use to program us
// Note       : only to be used in process due to long long return value
//----------------------------------------------------------------------------
MIDL_INTERFACE("76CC6FEE-0686-4D95-B2D0-5DE3801BD199")
INoldusFrameCounter2 : public IUnknown
{
    STDMETHOD_(long long, GetNrOfPassedFrames) () PURE;
    STDMETHOD(GetStreamRefTime)                (REFERENCE_TIME* pStart) PURE;
    STDMETHOD(GetRate)                         (double* pRate) PURE;
    STDMETHOD(GetData)                         (EFcFeature eFc, VARIANT* pValue) PURE;
};


// Note: these defines are too keep the Filter name consistent with version changes.
#define FILTER_NAMEA       "Noldus FrameCounter"
#define FILTER_NAMEW      L"Noldus FrameCounter"


#endif //TFNFRAMECOUNTERINTERFACE2_H
