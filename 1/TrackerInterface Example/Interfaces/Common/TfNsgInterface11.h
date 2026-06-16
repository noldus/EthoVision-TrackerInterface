//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   Common
// Module     :   NoldusSamplegrabber
// File       :   TfNsgInterface11.h
//----------------------------------------------------------------------------
// Revisions  :
// 03-04-2003 Rob Ottenhoff             - Original version
// 31-05-2010 Robert Hoogmans           - New Interface
//----------------------------------------------------------------------------
#ifndef TFNSGINTERFACE11_H
#define TFNSGINTERFACE11_H

#pragma once


//------------------------------------------------------------------------------
// Define new GUID and IID
//------------------------------------------------------------------------------

// {7780ABA0-306B-4F70-BAE2-0E1ECDAA4ABF}
DEFINE_GUID(CLSID_NoldusSampleGrabber11, 
0x7780aba0, 0x306b, 0x4f70, 0xba, 0xe2, 0xe, 0x1e, 0xcd, 0xaa, 0x4a, 0xbf);

// {411B9066-0E1C-4DBA-8025-801D7A0B44D4}
DEFINE_GUID(IID_INoldusSampleGrabber11, 
0x411b9066, 0xe1c, 0x4dba, 0x80, 0x25, 0x80, 0x1d, 0x7a, 0xb, 0x44, 0xd4);

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
    virtual void Callback   (NCTfNsgVideoSampleData* pSampleData) = 0;
};


//----------------------------------------------------------------------------
// struct INoldusSampleGrabber11
//----------------------------------------------------------------------------
// Description: We define the interface the app can use to program us
//----------------------------------------------------------------------------
MIDL_INTERFACE("E0793300-CCB9-4FFA-A4F6-5964365A97A4")
INoldusSampleGrabber11 : public IUnknown
{
    public:
        // Media type.
        virtual HRESULT STDMETHODCALLTYPE       SetAcceptedMediaType    (const CMediaType* pType) = 0;        
        virtual HRESULT STDMETHODCALLTYPE       GetConnectedMediaType   (CMediaType* pType) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE       SetCallback             (NCTfNsgVideoCallbackBase* pCallback) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE       SetDeliveryBuffer       (ALLOCATOR_PROPERTIES props, BYTE* pBuffer) = 0;
        
        // The video subtype that the sample grabber should grab.
        virtual void                            SetVideoSubType         (const GUID& crGuid) = 0;
};

// Note: these defines are too keep the Filter name consistent with version changes.
#define NCTFNSG_SAMPLEGRABBER_NAMEA       "NoldusSampleGrabber 11.0.4"
#define NCTFNSG_SAMPLEGRABBER_NAMEW      L"NoldusSampleGrabber 11.0.4"


#endif //TFNSGINTERFACE10_H
