//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   Common
// Module     :   NoldusResizerFilter
// File       :   TfNrfInterface-9.h
//----------------------------------------------------------------------------
// Revisions  :
// 21-09-2006 Rob Hemstede              - Original version
//----------------------------------------------------------------------------
#ifndef TFNRFINTERFACE9_H
#define TFNRFINTERFACE9_H

#pragma once

// {CC900621-73A9-4acb-A999-ADC3042349D7}
DEFINE_GUID(CLSID_NoldusResizerFilter, 
0xcc900621, 0x73a9, 0x4acb, 0xa9, 0x99, 0xad, 0xc3, 0x4, 0x23, 0x49, 0xd7);

// {FB82EE4A-0E6D-4592-8819-095FD34F51D6}
DEFINE_GUID(IID_INoldusResizer, 
0xfb82ee4a, 0xe6d, 0x4592, 0x88, 0x19, 0x9, 0x5f, 0xd3, 0x4f, 0x51, 0xd6);

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
