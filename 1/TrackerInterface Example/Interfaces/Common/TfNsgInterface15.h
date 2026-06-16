//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   NoldusSampleGrabber
// Module     :   NoldusSamplegrabber
// File       :   TfNsgInterface15.h
//----------------------------------------------------------------------------
// Revisions  :
// 25-01-2023 Adrian Kovacs             - Original version
//----------------------------------------------------------------------------
#ifndef TFNSGINTERFACE15_H
#define TFNSGINTERFACE15_H

#pragma once

#include <winerror.h>
#include <dshow.h>


//------------------------------------------------------------------------------
// Define new GUID and IID
//------------------------------------------------------------------------------
// {F362AEE1-72A4-4E9D-8EB9-FD154058147E}
DEFINE_GUID(CLSID_NoldusSampleGrabber15,
    0xf362aee1, 0x72a4, 0x4e9d, 0x8e, 0xb9, 0xfd, 0x15, 0x40, 0x58, 0x14, 0x7e);

// {6F1899D8-C960-4680-9360-CF6703E26C4E}
DEFINE_GUID(IID_INoldusSampleGrabber15,
    0x6f1899d8, 0xc960, 0x4680, 0x93, 0x60, 0xcf, 0x67, 0x3, 0xe2, 0x6c, 0x4e);


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
// struct INoldusSampleGrabber15
//----------------------------------------------------------------------------
// Description: We define the interface the app can use to program us
//----------------------------------------------------------------------------
MIDL_INTERFACE("6F1899D8-C960-4680-9360-CF6703E26C4E")
INoldusSampleGrabber15 : public IUnknown
{
    // Media type.
    virtual HRESULT STDMETHODCALLTYPE       SetAcceptedMediaType        (const AM_MEDIA_TYPE* pType) = 0;
    virtual HRESULT STDMETHODCALLTYPE       GetConnectedMediaType       (AM_MEDIA_TYPE* pType) = 0;
    virtual HRESULT STDMETHODCALLTYPE       AllowDynamicMediaTypeChange (bool bAllow) = 0;
    
    virtual HRESULT STDMETHODCALLTYPE       SetCallback                 (NCTfNsgVideoCallbackBase* pCallback) = 0;
    virtual HRESULT STDMETHODCALLTYPE       SetDeliveryBuffer           (ALLOCATOR_PROPERTIES props, BYTE* pBuffer) = 0;
    
    // The video subtype that the sample grabber should grab.
    virtual HRESULT STDMETHODCALLTYPE       SetAcceptVideoInfoHeader    (ENoldusSampleGrabberVihFlags iVihFlags) = 0;
    virtual HRESULT STDMETHODCALLTYPE       SetAcceptVideoSubType       (ENoldusSampleGrabberMediaSubtypeFlags iMsfFlags) = 0;
};

// Note: these defines are too keep the Filter name consistent with version changes.
#define NCTFNSG_SAMPLEGRABBER_NAMEA       "NoldusSampleGrabber 15.0.2"
#define NCTFNSG_SAMPLEGRABBER_NAMEW      L"NoldusSampleGrabber 15.0.2"


#endif //TFNSGINTERFACE15_H
