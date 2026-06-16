//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   Common
// Module     :   NoldusResizerFilter
// File       :   TfNrfInterface12.h
//----------------------------------------------------------------------------
// Revisions  : 19-09-2012              - version 12
// 20-04-2011 : Robert Hoogmans         - IPP version change
// 21-09-2006 Rob Hemstede              - Original version
//----------------------------------------------------------------------------
#ifndef TFNRFINTERFACE12_H
#define TFNRFINTERFACE12_H

#pragma once

#include <rpc.h>    // defines MIDL_INTERFACE


// {ACF1F72E-30ED-4EC6-B4A5-5C137793FDB6}
DEFINE_GUID(CLSID_NoldusResizerFilter, 
0xacf1f72e, 0x30ed, 0x4ec6, 0xb4, 0xa5, 0x5c, 0x13, 0x77, 0x93, 0xfd, 0xb6);

// {FFF83926-28B5-4360-8CBB-83A4E3584364}
DEFINE_GUID(IID_INoldusResizer, 
0xfff83926, 0x28b5, 0x4360, 0x8c, 0xbb, 0x83, 0xa4, 0xe3, 0x58, 0x43, 0x64);

// We define the interface the app can use to program us
MIDL_INTERFACE("FFF83926-28B5-4360-8CBB-83A4E3584364")
INoldusResizer: public IUnknown
{
    public:
        virtual HRESULT SetRequestedSize( const LONG cnAspectWidth, const LONG cnAspectHeight) = 0;
        virtual HRESULT GetRequestedSize( LONG* pnAspectWidth, LONG* pnAspectHeight) = 0;
        virtual HRESULT GetVideoSize    ( LONG* pnWidth, LONG* pnHeight) = 0;
};


// Note: these defines are too keep the Filter name consistent with version changes.
#define TFNRF_RESIZERFILTER_NAME         "NoldusResizerFilter 12.1.2"
#define TFNRF_RESIZERFILTER_NAME_L      L"NoldusResizerFilter 12.1.2"

#endif //TFNRFINTERFACE12_H
