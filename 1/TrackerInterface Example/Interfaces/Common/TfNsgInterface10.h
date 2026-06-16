//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   Common
// Module     :   NoldusSamplegrabber
// File       :   TfNsgInterface10.h
//----------------------------------------------------------------------------
// Revisions  :
// 03-04-2003 Rob Ottenhoff             - Original version
// 31-05-2010 Robert Hoogmans           - New Interface
//----------------------------------------------------------------------------
#ifndef TFNSGINTERFACE10_H
#define TFNSGINTERFACE10_H

#pragma once


//------------------------------------------------------------------------------
// Define new GUID and IID
//------------------------------------------------------------------------------

// {CF4814D1-A8C9-4b1a-AC82-24D987B3A597}
DEFINE_GUID(CLSID_NoldusSampleGrabber, 
0xcf4814d1, 0xa8c9, 0x4b1a, 0xac, 0x82, 0x24, 0xd9, 0x87, 0xb3, 0xa5, 0x97);

// {CF2D4C04-C69B-4fdc-8E96-2DB54B80A4F0}
DEFINE_GUID(IID_INoldusSampleGrabber, 
0xcf2d4c04, 0xc69b, 0x4fdc, 0x8e, 0x96, 0x2d, 0xb5, 0x4b, 0x80, 0xa4, 0xf0);

// {60B6A23C-D729-47a3-ABC3-943635C0598B}
DEFINE_GUID(MEDIASUBTYPE_RGB24_OR_RGB32, 
0x60b6a23c, 0xd729, 0x47a3, 0xab, 0xc3, 0x94, 0x36, 0x35, 0xc0, 0x59, 0x8b);


//----------------------------------------------------------------------------
// struct TfNsVideoSampleData
//----------------------------------------------------------------------------
// Description: Data transfered per frame by the sample grabber.
//----------------------------------------------------------------------------
struct TfNsVideoSampleData
{
    IMediaSample*       m_pSample;
    REFERENCE_TIME      m_tmReferenceStart; 
    REFERENCE_TIME      m_tmReferenceStop;
    LONGLONG            m_llFrame;
    GUID*               m_pguidMediaSubtype;
    BOOL                m_bBottomUpImage;

};


//----------------------------------------------------------------------------
// struct TfNsVideoCallbackBase
//----------------------------------------------------------------------------
// Description: Function pointer used to transfer the sample data.
//----------------------------------------------------------------------------
struct TfNsVideoCallbackBase
{
    virtual bool Callback(TfNsVideoSampleData* pSampleData) = 0;
};


// We define the interface the app can use to program us
MIDL_INTERFACE("BEC08534-01BF-4519-9D6C-27DC1BD712FE")
INoldusSampleGrabber : public IUnknown
{
    public:
        // Media type.
        virtual HRESULT STDMETHODCALLTYPE       SetAcceptedMediaType    (const CMediaType* pType) = 0;        
        virtual HRESULT STDMETHODCALLTYPE       GetConnectedMediaType   (CMediaType* pType) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE       SetCallback             (TfNsVideoCallbackBase* pCallback) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE       SetDeliveryBuffer       (ALLOCATOR_PROPERTIES props, BYTE* pBuffer) = 0;
        virtual void                            SetDisplayFrame         (LONGLONG nDisplayFrame) = 0;

        // The video subtype that the sample grabber should grab.
        virtual void                            SetVideoSubType         (const GUID& crGuid) = 0;
};

// Note: these defines are too keep the Filter name consistent with version changes.
#define TFNRF_SAMPLEGRABBER_NAME         "NoldusSampleGrabber 10.1.4"
#define TFNRF_SAMPLEGRABBER_NAME_L      L"NoldusSampleGrabber 10.1.4"

#endif //TFNSGINTERFACE10_H
