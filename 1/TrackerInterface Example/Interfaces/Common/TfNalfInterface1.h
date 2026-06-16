//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   NoldusAudioLevelFilter
// Module     :   NoldusAudioLevelFilter
// File       :   TfNalfInterface1.h
//----------------------------------------------------------------------------
// Revisions  :
// 17-07-2013 Peter Krizsan             - Original version
//----------------------------------------------------------------------------

#ifndef TFNALFINTERFACE1_H
#define TFNALFINTERFACE1_H

#pragma once

// Guid for Noldus Audio Level filter - {90EC517A-CF98-4F6A-8E93-8C6736CD4E9B}
static const GUID CLSID_NAudioLevel = 
{ 0x90ec517a, 0xcf98, 0x4f6a, { 0x8e, 0x93, 0x8c, 0x67, 0x36, 0xcd, 0x4e, 0x9b } };


// Guid for Noldus Audio Level filter's about page - {90EC517A-CF98-4F6A-8E93-8C6736CD4E9C}
static const GUID CLSID_NAudioLevelAbout = 
{ 0x90ec517a, 0xcf98, 0x4f6a, { 0x8e, 0x93, 0x8c, 0x67, 0x36, 0xcd, 0x4e, 0x9c } };


// {6A42C8DB-EB6F-4799-983E-097D1A1D390D}
static const GUID IID_INoldusAudioLevel = 
{ 0x6a42c8db, 0xeb6f, 0x4799, { 0x98, 0x3e, 0x9, 0x7d, 0x1a, 0x1d, 0x39, 0xd } };


DECLARE_INTERFACE_(INoldusAudioLevel, IUnknown)
{
    STDMETHOD_(bool, GetLevel)(int nChannel, long double* pdbLevel) PURE;
};


#endif //TFNALFINTERFACE1_H
