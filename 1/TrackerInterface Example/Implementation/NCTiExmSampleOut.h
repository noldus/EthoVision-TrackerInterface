//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   TestTrackerInterfaceExample
// Module     :   TrackerInterface Example
// File       :   NCTiExmSampleOut.h
//----------------------------------------------------------------------------
#ifndef NCTIEXMSAMPLEOUT_H
#define NCTIEXMSAMPLEOUT_H

#pragma once


#include "TiExmtypes.h"
#include "AdinsTiTypesInterface.h"
#include <atlbase.h>
#include <vector>


//----------------------------------------------------------------------------
// struct NCTiExmSampleOut
//----------------------------------------------------------------------------
// Description : sample out
//----------------------------------------------------------------------------
struct NCTiExmSampleOut
{
    TiExm::SubjectId                m_idSubject     = TiExm::g_idSubjectInvalid;
    NECAdinsIdtBaseSampleTrackData  m_sample        = {};
    CComPtr<INCIlContour>           m_ptrContour;
};


using NCTiExmSampleOutVector = std::vector<NCTiExmSampleOut>;


#endif //NCTIEXMSAMPLEOUT_H
