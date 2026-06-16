//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   Common
// Module     :   Interface
// File       :   IdtTypes.h
//----------------------------------------------------------------------------
// Revisions  :
// 15-08-2022 Egon Schrasser            - Original version
//----------------------------------------------------------------------------
// Note       : shared TRUE_TYPEDEF's around frequent used common domain types
//----------------------------------------------------------------------------
#ifndef IDTTYPES_H
#define IDTTYPES_H

#pragma once

#include "Noldus Debug/NCDbgTypedef.h"  // NOTE: 'noldus debug' dependent
#include <vector>


namespace Idt
{
    TRUE_TYPEDEF(long, HSTV);
    
    inline constexpr HSTV   g_hStvInvalid                   (-1l);

    using HSTVVector        = std::vector<HSTV>;
}

#endif //IDTTYPES_H
