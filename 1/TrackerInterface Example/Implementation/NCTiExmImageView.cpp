//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   TrackerInterface Example
// Module     :   TrackerInterface Example
// File       :   NCTiExmImageView.cpp
//----------------------------------------------------------------------------
#include "TiExmpch.h"
#include "NCTiExmImageView.h"
#include "IlImage.h"
#include "NCTiExmDebug.h"


//----------------------------------------------------------------------------
// Function NCTiExmImageView::NCTiExmImageView
//----------------------------------------------------------------------------
// Description  : constructor
//----------------------------------------------------------------------------
NCTiExmImageView::NCTiExmImageView(INCIlImage* pImage)
    : m_nStride(0)
    , m_pPixels(nullptr)
{
    _ASSERT_POINTER(pImage);

    if (pImage)
    {
        pImage->GetWidth (&m_sz.cx);
        pImage->GetHeight(&m_sz.cy);

        long    nSize       = 0;
        long    nStepSize   = 0;
        byte*   pBuffer     = nullptr;

        pImage->GetBuffer(&nSize, &nStepSize, &pBuffer);

        m_nStride = nStepSize;
        m_pPixels = pBuffer;
    }
}
