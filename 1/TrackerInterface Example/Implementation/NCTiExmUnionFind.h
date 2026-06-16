//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   TrackerInterface
// Module     :   TrackerInterface Example
// File       :   NCTiExmUnionFind.h
//----------------------------------------------------------------------------
#ifndef NCTIEXMUNIONFIND_H
#define NCTIEXMUNIONFIND_H

#pragma once


#include <vector>


//----------------------------------------------------------------------------
// struct NCTiExmUnionFind
//----------------------------------------------------------------------------
// Description : Union-Find (a.k.a. Disjoint Set Union). Used to merge equivalent
//               labels during the first labeling pass.
//----------------------------------------------------------------------------
class NCTiExmUnionFind 
{
public:
            NCTiExmUnionFind();

    size_t  GetSize         () const;
    size_t  MakeSet         ();
    size_t  Find            (size_t x) const;
    void    Compress        (size_t x);
    void    Unite           (size_t a, size_t b);

private:
    std::vector<size_t>     m_vecParent;
};


//----------------------------------------------------------------------------
// Function NCTiExmUnionFind::GetSize
//----------------------------------------------------------------------------
// Description  : get size
//----------------------------------------------------------------------------
inline size_t NCTiExmUnionFind::GetSize() const
{
    return m_vecParent.size();
}


#endif //NCTIEXMUNIONFIND_H
