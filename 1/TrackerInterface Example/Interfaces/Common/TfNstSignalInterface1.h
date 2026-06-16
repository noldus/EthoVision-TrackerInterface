//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   NSTSignalDetector
// Module     :   NSyncTestSignalDetectFilter
// File       :   TfSTSignalInterface1.h
//----------------------------------------------------------------------------
// Revisions  :
// 24-05-2019     Laszlo Abari-Toth     - Original version
//----------------------------------------------------------------------------
#ifndef TFSTSIGNALINTERFACE1_H
#define TFSTSIGNALINTERFACE1_H

#pragma once

#include <winerror.h>
#include <dshow.h>
#include <atlbase.h>


//------------------------------------------------------------------------------
// Define new GUID and IID
//------------------------------------------------------------------------------

//// {DA083EAB-6BF1-437F-BD8B-D397FB1C2C1E}
//DEFINE_GUID(CLSID_NoldusSyncTestSignal1,
//            0xda083eab, 0x6bf1, 0x437f, 0xbd, 0x8b, 0xd3, 0x97, 0xfb, 0x1c, 0x2c, 0x1e);
//
//// {B580A77B-8184-4778-953B-4F1B99206A71}
//DEFINE_GUID(IID_INoldusSyncTestSignal1,
//            0xb580a77b, 0x8184, 0x4778, 0x95, 0x3b, 0x4f, 0x1b, 0x99, 0x20, 0x6a, 0x71);

static const GUID CLSID_NoldusFlashDetector1 = { 0xda083eab, 0x6bf1, 0x437f, {0xbd, 0x8b, 0xd3, 0x97, 0xfb, 0x1c, 0x2c, 0x1e } };
static const GUID IID_INoldusFlashDetector1 =  { 0xb580a77b, 0x8184, 0x4778, {0x95, 0x3b, 0x4f, 0x1b, 0x99, 0x20, 0x6a, 0x71 } };

//----------------------------------------------------------------------------
// struct NCTfNstsVideoSampleData
//----------------------------------------------------------------------------
// Description: Data transfered per frame by the Signal Detect.
//----------------------------------------------------------------------------
struct NCTfNstsVideoSampleData
{
    //IMediaSample*       m_pSample;
    REFERENCE_TIME      m_tmReferenceStart;
    REFERENCE_TIME      m_tmReferenceStop;
    LONGLONG            m_llFrame;
};

typedef unsigned int RoiID;

struct NCTfNstsROI
{
    RoiID               m_RoiID;
    RECT                m_rect;
};


//----------------------------------------------------------------------------
// struct NCTfNsgVideoCallbackBase
//----------------------------------------------------------------------------
// Description: Function pointer used to transfer the sample data.
//----------------------------------------------------------------------------
struct NCTfNstsVideoCallbackBase
{
    virtual void Callback(NCTfNstsVideoSampleData* pSampleData) = 0;
    virtual void Callback(NCTfNstsROI* pRoi, NCTfNstsVideoSampleData* ppvecSignals) = 0;
    virtual void Callback(NCTfNstsROI* pRoi, size_t* pSize) = 0;

};


//----------------------------------------------------------------------------
// struct INoldusSyncTestSignal1
//----------------------------------------------------------------------------
// Description: We define the interface the app can use to program us
//----------------------------------------------------------------------------
MIDL_INTERFACE("B580A77B-8184-4778-953B-4F1B99206A71")
INoldusSyncTestSignal1 : public IUnknown
{
    STDMETHOD(SetRedCutTresholdLevel)(int nRedCut) = 0;
    STDMETHOD(GetRedCutTresholdLevel)(int* pnRedCut) = 0;

    STDMETHOD(SetRedCutPowerLevel)(double dRedCut) = 0;
    STDMETHOD(GetRedCutPowerLevel)(double* pdRedCut) = 0;

    STDMETHOD(ShowFilterResult)(bool bShow) = 0;
    STDMETHOD(ShowRois)(bool bShow) = 0;
    STDMETHOD(SetSizeFilter)(double dSize) = 0;

    STDMETHOD(GetSignalData)(NCTfNstsROI* pRoi, NCTfNstsVideoSampleData* ppvecSignals) = 0;
    STDMETHOD(GetSignalDataSize)(NCTfNstsROI* pRoi, size_t* pSize) = 0;
    
    STDMETHOD(GetCurrentPosition)(long long* pCurrentTime) = 0;
    
    STDMETHOD(SetROIs)(NCTfNstsROI* pRois, size_t NumberOfROIs) = 0;
    


};

// Note: these defines are too keep the Filter name consistent with version changes.
#define NCTFNST_SIGNALDETECT_NAMEA       "Noldus Flash Detector 2.1.0"
#define NCTFNST_SIGNALDETECT_NAMEW       L"Noldus Flash Detector 2.1.0"




#endif //TFSTSIGNALINTERFACE1_H
