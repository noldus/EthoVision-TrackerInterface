//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   Components
// Module     :   TrackerInterface Example
// File       :   NCTiExmComContour.cpp
//----------------------------------------------------------------------------
#include "TiExmpch.h"
#include "NCTiExmComContour.h"
#include "NCTiExmDebug.h"


//----------------------------------------------------------------------------
// Function NCTiExmComContour::NCTiExmComContour
//----------------------------------------------------------------------------
// Description  : constructor
//----------------------------------------------------------------------------
NCTiExmComContour::NCTiExmComContour()
{
}


//----------------------------------------------------------------------------
// Function NCTiExmComContour::~NCTiExmComContour
//----------------------------------------------------------------------------
// Description  : destructor
//----------------------------------------------------------------------------
NCTiExmComContour::~NCTiExmComContour()
{
}
    

//----------------------------------------------------------------------------
// Function NCTiExmComContour::FinalConstruct
//----------------------------------------------------------------------------
// Description  : final construct
//----------------------------------------------------------------------------
HRESULT NCTiExmComContour::FinalConstruct()
{
    return S_OK;
}


//----------------------------------------------------------------------------
// Function NCTiExmComContour::FinalRelease
//----------------------------------------------------------------------------
// Description  : final release
//----------------------------------------------------------------------------
void NCTiExmComContour::FinalRelease()
{
}


//----------------------------------------------------------------------------
// Function NCTiExmComContour::Set
//----------------------------------------------------------------------------
// Description  : set
//----------------------------------------------------------------------------
void NCTiExmComContour::Set(const std::vector<POINT>& crPoints, const RECT& crRoi)
{
    m_vecPoints = crPoints;
    m_roi       = crRoi;
}


//----------------------------------------------------------------------------
// Function NCTiExmComContour::GetPointsCount
//----------------------------------------------------------------------------
// Description  : get points count
//----------------------------------------------------------------------------
HRESULT NCTiExmComContour::GetPointsCount(long* pPoints)
{
    _ASSERT_POINTER(pPoints);
    
    *pPoints = static_cast<long>(m_vecPoints.size());

    return S_OK;
}


//----------------------------------------------------------------------------
// Function NCTiExmComContour::GetPoint
//----------------------------------------------------------------------------
// Description  : get point
//----------------------------------------------------------------------------
HRESULT NCTiExmComContour::GetPoint(long nPoint, POINT* pPoint)
{
    _ASSERT_POINTER(pPoint);
    
    HRESULT hr = E_FAIL;

    if (nPoint >= 0 && nPoint < m_vecPoints.size())
    {
        *pPoint = m_vecPoints[nPoint];
        
        hr = S_OK;
    }

    return hr;
}


//----------------------------------------------------------------------------
// Function NCTiExmComContour::GetRoi
//----------------------------------------------------------------------------
// Description  : get roi
//----------------------------------------------------------------------------
HRESULT NCTiExmComContour::GetRoi(RECT* pRoi)
{
    _ASSERT_POINTER(pRoi);

    *pRoi = m_roi;

    return S_OK;
}
