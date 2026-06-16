//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   NoldusTimeStampCorrectorFilter
// Module     :   NoldusTimeStampCorrector
// File       :   TfNtscInterface2.h
//----------------------------------------------------------------------------
// Revisions  :
// 19-02-2014 Krizsán Péter             - Original version
//----------------------------------------------------------------------------

#ifndef TFNTSCINTERFACE2_H
#define TFNTSCINTERFACE2_H

#pragma once

#define STR_INPUT           L"Input\0"
#define STR_INPUTPIN        L"Input Pin\0"
#define STR_OUTPUT          L"Output\0"
#define STR_OUTPUTPIN       L"Output Pin\0"
#define STR_TSCFILTERNAME   L"NoldusTimeStampCorrector\0"


// Guid for Noldus Time Stamp Corrector filter - {D8945030-174F-439B-A9CD-AC4E314EC117}
static const GUID CLSID_TSC2 =
{ 0xd8945030, 0x174f, 0x439b, { 0xa9, 0xcd, 0xac, 0x4e, 0x31, 0x4e, 0xc1, 0x17 } };


// Guid for Noldus Time Stamp Corrector filter's about page - {60E63CE3-FC34-4B63-8020-0D9A4297B325}
static const GUID CLSID_TSCAbout2 =
{ 0x60e63ce3, 0xfc34, 0x4b63, { 0x80, 0x20, 0xd, 0x9a, 0x42, 0x97, 0xb3, 0x25 } };


// Guid for Noldus Time Stamp Corrector filter's settings page - {C19AE5CC-367E-44EF-B7BB-E574EEFB528D}
static const GUID CLSID_TSCSettings2 =
{ 0xc19ae5cc, 0x367e, 0x44ef, { 0xb7, 0xbb, 0xe5, 0x74, 0xee, 0xfb, 0x52, 0x8d } };


// Time stamp correction modes
enum ETSCMode
{
    eTscModeNotUse = -1,
    eTscModeDefault = 0,
    eTscModeAVI = eTscModeDefault,
    eTscModeMP4 = 1
};

// {EB1C5252-1F07-4A00-969E-A821DB7F1E72}
DEFINE_GUID(IID_INoldusTSC2, 0xeb1c5252, 0x1f07, 0x4a00, 0x96, 0x9e, 0xa8, 0x21, 0xdb, 0x7f, 0x1e, 0x72);


DECLARE_INTERFACE_(INoldusTSC2, IUnknown)
{
    STDMETHOD_(ETSCMode, GetMode)           ()              PURE;
    STDMETHOD_(void, SetMode)               (ETSCMode)      PURE;
    STDMETHOD_(void, SetPreferedMediaType)  (GUID, GUID)    PURE;
    STDMETHOD_(void, GetPreferedMediaType)  (GUID*, GUID*)  PURE;
};

#endif //TFNTSCINTERFACE2_H
