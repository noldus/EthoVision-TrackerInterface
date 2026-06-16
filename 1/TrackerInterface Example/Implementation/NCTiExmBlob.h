//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   TrackerInterface
// Module     :   TrackerInterface Example
// File       :   NCTiExmBlob.h
//----------------------------------------------------------------------------
#ifndef NCTIEXMBLOB_H
#define NCTIEXMBLOB_H

#pragma once

#include <limits>
#include <utility>
#include <vector>


//----------------------------------------------------------------------------
// struct NCTiExmBlob
//----------------------------------------------------------------------------
// Description : Per-object statistics that we report at the end.
//----------------------------------------------------------------------------
struct NCTiExmBlob 
{
    int                         bboxWidth   () const { return m_maxX - m_minX + 1; }
    int                         bboxHeight  () const { return m_maxY - m_minY + 1; }

    std::pair<double, double>   GetCog      () const;

public:
    size_t  m_id    = 0;
    size_t  m_area  = 0;          // number of pixels in the object
    int     m_minX  = std::numeric_limits<int>::max();
    int     m_minY  = std::numeric_limits<int>::max();
    int     m_maxX  = -1;
    int     m_maxY  = -1;
    double  m_sumX  = 0;
    double  m_sumY  = 0;   // for the centroid
};


//----------------------------------------------------------------------------
// Function NCTiExmBlob::GetCog
//----------------------------------------------------------------------------
// Description  : get cog
//----------------------------------------------------------------------------
inline std::pair<double, double> NCTiExmBlob::GetCog() const
{
    const double cx = m_sumX / m_area;
    const double cy = m_sumY / m_area;

    return std::make_pair(cx, cy);
}


using NCTiExmBlobVector = std::vector<NCTiExmBlob>;


#endif //NCTIEXMBLOB_H
