//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   Common
// Module     :   NoldusSamplegrabber
// File       :   TfNsgInterface9.h
//----------------------------------------------------------------------------
// Revisions  :
// 03-04-2003 Rob Ottenhoff             - Original version
//----------------------------------------------------------------------------
#ifndef TFNSGINTERFACE9_H
#define TFNSGINTERFACE9_H

#pragma once


//------------------------------------------------------------------------------
// Define new GUID and IID
//------------------------------------------------------------------------------
// {51ACA43C-4F99-42a9-8081-866EDA8C62B1}
DEFINE_GUID(CLSID_NoldusSampleGrabber, 
0x51aca43c, 0x4f99, 0x42a9, 0x80, 0x81, 0x86, 0x6e, 0xda, 0x8c, 0x62, 0xb1);

// {7FFB4349-C42B-478f-BA64-3A54FCDEE4E5}
DEFINE_GUID(IID_INoldusSampleGrabber, 
0x7ffb4349, 0xc42b, 0x478f, 0xba, 0x64, 0x3a, 0x54, 0xfc, 0xde, 0xe4, 0xe5);


struct NCVideoCallbackBase
{
    virtual bool Callback( IMediaSample*   pSample, 
                           REFERENCE_TIME* prtStartTime, 
                           REFERENCE_TIME* prtStopTime,
                           BOOL            bBottomUpImage ) = 0;
};

// We define the interface the app can use to program us
MIDL_INTERFACE("BEC08534-01BF-4519-9D6C-27DC1BD712FE")
INoldusSampleGrabber : public IUnknown
{
    public:
        virtual HRESULT STDMETHODCALLTYPE SetAcceptedMediaType( 
            const CMediaType* pType) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetConnectedMediaType( 
            CMediaType* pType) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetCallback( 
            NCVideoCallbackBase* pCallback) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetDeliveryBuffer( 
            ALLOCATOR_PROPERTIES props,
            BYTE* pBuffer) = 0;
        
        virtual void SetDisplayFrame(LONGLONG nDisplayFrame) = 0;

        // Set the video subtype that the sample grabber should grab
        virtual void SetVideoSubType  (const GUID& crGuid) = 0;
};


#endif //TFNSGINTERFACE9_H
