//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   Common
// Module     :   NoldusResizerFilter
// File       :   TfNrfInterface11.h
//----------------------------------------------------------------------------
// Revisions  : 26-01-2010              - version 11
// 20-04-2011 : Robert Hoogmans         - Symantical interface change.
//                                      - Now resizes to size in stead of aspect ratio.
// 21-09-2006 Rob Hemstede              - Original version
//----------------------------------------------------------------------------
#ifndef TFNRFINTERFACE9_H
#define TFNRFINTERFACE9_H

#pragma once

// {F9643466-298A-4d55-B175-FC45572185AC}
DEFINE_GUID(CLSID_NoldusResizerFilter, 
0xf9643466, 0x298a, 0x4d55, 0xb1, 0x75, 0xfc, 0x45, 0x57, 0x21, 0x85, 0xac);

// {111C6DCF-4614-4d4a-AF15-9E27FAA2DB16}
DEFINE_GUID(IID_INoldusResizer, 
0x111c6dcf, 0x4614, 0x4d4a, 0xaf, 0x15, 0x9e, 0x27, 0xfa, 0xa2, 0xdb, 0x16);

// We define the interface the app can use to program us
MIDL_INTERFACE("5CC8C010-6AB9-4055-B317-61FD76C7F41A")
INoldusResizer: public IUnknown
{
    public:
        virtual HRESULT SetRequestedSize( const LONG cnAspectWidth, const LONG cnAspectHeight) = 0;
        virtual HRESULT GetRequestedSize( LONG* pnAspectWidth, LONG* pnAspectHeight) = 0;
        virtual HRESULT GetVideoSize    ( LONG* pnWidth, LONG* pnHeight) = 0;
};


// Note: these defines are too keep the Filter name consistent with version changes.
#define TFNRF_RESIZERFILTER_NAME         "NoldusResizerFilter 11.0.2"
#define TFNRF_RESIZERFILTER_NAME_L      L"NoldusResizerFilter 11.0.2"

#endif //TFNRFINTERFACE9_H
