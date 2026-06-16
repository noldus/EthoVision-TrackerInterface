//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   Components
// Module     :   TrackerInterface Example
// File       :   NCTiExmComContour.h
//----------------------------------------------------------------------------
#ifndef NCTIEXMCOMCONTOUR_H
#define NCTIEXMCOMCONTOUR_H

#pragma once


#include "IlContour.h"
#include <atlbase.h>
#include <atlcom.h>
#include <vector>


//----------------------------------------------------------------------------
// class ATL_NO_VTABLE NCTiExmComContour
//----------------------------------------------------------------------------
// Description: implementation of COM INCIlContour using points
//----------------------------------------------------------------------------
class ATL_NO_VTABLE NCTiExmComContour : public CComObjectRootEx<CComMultiThreadModel>,
                                        public INCIlContour
{
public:
                                        NCTiExmComContour       ();
    virtual                             ~NCTiExmComContour      ();
    
BEGIN_COM_MAP(NCTiExmComContour)
    COM_INTERFACE_ENTRY(INCIlContour)
END_COM_MAP()

    DECLARE_PROTECT_FINAL_CONSTRUCT()

    HRESULT                             FinalConstruct          ();
    void                                FinalRelease            (); 

    void                                Set                     (const std::vector<POINT>& crPoints, const RECT& crRoi);

    virtual HRESULT STDMETHODCALLTYPE   GetPointsCount          (long* pPoints);
    virtual HRESULT STDMETHODCALLTYPE   GetPoint                (long nPoint, POINT* pPoint);
    virtual HRESULT STDMETHODCALLTYPE   GetRoi                  (RECT* pRoi);

private:
    std::vector<POINT>                  m_vecPoints;
    RECT                                m_roi;
};


#endif //NCTIEXMCOMCONTOUR_H
