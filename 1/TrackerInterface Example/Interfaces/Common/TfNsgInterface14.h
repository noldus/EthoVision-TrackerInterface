//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   NoldusSampleGrabber
// Module     :   NoldusSamplegrabber
// File       :   TfNsgInterface14.h
//----------------------------------------------------------------------------
// Revisions  :
// 08-09-2020 Adrian Kovacs             - Original version
//----------------------------------------------------------------------------
#ifndef TFNSGINTERFACE14_H
#define TFNSGINTERFACE14_H

#pragma once

#include <winerror.h>
#include <dshow.h>


//------------------------------------------------------------------------------
// Define new GUID and IID
//------------------------------------------------------------------------------
// {BDABCEA8-D6D4-469B-8BB1-8BC668107DDA}
DEFINE_GUID(CLSID_NoldusSampleGrabber14,
    0xbdabcea8, 0xd6d4, 0x469b, 0x8b, 0xb1, 0x8b, 0xc6, 0x68, 0x10, 0x7d, 0xda);

// {3855B6B9-2E81-49D8-88AB-2B449CA54F44}
DEFINE_GUID(IID_INoldusSampleGrabber14,
    0x3855b6b9, 0x2e81, 0x49d8, 0x88, 0xab, 0x2b, 0x44, 0x9c, 0xa5, 0x4f, 0x44);


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
    int                 m_nWidth;
    int                 m_nHeight;
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
// struct INoldusSampleGrabber14
//----------------------------------------------------------------------------
// Description: We define the interface the app can use to program us
//----------------------------------------------------------------------------
MIDL_INTERFACE("3855B6B9-2E81-49D8-88AB-2B449CA54F44")
INoldusSampleGrabber14 : public IUnknown
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
#define NCTFNSG_SAMPLEGRABBER_NAMEA       "NoldusSampleGrabber 14.0.0"
#define NCTFNSG_SAMPLEGRABBER_NAMEW      L"NoldusSampleGrabber 14.0.0"


#endif //TFNSGINTERFACE14_H
