//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   NoldusHTTPSourceFilter1
// Module     :   NoldusHTTPSource.Msm
// File       :   TfNHTTPInterface1.h
//----------------------------------------------------------------------------
// Revisions  :
// 12-02-2024 Krizsán Péter             - Original version
//----------------------------------------------------------------------------
#ifndef TFNHTTPINTERFACE1_H
#define TFNHTTPINTERFACE1_H

#pragma once

// Filter and pin names shown in GraphEdit tool
#define STR_HTTP_FILTERNAME L"NoldusHTTPSource\0"
#define STR_HTTP_PIN_NAME   L"Async output pin\0"
#define STR_HTTP_INPUT      L"Input\0"
#define STR_HTTP_OUTPUT     L"Output\0"

//----------------------------------------------------------------------------
// Class identifier of the Noldus HTTP Source Filter - {D3706447-2EF3-4B26-97B9-5981561AEA70}
//----------------------------------------------------------------------------
static const GUID CLSID_HTTPSRC1 = { 0xd3706447, 0x2ef3, 0x4b26, { 0x97, 0xb9, 0x59, 0x81, 0x56, 0x1a, 0xea, 0x70 } };

//----------------------------------------------------------------------------
// Class identifier of the filter's about page - {D3706447-2EF3-4B26-97B9-5981561AEA71}
//----------------------------------------------------------------------------
static const GUID CLSID_HTTPSRCAbout1 = { 0xd3706447, 0x2ef3, 0x4b26, { 0x97, 0xb9, 0x59, 0x81, 0x56, 0x1a, 0xea, 0x71 } };

//----------------------------------------------------------------------------
// Class identifier of the filter's interface - {D3706447-2EF3-4B26-97B9-5981561AEA72}
//----------------------------------------------------------------------------
DEFINE_GUID(IID_INoldusHTTPSource1, 0xd3706447, 0x2ef3, 0x4b26, 0x97, 0xb9, 0x59, 0x81, 0x56, 0x1a, 0xea, 0x72);

//----------------------------------------------------------------------------
// The INoldusHTTPSource1 filter interface definition
//----------------------------------------------------------------------------
DECLARE_INTERFACE_(INoldusHTTPSource1, IUnknown)
{
    STDMETHOD(GetChunkSize) (LONGLONG* pllChunkSizeInBytes) PURE;
    STDMETHOD(SetChunkSize) (LONGLONG llChunkSizeInBytes)   PURE;
};

#endif //TFNHTTPINTERFACE1_H
