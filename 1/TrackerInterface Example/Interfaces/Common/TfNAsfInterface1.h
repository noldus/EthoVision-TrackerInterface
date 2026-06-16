//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   Interfaces
// Module     :   NoldusAudioFileWriter
// File       :   TfNAsfInterface1.h
//----------------------------------------------------------------------------
// Revisions  :
// 30-06-2011 Peter Krizsan                 - Original version
//----------------------------------------------------------------------------
#ifndef TFNASFINTERFACE1_H
#define TFNASFINTERFACE1_H

#pragma once

// Guid for audio sampler filter - {1A10D8A2-596F-4e90-85C6-EDDB692C91AE}
static const GUID CLSID_NASF =
{ 0x1a10d8a2, 0x596f, 0x4e90, { 0x85, 0xc6, 0xed, 0xdb, 0x69, 0x2c, 0x91, 0xae } };

// {E5773FA5-9012-464b-9B67-0B576B1D97ED}
DEFINE_GUID(IID_INoldusAsf, 0xe5773fa5, 0x9012, 0x464b, 0x9b, 0x67, 0xb, 0x57, 0x6b, 0x1d, 0x97, 0xed);

// Propery page - {8E7F584A-CF32-4A8C-A3E6-CB6DEB89D534}
DEFINE_GUID(CLSID_NASFProp, 0x8e7f584a, 0xcf32, 0x4a8c, 0xa3, 0xe6, 0xcb, 0x6d, 0xeb, 0x89, 0xd5, 0x34);

// About box - {8E7F584A-CF32-4A8C-A3E6-CB6DEB89D535}
DEFINE_GUID(CLSID_NASFAbout, 0x8e7f584a, 0xcf32, 0x4a8c, 0xa3, 0xe6, 0xcb, 0x6d, 0xeb, 0x89, 0xd5, 0x35);


//----------------------------------------------------------------------------
// struct TfNsAudioSampleData
//----------------------------------------------------------------------------
// Description: audio samples at one time point for all channels.
//----------------------------------------------------------------------------
struct TfNsAudioSampleData
{
    long*   m_pBufferAudioSamples;      // array of audio samples, [0] = mono/left stereo, [1] = right stereo, etc.
    long    m_lSamples;                 // number of samples in buffer, 1 = mono, 2 = stereo
};


//----------------------------------------------------------------------------
// struct TfNsAudioCallbackBase
//----------------------------------------------------------------------------
// Description: Function pointer used to transfer the sample data.
//----------------------------------------------------------------------------
struct TfNsAudioCallbackBase
{
    virtual bool    CallbackReceive         (const TfNsAudioSampleData* cpSampleData) = 0;
    virtual bool    CallbackFinished        () = 0;
};


DECLARE_INTERFACE_(INoldusAsf, IUnknown)
{
    STDMETHOD(      SetDownSamplingFactor   )(unsigned long ulFactor) = 0;
    STDMETHOD(      GetDownSamplingFactor   )(unsigned long* pulFactor) = 0;
    STDMETHOD(      GetDownSampledSampleRate)(double* pdRate) = 0;

    STDMETHOD(      SetCallback             )(TfNsAudioCallbackBase* pCallback) = 0;

    STDMETHOD(      SetUseSampleCallback    )(boolean bUse) = 0;
    STDMETHOD(      GetUseSampleCallback    )(boolean* pbUse) = 0;
    STDMETHOD(      SetGeneratePeakFile     )(boolean bGenerate) = 0;
    STDMETHOD(      GetGeneratePeakFile     )(boolean* pbGenerate) = 0;
    STDMETHOD(      SetGenerateTextFile     )(boolean bGenerate) = 0;
    STDMETHOD(      GetGenerateTextFile     )(boolean* pbGenerate) = 0;
    STDMETHOD(      SetPeakFilePath         )(const wchar_t* pszPath) = 0;
    STDMETHOD(      GetPeakFilePath         )(wchar_t** ppszPath) = 0;
    STDMETHOD(      SetTextFilePath         )(const wchar_t* pszPath) = 0;
    STDMETHOD(      GetTextFilePath         )(wchar_t** ppszPath) = 0;

    STDMETHOD(      SetSourceAudioFilePath  )(const wchar_t* pszPath) = 0;

    STDMETHOD(      GetBitsPerSample        )(unsigned short* pusBits) = 0;
    STDMETHOD(      GetNrOfChannels         )(unsigned short* pusNrOfChannels) = 0;
    STDMETHOD(      GetSamplesPerSec        )(unsigned long* pulSamples) = 0;
    STDMETHOD(      GetNrOfSamples          )(hyper* pllNrOfSamples) = 0;
};

#endif //TFNASFINTERFACE1_H
