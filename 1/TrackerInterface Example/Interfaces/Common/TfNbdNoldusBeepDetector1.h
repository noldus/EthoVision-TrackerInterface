//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   TestNoldusBeepDetector
// Module     :   TestNoldusBeepDetector
// File       :   TfNbdNoldusBeepDetector1.h
//----------------------------------------------------------------------------
// Revisions  :
// 24-05-2019     Laszlo Abari-Toth     - Original version
//----------------------------------------------------------------------------
#ifndef TFNBDNOLDUSBEEPDETECTOR1_H
#define TFNBDNOLDUSBEEPDETECTOR1_H

#pragma once


#include <winerror.h>
#include <dshow.h>
#include <vector>


//------------------------------------------------------------------------------
// Define new GUID and IID
//------------------------------------------------------------------------------

//// {A16D9883-E2CE-45FF-979F-0A10AE1B8C84}
//DEFINE_GUID(CLSID_NoldusBeepDetector1,
//            0xa16d9883, 0xe2ce, 0x45ff, 0x97, 0x9f, 0xa, 0x10, 0xae, 0x1b, 0x8c, 0x84);
//
//// {6986B248-7F37-47DC-A127-E2C94F4169E4}
//DEFINE_GUID(IID_INoldusBeepDetector1,
//            0x6986b248, 0x7f37, 0x47dc, 0xa1, 0x27, 0xe2, 0xc9, 0x4f, 0x41, 0x69, 0xe4);

static const GUID CLSID_NoldusBeepDetector1 = { 0xa16d9883, 0xe2ce, 0x45ff, {0x97, 0x9f, 0xa, 0x10, 0xae, 0x1b, 0x8c, 0x84 } };
static const GUID IID_INoldusBeepDetector1  = { 0x6986b248, 0x7f37, 0x47dc, {0xa1, 0x27, 0xe2, 0xc9, 0x4f, 0x41, 0x69, 0xe4 } };

////----------------------------------------------------------------------------
//// struct NCTfNstsVideoSampleData
////----------------------------------------------------------------------------
//// Description: Data transfered per frame by the Sound Detect.
////----------------------------------------------------------------------------
//struct NCTfNstsVideoSampleData
//{
//    IMediaSample*       m_pSample;
//    REFERENCE_TIME      m_tmReferenceStart;
//    REFERENCE_TIME      m_tmReferenceStop;
//    LONGLONG            m_llFrame;
//};

//----------------------------------------------------------------------------
// struct NCTfNstASignalTime
//----------------------------------------------------------------------------
// Description: Start and stop Time of Signal
//----------------------------------------------------------------------------
struct NCTfNstASignalTime
{
    REFERENCE_TIME      m_tmReferenceStart;
    REFERENCE_TIME      m_tmReferenceStop;
};


////----------------------------------------------------------------------------
//// struct NCTfNsgVideoCallbackBase
////----------------------------------------------------------------------------
//// Description: Function pointer used to transfer the sample data.
////----------------------------------------------------------------------------
//struct NCTfNstsVideoCallbackBase
//{
//    virtual void Callback(NCTfNstsVideoSampleData* pSampleData) = 0;
//};
//
//
//----------------------------------------------------------------------------
// struct INoldusBeepDetector1
//----------------------------------------------------------------------------
// Description: We define the interface the app can use to program us
//----------------------------------------------------------------------------
MIDL_INTERFACE("6986B248-7F37-47DC-A127-E2C94F4169E4")
INoldusBeepDetector1 : public IUnknown
{

    STDMETHOD(GetSignals)                   (NCTfNstASignalTime* pvecSignals) = 0;
    STDMETHOD(GetSignalDataSize)            (size_t* pSize) = 0;

    STDMETHOD(GetMinSampleRate)             (long long* pllMinSampleRate) const = 0;
    STDMETHOD(SetMinSampleRate)             (long long val) = 0;
    STDMETHOD(GetThreshold)                 (double* pThreshold) const = 0;
    STDMETHOD(SetThreshold)                  (double val) = 0;
    STDMETHOD(GetSignalLengthMSec)          (long long* pllSignalLengthMSec) const = 0;
    STDMETHOD(SetSignalLengthMSec)          (long long SignalLengthMSec) = 0;
    STDMETHOD(GetSignalLengthTolerance)     (long long* pllSignalLengthTolerance) const = 0;
    STDMETHOD(SetSignalLengthTolerance)     (long long SignalLengthTolerance) = 0;
    STDMETHOD(GetFilteredFreq)              (int* pFilteredFreq) const = 0;
    STDMETHOD(SetFilteredFreq)              (int FilteredFreq) = 0;
    STDMETHOD(GetFilteredTimeBase)          (int* pFilteredTimeBase) const = 0;
    STDMETHOD(SetFilteredTimeBase)          (int FilteredTimeBase) = 0;
    STDMETHOD(GetFilteredBuffSize)          (int* pFilteredBuffSize) const = 0;
    STDMETHOD(SetFilteredBuffSize)          (int FilteredBuffSize) = 0;

};


// Note: these defines are too keep the Filter name consistent with version changes.
#define NCTFNST_SOUNDDETECT_NAMEA       "NoldusBeepDetector 1.0.0"
#define NCTFNST_SOUNDDETECT_NAMEW       L"NoldusBeepDetector 1.0.0"


#endif //TFNBDNOLDUSBEEPDETECTOR1_H
