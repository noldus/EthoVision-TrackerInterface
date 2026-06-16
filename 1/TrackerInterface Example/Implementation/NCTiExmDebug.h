//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   TrackerInterface
// Module     :   TrackerInterface Example
// File       :   NCTiExmDebug.h
//----------------------------------------------------------------------------
#ifndef NCTIEXMDEBUG_H
#define NCTIEXMDEBUG_H

#pragma once


//#include "Noldus Debug/NoldusDebug.h"
#include <crtdbg.h>
#include <format>
#include <string>


namespace TiExm
{
    template <typename... Args>
    void Trace(const char* pszFormat, Args&&... rArgs)
    {
        const std::string str = std::vformat(pszFormat, std::make_format_args(rArgs...));
        ::OutputDebugStringA(str.c_str());
    }
}


#ifndef _ASSERT_IF
#define _ASSERT_IF(bCond, b)    _ASSERT(((bCond) ? (b) : true))
#endif

#ifndef _ASSERT_POINTER
#define _ASSERT_POINTER(p)      _ASSERT(p != nullptr)
#endif

#ifndef TIEXMTRACE
#ifdef _DEBUG
#define TIEXMTRACE              TiExm::Trace
#else
#define TIEXMTRACE              __noop
#endif
#endif


#endif //NCTIEXMDEBUG_H
