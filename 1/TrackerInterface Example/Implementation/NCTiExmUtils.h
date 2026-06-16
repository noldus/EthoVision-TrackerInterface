//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   TrackerInterface
// Module     :   TrackerInterface Example
// File       :   NCTiExmUtils.h
//----------------------------------------------------------------------------
#ifndef NCTIEXMUTILS_H
#define NCTIEXMUTILS_H

#pragma once


#include "IlContour.h"
#include "TiInterface3.h"
#include "TiExmtypes.h"
#include <atlbase.h>
#include <atlcom.h>
#include <string>
#include <vector>


//----------------------------------------------------------------------------
// class NCTiExmUtils
//----------------------------------------------------------------------------
// Description: test utilities
//----------------------------------------------------------------------------
class NCTiExmUtils
{
public:
    static std::wstring             LoadString          (unsigned nId, EIdtLanguage eLng);
    static LCID                     LanguageToLcid      (EIdtLanguage eLng);

    static CComPtr<INCIlContour>    MakeComContour      (const std::vector<POINT>& crPoints, const RECT& crRoi);

    template <typename T>
    static T*                       CoTaskMemAllocArray (size_t nElements);

#ifdef _DEBUG
    template <class I>
    static unsigned long            GetRefCount         (I* pI);
#endif

                                    NCTiExmUtils        () = delete;
};


//----------------------------------------------------------------------------
// Function NCTiExmUtils::CoTaskMemAllocArray
//----------------------------------------------------------------------------
// Description  : allocate memory for POD's with COM memory allocator
// Note         : - if 0 elements, ::CoMemTaskAlloc seems to return a pointer anyway
//                - can't return CComHeapPtr because not copy- or moveable
//----------------------------------------------------------------------------
template <typename T>
T* NCTiExmUtils::CoTaskMemAllocArray(size_t nElements)
{
    CComHeapPtr<T> ptr;
    ptr.Allocate(nElements);

    if (ptr)
    {
        static_assert(std::is_trivial_v <T>, "only alowed if T is a POD");

        T* p = ptr;
        memset(p, 0, nElements * sizeof(T));
    }

    // give up ownership of memory
    return ptr.Detach();
}


#ifdef _DEBUG
//----------------------------------------------------------------------------
// Function NCTiExmUtils::GetRefCount
//----------------------------------------------------------------------------
// Description  : get ref count
//----------------------------------------------------------------------------
template <class I>
unsigned long NCTiExmUtils::GetRefCount(I* pI)
{
    pI->AddRef();
    return pI->Release();
}
#endif

#endif //NCTIEXMUTILS_H
