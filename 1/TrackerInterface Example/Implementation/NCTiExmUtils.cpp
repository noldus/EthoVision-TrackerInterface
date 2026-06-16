//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   TrackerInterface
// Module     :   TrackerInterface Example
// File       :   NCTiExmUtils.cpp
//----------------------------------------------------------------------------
#include "TiExmpch.h"
#include "NCTiExmUtils.h"
#include "NCTiExmComContour.h"
#include <atlstr.h>
#include "NCTiExmDebug.h"


namespace
{
#ifdef _WIN32
    constexpr LCID  g_lcidEnUs = MAKELCID(MAKELANGID(LANG_ENGLISH,            SUBLANG_ENGLISH_US),         SORT_DEFAULT);
    constexpr LCID  g_lcidZhCn = MAKELCID(MAKELANGID(LANG_CHINESE_SIMPLIFIED, SUBLANG_CHINESE_SIMPLIFIED), SORT_DEFAULT);
#endif
}


//----------------------------------------------------------------------------
// Function NCTiExmUtils::LoadString
//----------------------------------------------------------------------------
// Description  : Load string from resources from ATL DLL
//----------------------------------------------------------------------------
std::wstring NCTiExmUtils::LoadString(unsigned nId, EIdtLanguage eLng)
{
    // convert to lcid
    const LCID lcid = LanguageToLcid(eLng);
        
    // AtlString
    CAtlString strAtl;    
    const BOOL bOk = strAtl.LoadString(_AtlBaseModule.GetModuleInstance(), nId, LANGIDFROMLCID(lcid));
    _ASSERT(bOk);

    // if bOk == 0, we could call
    // str1.LoadString(hMod, uID, 0);
    // which seems to load the English version

    return static_cast<LPCWSTR>(strAtl);
}


//----------------------------------------------------------------------------
// Function NCTiExmUtils::LanguageToLcid
//----------------------------------------------------------------------------
// Description  : language to lcid
//----------------------------------------------------------------------------
LCID NCTiExmUtils::LanguageToLcid(EIdtLanguage eLng)
{
    // en-us default
    LCID lcidRetval = g_lcidEnUs;

    switch (eLng)
    {
    case eLngEnUs: lcidRetval = g_lcidEnUs;    break;
    case eLngZhCn: lcidRetval = g_lcidZhCn;    break;
    default:
        _ASSERT(false);
        break;
    }

    return lcidRetval;
}


//----------------------------------------------------------------------------
// Function NCTiExmUtils::MakeComContour
//----------------------------------------------------------------------------
// Description  : make contour COM interface
//----------------------------------------------------------------------------
CComPtr<INCIlContour> NCTiExmUtils::MakeComContour(const std::vector<POINT>& crPoints, const RECT& crRoi)
{
    typedef CComObjectNoLock<NCTiExmComContour> ContourComObject;
    typedef CComCreator<ContourComObject>       ContourComObjectCreator;
    
    CComPtr<ContourComObject> ptrComContour;
    ContourComObjectCreator::CreateInstance(nullptr, __uuidof(INCIlContour), reinterpret_cast<void**>(&ptrComContour));

    _ASSERT(GetRefCount(ptrComContour.p) == 1);

    ptrComContour->Set(crPoints, crRoi);

    CComPtr<INCIlContour> ptrComContour2{ptrComContour};

    return ptrComContour2;
}
