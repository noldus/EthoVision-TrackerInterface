//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   TrackerInterface
// Module     :   TrackerInterface Example
// File       :   NCTiExmImageView.h
//----------------------------------------------------------------------------
#ifndef NCTIEXMIMAGEVIEW_H
#define NCTIEXMIMAGEVIEW_H

#pragma once

#include "TiExmfwd.h"
#include <atltypes.h>
#include <cstdint>


//----------------------------------------------------------------------------
// struct NCTiExmImageView
//----------------------------------------------------------------------------
// Description : view on an image
//----------------------------------------------------------------------------
class NCTiExmImageView
{
public:
    explicit        NCTiExmImageView(INCIlImage* pImage);

    CSize           GetSize         () const;

    std::uint8_t    GetPixel        (size_t x, size_t y) const;
    std::uint8_t&   GetPixel        (size_t x, size_t y);

public:
    CSize           m_sz;
    size_t          m_nStride;
    std::uint8_t*   m_pPixels;
};


//----------------------------------------------------------------------------
// Function NCTiExmImageView::GetSize
//----------------------------------------------------------------------------
// Description  : get size
//----------------------------------------------------------------------------
inline CSize NCTiExmImageView::GetSize() const
{
    return m_sz;
}


//----------------------------------------------------------------------------
// Function NCTiExmImageView::GetPixel
//----------------------------------------------------------------------------
// Description  : get pixel
//----------------------------------------------------------------------------
inline uint8_t NCTiExmImageView::GetPixel(size_t x, size_t y) const
{
    _ASSERT(x < m_sz.cx);
    _ASSERT(y < m_sz.cy);

    return *(m_pPixels + (y * m_nStride) + x);
}


//----------------------------------------------------------------------------
// Function NCTiExmImageView::GetPixel
//----------------------------------------------------------------------------
// Description  : get pixel
//----------------------------------------------------------------------------
inline uint8_t& NCTiExmImageView::GetPixel(size_t x, size_t y)
{
    _ASSERT(x < m_sz.cx);
    _ASSERT(y < m_sz.cy);

    return *(m_pPixels + (y * m_nStride) + x);
}

#endif //NCTIEXMIMAGEVIEW_H
