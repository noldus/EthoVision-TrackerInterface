//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   Common
// Module     :   NoldusSamplegrabber
// File       :   TfNsgInterface12.h
//----------------------------------------------------------------------------
// Revisions  :
// 03-04-2003 Rob Ottenhoff             - Original version
// 31-05-2010 Robert Hoogmans           - New Interface
// 15-09-2015 Robert Hoogmans           - New Interface
//----------------------------------------------------------------------------
#ifndef TFNSGINTERFACE12_H
#define TFNSGINTERFACE12_H

#pragma once


//------------------------------------------------------------------------------
// Define new GUID and IID
//------------------------------------------------------------------------------
// {66C89D06-A70D-48CE-967E-12D2A1DD85BE}
DEFINE_GUID(CLSID_NoldusSampleGrabber12,
0x66c89d06, 0xa70d, 0x48ce, 0x96, 0x7e, 0x12, 0xd2, 0xa1, 0xdd, 0x85, 0xbe);

// {CC34D3C2-124C-4199-95A0-88B19F610667}
DEFINE_GUID(IID_INoldusSampleGrabber12,
0xcc34d3c2, 0x124c, 0x4199, 0x95, 0xa0, 0x88, 0xb1, 0x9f, 0x61, 0x6, 0x67);

// {60B6A23C-D729-47a3-ABC3-943635C0598B}
DEFINE_GUID(MEDIASUBTYPE_RGB24_OR_RGB32, 
0x60b6a23c, 0xd729, 0x47a3, 0xab, 0xc3, 0x94, 0x36, 0x35, 0xc0, 0x59, 0x8b);


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
// struct INoldusSampleGrabber12
//----------------------------------------------------------------------------
// Description: We define the interface the app can use to program us
//----------------------------------------------------------------------------
MIDL_INTERFACE("40506623-2E39-4C98-83C4-2AC5EE318040")
INoldusSampleGrabber12 : public IUnknown
{
public:

public:
        // Media type.
        virtual HRESULT STDMETHODCALLTYPE       SetAcceptedMediaType        (const CMediaType* pType) = 0;
        virtual HRESULT STDMETHODCALLTYPE       GetConnectedMediaType       (CMediaType* pType) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE       SetCallback                 (NCTfNsgVideoCallbackBase* pCallback) = 0;
        virtual HRESULT STDMETHODCALLTYPE       SetDeliveryBuffer           (ALLOCATOR_PROPERTIES props, BYTE* pBuffer) = 0;
        
        // The video subtype that the sample grabber should grab.
        virtual void                            SetVideoSubType             (const GUID& crGuid) = 0;
        virtual void                            SetAcceptVideoInfoHeader    (ENoldusSampleGrabberVihFlags iVihFlags) = 0;
};

// Note: these defines are too keep the Filter name consistent with version changes.
#define NCTFNSG_SAMPLEGRABBER_NAMEA       "NoldusSampleGrabber 12.1.8"
#define NCTFNSG_SAMPLEGRABBER_NAMEW      L"NoldusSampleGrabber 12.1.8"


#endif //TFNSGINTERFACE12_H
