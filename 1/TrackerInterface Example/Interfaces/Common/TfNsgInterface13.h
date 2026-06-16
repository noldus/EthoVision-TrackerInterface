//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   NoldusSampleGrabber
// Module     :   NoldusSamplegrabber
// File       :   TfNsgInterface13.h
//----------------------------------------------------------------------------
// Revisions  :
// 10-07-2017 Robert Hoogmans           - Original version
//----------------------------------------------------------------------------
#ifndef TFNSGINTERFACE13_H
#define TFNSGINTERFACE13_H

#pragma once

#include <winerror.h>
#include <dshow.h>


//------------------------------------------------------------------------------
// Define new GUID and IID
//------------------------------------------------------------------------------
// {AA0D73CF-76A6-4982-9016-B28EF16EADB3}
DEFINE_GUID(CLSID_NoldusSampleGrabber13, 
0xaa0d73cf, 0x76a6, 0x4982, 0x90, 0x16, 0xb2, 0x8e, 0xf1, 0x6e, 0xad, 0xb3);


// {AFF525B2-0936-4947-B245-97E8BC39A4D3}
DEFINE_GUID(IID_INoldusSampleGrabber13, 
0xaff525b2, 0x936, 0x4947, 0xb2, 0x45, 0x97, 0xe8, 0xbc, 0x39, 0xa4, 0xd3);


//----------------------------------------------------------------------------
// struct NCTfNsgVideoSampleData
//----------------------------------------------------------------------------
// Description: Data transfered per frame by the sample grabber.
//----------------------------------------------------------------------------
struct NCTfNsgVideoSampleData
{
    IMediaSample*       m_pSample;
    REFERENCE_TIME      m_tmReferenceStart; 
    REFERENCE_TIME      m_tmReferenceStop;
    LONGLONG            m_llFrame;
    GUID*               m_pguidMediaSubtype;
    BOOL                m_bBottomUpImage;
};


//----------------------------------------------------------------------------
// struct NCTfNsgVideoCallbackBase
//----------------------------------------------------------------------------
// Description: Function pointer used to transfer the sample data.
//----------------------------------------------------------------------------
struct NCTfNsgVideoCallbackBase
{
    virtual void Callback               (NCTfNsgVideoSampleData* pSampleData) = 0;
    virtual void CallbackEndOfStream    (void) = 0;
    virtual void CallbackFlush          (bool bBegin) = 0;
};


//----------------------------------------------------------------------------
// Flags that determine the VideoInfoHeader to accept.
//----------------------------------------------------------------------------
enum ENoldusSampleGrabberVihFlags
{
    ENsgVihfAcceptAll           = 0x00000000,
    ENsgVihfVideoInfoHeader1    = 0x00000001,
    ENsgVihfVideoInfoHeader2    = 0x00000002,
    ENSgVihfWmFormat            = 0x00000004,

    ENsgVihfDefaultConfig       = ENsgVihfAcceptAll,
    ENsgVihfAllUsedBits         = ENsgVihfVideoInfoHeader1 | ENsgVihfVideoInfoHeader2 | ENSgVihfWmFormat,
};


//----------------------------------------------------------------------------
// Flags that determine the MediaSubtype to accept.
//----------------------------------------------------------------------------
enum ENoldusSampleGrabberMediaSubtypeFlags
{
    ENsgMsfAcceptAll            = 0x00000000,
    ENsgMsfRGB24                = 0x00000001,
    ENsgMsfRGB32                = 0x00000002,
    ENsgMsfY800                 = 0x00000004,
    ENsgMsfYV12                 = 0x00000008,
    ENsgMsfI420                 = 0x00000010,

    ENsgMsfDefaultConfig        = ENsgMsfRGB32, // historical default.
    ENsgMsffAllUsedBits         = ENsgMsfRGB24 | ENsgMsfRGB32 | ENsgMsfY800 | ENsgMsfYV12 | ENsgMsfI420,
};


//----------------------------------------------------------------------------
// struct INoldusSampleGrabber13
//----------------------------------------------------------------------------
// Description: We define the interface the app can use to program us
//----------------------------------------------------------------------------
MIDL_INTERFACE("AFF525B2-0936-4947-B245-97E8BC39A4D3")
INoldusSampleGrabber13 : public IUnknown
{
    // Media type.
    virtual HRESULT STDMETHODCALLTYPE       SetAcceptedMediaType        (const AM_MEDIA_TYPE* pType) = 0;
    virtual HRESULT STDMETHODCALLTYPE       GetConnectedMediaType       (AM_MEDIA_TYPE* pType) = 0;
    
    virtual HRESULT STDMETHODCALLTYPE       SetCallback                 (NCTfNsgVideoCallbackBase* pCallback) = 0;
    virtual HRESULT STDMETHODCALLTYPE       SetDeliveryBuffer           (ALLOCATOR_PROPERTIES props, BYTE* pBuffer) = 0;
    
    // The video subtype that the sample grabber should grab.
    virtual HRESULT STDMETHODCALLTYPE       SetAcceptVideoInfoHeader    (ENoldusSampleGrabberVihFlags iVihFlags) = 0;
    virtual HRESULT STDMETHODCALLTYPE       SetAcceptVideoSubType       (ENoldusSampleGrabberMediaSubtypeFlags iMsfFlags) = 0;
};

// Note: these defines are too keep the Filter name consistent with version changes.
#define NCTFNSG_SAMPLEGRABBER_NAMEA       "NoldusSampleGrabber 13.3.2"
#define NCTFNSG_SAMPLEGRABBER_NAMEW      L"NoldusSampleGrabber 13.3.2"


#endif //TFNSGINTERFACE13_H
