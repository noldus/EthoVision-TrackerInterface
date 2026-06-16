//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   NoldusBufferFilter
// Module     :   NoldusBuffer
// File       :   TfNBufferInterface1.h
//----------------------------------------------------------------------------
// Revisions  :
// 15-04-2016                           - Original version
//----------------------------------------------------------------------------

#ifndef TFNBUFFERINTERFACE1_H
#define TFNBUFFERINTERFACE1_H

#pragma once

// Guid for Noldus Buffer filter - {7C6B47BE-E0ED-451A-B2B5-A007B67CFE14}
static const GUID CLSID_BUFFER =
{ 0x7c6b47be, 0xe0ed, 0x451a, { 0xb2, 0xb5, 0xa0, 0x7, 0xb6, 0x7c, 0xfe, 0x14 } };

// Guid for Noldus Buffer filter's about page - {0C681198-A49F-4EE8-8477-5CFEF36FBF0C}
static const GUID CLSID_BufAbout =
{ 0xc681198, 0xa49f, 0x4ee8, { 0x84, 0x77, 0x5c, 0xfe, 0xf3, 0x6f, 0xbf, 0xc } };

// Guid for Noldus Buffer filter's settings page - {5A40AEF9-A55D-406B-A1DF-DE77DA504010}
static const GUID CLSID_BufSettings =
{ 0x5a40aef9, 0xa55d, 0x406b, { 0xa1, 0xdf, 0xde, 0x77, 0xda, 0x50, 0x40, 0x10 } };


// {6FB5C2F1-0FE9-4799-B314-5FB2DB8893A0}
DEFINE_GUID(IID_INoldusBuffer, 0x6fb5c2f1, 0xfe9, 0x4799, 0xb3, 0x14, 0x5f, 0xb2, 0xdb, 0x88, 0x93, 0xa0);


DECLARE_INTERFACE_(INoldusBuffer, IUnknown)
{
    STDMETHOD_(void, SetPreferedMediaType)  (GUID, GUID)    PURE;
    STDMETHOD_(void, GetPreferedMediaType)  (GUID*, GUID*)  PURE;
    STDMETHOD_(void, SetBufferSize)     (size_t)    PURE;
    STDMETHOD_(void, GetBufferSize)     (size_t*)   PURE;
};

#endif //TFNBUFFERINTERFACE1_H
