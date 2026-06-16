//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   Components
// Module     :   NoldusResizerFilter
// File       :   TfNrfInterface14.h
//----------------------------------------------------------------------------
// Revisions  :
// 08-05-2026 Robert Hoogmans           - Original version (Ipp migration to OneApi)
//----------------------------------------------------------------------------
#ifndef TFNRFINTERFACE14_H
#define TFNRFINTERFACE14_H

#pragma once

#include <rpc.h>    // defines MIDL_INTERFACE


// {DDEEB440-4332-4206-9220-39AFC938D35C}
DEFINE_GUID(CLSID_NoldusResizerFilter14, 
0xddeeb440, 0x4332, 0x4206, 0x92, 0x20, 0x39, 0xaf, 0xc9, 0x38, 0xd3, 0x5c);


// {5FFFF483-FB0F-42AF-AAB2-2E6073F33566}
DEFINE_GUID(IID_INoldusResizer14, 
0x5ffff483, 0xfb0f, 0x42af, 0xaa, 0xb2, 0x2e, 0x60, 0x73, 0xf3, 0x35, 0x66);


//----------------------------------------------------------------------------
// interface INoldusResizer14
//----------------------------------------------------------------------------
// Description : we define the interface the app can use to program us
//----------------------------------------------------------------------------
MIDL_INTERFACE("5FFFF483-FB0F-42AF-AAB2-2E6073F33566")
INoldusResizer14 : public IUnknown
{
    virtual STDMETHODIMP    SetRequestedMediaSubtype    (const GUID* pGuid) = 0;

    virtual STDMETHODIMP    SetRequestedSize            (const LONG cnAspectWidth, const LONG cnAspectHeight) = 0;
    virtual STDMETHODIMP    GetRequestedSize            (LONG* pnAspectWidth, LONG* pnAspectHeight) = 0;
    
    virtual STDMETHODIMP    GetVideoSize                (LONG* pnWidth, LONG* pnHeight) = 0;
};


// Note: these defines are too keep the Filter name consistent with version changes.
#define TFNRF_RESIZERFILTER_NAME         "NoldusResizerFilter 14.0.2"
#define TFNRF_RESIZERFILTER_NAME_L      L"NoldusResizerFilter 14.0.2"

#endif //TFNRFINTERFACE14_H
