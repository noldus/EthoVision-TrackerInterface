//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   Common
// Module     :   NoldusResizerFilter
// File       :   TfNrfInterface13.h
//----------------------------------------------------------------------------
// Revisions  : 
// 12-01-2018 Egon Schrasser            - version 13 (support Y800, RGB24)
// 19-09-2012 Robert Hoogmans           - version 12
// 20-04-2011 Robert Hoogmans           - IPP version change
// 21-09-2006 Rob Hemstede              - Original version
//----------------------------------------------------------------------------
#ifndef TFNRFINTERFACE13_H
#define TFNRFINTERFACE13_H

#pragma once

#include <rpc.h>    // defines MIDL_INTERFACE


// {AD9F92A1-00B6-4B3D-987D-D48E3F56A754}
DEFINE_GUID(CLSID_NoldusResizerFilter13, 
0xad9f92a1, 0xb6, 0x4b3d, 0x98, 0x7d, 0xd4, 0x8e, 0x3f, 0x56, 0xa7, 0x54);

// {5F95463A-2166-4074-BF4A-6FABBB208C8D}
DEFINE_GUID(IID_INoldusResizer13, 
0x5f95463a, 0x2166, 0x4074, 0xbf, 0x4a, 0x6f, 0xab, 0xbb, 0x20, 0x8c, 0x8d);


//----------------------------------------------------------------------------
// interface INoldusResizer13
//----------------------------------------------------------------------------
// Description : we define the interface the app can use to program us
//----------------------------------------------------------------------------
MIDL_INTERFACE("5F95463A-2166-4074-BF4A-6FABBB208C8D")
INoldusResizer13 : public IUnknown
{
    virtual STDMETHODIMP    SetRequestedMediaSubtype    (const GUID* pGuid) = 0;

    virtual STDMETHODIMP    SetRequestedSize            (const LONG cnAspectWidth, const LONG cnAspectHeight) = 0;
    virtual STDMETHODIMP    GetRequestedSize            (LONG* pnAspectWidth, LONG* pnAspectHeight) = 0;
    
    virtual STDMETHODIMP    GetVideoSize                (LONG* pnWidth, LONG* pnHeight) = 0;
};


// Note: these defines are too keep the Filter name consistent with version changes.
#define TFNRF_RESIZERFILTER_NAME         "NoldusResizerFilter 13.1.8"
#define TFNRF_RESIZERFILTER_NAME_L      L"NoldusResizerFilter 13.1.8"

#endif //TFNRFINTERFACE13_H
