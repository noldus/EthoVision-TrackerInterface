//--------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   NoldusAudioSamplerFilter2
// Module     :   NoldusAudioSamplerFilter
// File       :   TfNAsfInterface2.h
//----------------------------------------------------------------------------
// Revisions  :
// 18-09-2019 Laszlo Abari-Toth             - version 2.0
// 30-06-2011 Peter Krizsan                 - Original version
//----------------------------------------------------------------------------
#ifndef TFNASFINTERFACE2_H
#define TFNASFINTERFACE2_H

#pragma once

// Guid for audio sampler filter {9976C2D1-7ECC-42D2-9094-D224A31EE8F1}
static const GUID CLSID_NASF2 ={ 0x9976c2d1, 0x7ecc, 0x42d2,{ 0x90, 0x94, 0xd2, 0x24, 0xa3, 0x1e, 0xe8, 0xf1 } };

// {F6C9AC7F-65CE-4FB2-8DD4-4373C0F17F00}
DEFINE_GUID(IID_INoldusAsf2,0xf6c9ac7f, 0x65ce, 0x4fb2, 0x8d, 0xd4, 0x43, 0x73, 0xc0, 0xf1, 0x7f, 0x0);

// Propery page - {0A5A4FC9-9C86-4AD5-B0FF-5A7107635CE0}
DEFINE_GUID(CLSID_NASFProp2,0xa5a4fc9, 0x9c86, 0x4ad5, 0xb0, 0xff, 0x5a, 0x71, 0x7, 0x63, 0x5c, 0xe0);

// About box - {72C5CADA-154F-43D0-BF75-CD1E73A5DD13}
DEFINE_GUID(CLSID_NASFAbout2,0x72c5cada, 0x154f, 0x43d0, 0xbf, 0x75, 0xcd, 0x1e, 0x73, 0xa5, 0xdd, 0x13);

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


//----------------------------------------------------------------------------
// DECLARE_INTERFACE_
//----------------------------------------------------------------------------
// Description  : 
//----------------------------------------------------------------------------
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

#endif //TFNASFINTERFACE2_H
