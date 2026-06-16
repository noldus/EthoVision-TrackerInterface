//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   TrackerInterface
// Module     :   TrackerInterface Example
// File       :   NCTiExmUnionFind.cpp
//----------------------------------------------------------------------------
#include "TiExmpch.h"
#include "NCTiExmUnionFind.h"
#include "NCTiExmDebug.h"


//----------------------------------------------------------------------------
// Function NCTiExmUnionFind::NCTiExmUnionFind
//----------------------------------------------------------------------------
// Description  : constructor
//----------------------------------------------------------------------------
NCTiExmUnionFind::NCTiExmUnionFind()
{
}


//----------------------------------------------------------------------------
// Function NCTiExmUnionFind::MakeSet
//----------------------------------------------------------------------------
// Description  : make set: index 0 is reserved for background
//----------------------------------------------------------------------------
size_t NCTiExmUnionFind::MakeSet() 
{
    m_vecParent.push_back(m_vecParent.size());
    
    return m_vecParent.size() - 1;
}


//size_t NCTiExmUnionFind::Find(size_t x) 
//{
//    // root's have m_vecParent[x] == x

//    while (m_vecParent[x] != x) 
//    {
//        const size_t nParent = m_vecParent[x];

//        m_vecParent[x] = m_vecParent[nParent];   // path compression
//        x = m_vecParent[x];
//    }
//    return x;
//}


//----------------------------------------------------------------------------
// Function NCTiExmUnionFind::Find
//----------------------------------------------------------------------------
// Description  : find root
//----------------------------------------------------------------------------
size_t NCTiExmUnionFind::Find(size_t x) const
{
    // root's have m_vecParent[x] == x

    while (m_vecParent[x] != x) 
    {
        x = m_vecParent[x];
    }

    return x;
}


//----------------------------------------------------------------------------
// Function NCTiExmUnionFind::Compress
//----------------------------------------------------------------------------
// Description  : compress path
//----------------------------------------------------------------------------
void NCTiExmUnionFind::Compress(size_t x)
{
    // root's have m_vecParent[x] == x

    while (m_vecParent[x] != x) 
    {
        const size_t nParent = m_vecParent[x];

        m_vecParent[x] = m_vecParent[nParent];   // path compression
        x = m_vecParent[x];
    }
}


//----------------------------------------------------------------------------
// Function NCTiExmUnionFind::Unite
//----------------------------------------------------------------------------
// Description  : unite
//----------------------------------------------------------------------------
void NCTiExmUnionFind::Unite(size_t a, size_t b)
{
    const size_t aRoot = Find(a);
    const size_t bRoot = Find(b);
   
    if (aRoot != bRoot) 
    {
        m_vecParent[bRoot] = aRoot;

        Compress(b);
    }
}
