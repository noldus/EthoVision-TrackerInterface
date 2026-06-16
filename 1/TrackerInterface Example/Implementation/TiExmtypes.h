//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   TrackerInterface
// Module     :   TrackerInterface Example
// File       :   TiExmtypes.h
//----------------------------------------------------------------------------
#ifndef TIEXMTYPES_H
#define TIEXMTYPES_H

#pragma once


#include <bitset>
#include <string>
#include <vector>


namespace TiExm
{
    using ArenaId           = int;
    using SubjectId         = int;
    
    using ArenaIdVector     = std::vector<ArenaId>;
    using SubjectIdVector   = std::vector<SubjectId>;

    using Flags             = std::bitset<64>;       // g_lAdinsIdtBaseFeatures is sufficient but lets take all bits
    using FrameNumber       = long long;
    

    extern const char           g_szFile[];
    extern const char           g_szSettings[];
    
    inline constexpr ArenaId    g_idArenaInvalid    = -1;
    inline constexpr SubjectId  g_idSubjectInvalid  = -1;
    inline constexpr size_t     g_nVersionMajor     = 1;
}


#endif //TIEXMTYPES_H
