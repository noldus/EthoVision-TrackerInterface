//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   Common
// Module     :   NoldusResizerFilter
// File       :   TfNrfInterface10.h
//----------------------------------------------------------------------------
// Revisions  : 26-01-2010              - version 10
// 21-09-2006 Rob Hemstede              - Original version
//----------------------------------------------------------------------------
#ifndef TFNRFINTERFACE9_H
#define TFNRFINTERFACE9_H

#pragma once

// {6DFD7451-FBFA-4442-BA43-83405FCB4C8A}
DEFINE_GUID(CLSID_NoldusResizerFilter, 
0x6dfd7451, 0xfbfa, 0x4442, 0xba, 0x43, 0x83, 0x40, 0x5f, 0xcb, 0x4c, 0x8a);

// {642D84D6-4F6F-4b4d-B5FD-56A057E8E0FC}
DEFINE_GUID(IID_INoldusResizer, 
0x642d84d6, 0x4f6f, 0x4b4d, 0xb5, 0xfd, 0x56, 0xa0, 0x57, 0xe8, 0xe0, 0xfc);

// We define the interface the app can use to program us
MIDL_INTERFACE("3C92694A-3DB6-40a6-8477-09BD08F68CA4")
INoldusResizer: public IUnknown
{
    public:
        virtual HRESULT SetAspectRatio( const LONG cnAspectWidth, const LONG cnAspectHeight) = 0;
        virtual HRESULT GetAspectRatio( LONG* pnAspectWidth, LONG* pnAspectHeight) = 0;
        virtual HRESULT GetVideoSize  ( LONG* pnWidth, LONG* pnHeight) = 0;
};

#endif //TFNRFINTERFACE9_H
