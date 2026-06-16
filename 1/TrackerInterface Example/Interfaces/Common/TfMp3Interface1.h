//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   NoldusMP3ParserFilter
// Module     :   NoldusMP3ParserFilter
// File       :   TfMp3Interface1.h
//----------------------------------------------------------------------------
// Revisions  :
// 18-04-2012 Peter Krizsan             - Original version
//----------------------------------------------------------------------------

#ifndef TFMP3INTERFACE1_H
#define TFMP3INTERFACE1_H

#pragma once

// Guid for Noldus MP3 Parser filter - {6F91E794-E6A0-4142-9293-F75778E23034}
static const GUID CLSID_NMp3Parser = 
{ 0x6f91e794, 0xe6a0, 0x4142, { 0x92, 0x93, 0xf7, 0x57, 0x78, 0xe2, 0x30, 0x34 } };


// Guid for Noldus MP3 Parser filter's about page - {6F91E794-E6A0-4142-9293-F75778E23035}
static const GUID CLSID_NMp3ParserAbout = 
{ 0x6f91e794, 0xe6a0, 0x4142, { 0x92, 0x93, 0xf7, 0x57, 0x78, 0xe2, 0x30, 0x35 } };


// Guid for Mediasubtype MP3 - {00000055-0000-0010-8000-00aa00389b71}
static const GUID MEDIASUBTYPE_MP3 = 
{ 0x00000055, 0x0000, 0x0010, { 0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71 } };

#endif //TFMP3INTERFACE1_H
