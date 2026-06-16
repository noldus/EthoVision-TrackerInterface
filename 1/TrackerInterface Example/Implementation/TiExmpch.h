//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   TrackerInterface
// Module     :   TrackerInterface Example
// File       :   TiExmpch.h
//----------------------------------------------------------------------------
#ifndef TIEXMPCH_H
#define TIEXMPCH_H

#pragma once


#define _ATL_APARTMENT_THREADED
#define _ATL_NO_AUTOMATIC_NAMESPACE
#define _ATL_CSTRING_EXPLICIT_CONSTRUCTORS    // some CString constructors will be explicit
#define _ATL_ALL_WARNINGS

#define NOMINMAX

//#include "Include/NIncPchCommon.h"
#include "TiExmresource.h"
#include <atlbase.h>
#include <atlcom.h>

#pragma warning(disable : 4251)

// Description of the warnings (and reason why they have been turned off)
// 4251 - 'identifier' : class 'type' needs to have dll-interface to be used by clients of class 'type2' (level 1)


using namespace ATL;


#endif //TIEXMPCH_H
