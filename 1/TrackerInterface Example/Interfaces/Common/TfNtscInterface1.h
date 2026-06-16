//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   NoldusTimeStampCorrectorFilter
// Module     :   NoldusTimeStampCorrector
// File       :   TfNtscInterface1.h
//----------------------------------------------------------------------------
// Revisions  :
// 19-02-2014 Krizsán Péter             - Original version
//----------------------------------------------------------------------------

#ifndef TFNTSCINTERFACE1_H
#define TFNTSCINTERFACE1_H

#pragma once

#define STR_INPUT           L"Input\0"
#define STR_INPUTPIN        L"Input Pin\0"
#define STR_OUTPUT          L"Output\0"
#define STR_OUTPUTPIN       L"Output Pin\0"
#define STR_TSCFILTERNAME   L"NoldusTimeStampCorrector\0"

// Guid for Noldus Time Stamp Corrector filter - {4AA2FA48-F32E-482b-8675-7D6ED03F733E}
static const GUID CLSID_TSC = 
{ 0x4aa2fa48, 0xf32e, 0x482b, { 0x86, 0x75, 0x7d, 0x6e, 0xd0, 0x3f, 0x73, 0x3e } };

// Guid for Noldus Time Stamp Corrector filter's about page - {4AA2FA48-F32E-482b-8675-7D6ED03F733F}
static const GUID CLSID_TSCAbout = 
{ 0x4aa2fa48, 0xf32e, 0x482b, { 0x86, 0x75, 0x7d, 0x6e, 0xd0, 0x3f, 0x73, 0x3f } };

// Guid for Noldus Time Stamp Corrector filter's settings page - {4AA2FA48-F32E-482b-8675-7D6ED03F734F}
static const GUID CLSID_TSCSettings = 
{ 0x4aa2fa48, 0xf32e, 0x482b, { 0x86, 0x75, 0x7d, 0x6e, 0xd0, 0x3f, 0x73, 0x4f } };

// Time stamp correction modes
enum ETSCMode
{
    eTscModeNotUse = -1,
    eTscModeDefault = 0,
    eTscModeAVI = eTscModeDefault,
    eTscModeMP4 = 1
};

// {3945E606-F195-4193-A551-C5393CE3A56D}
DEFINE_GUID(IID_INoldusTSC, 0x3945e606, 0xf195, 0x4193, 0xa5, 0x51, 0xc5, 0x39, 0x3c, 0xe3, 0xa5, 0x6d);

DECLARE_INTERFACE_(INoldusTSC, IUnknown)
{
    STDMETHOD_(ETSCMode, GetMode)   ()          PURE;
    STDMETHOD_(void, SetMode)       (ETSCMode)  PURE;
};

#endif //TFNTSCINTERFACE1_H
