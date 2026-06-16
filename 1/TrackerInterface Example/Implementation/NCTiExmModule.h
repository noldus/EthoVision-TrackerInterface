//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   TrackerInterface
// Module     :   TrackerInterface Example
// File       :   NCTiExmModule.h
//----------------------------------------------------------------------------
#ifndef NCTIEXMMODULE_H
#define NCTIEXMMODULE_H

#pragma once


#include "TiExmresource.h"
#include "tiexminterface1.h"


//----------------------------------------------------------------------------
// class NCTiExmModule
//----------------------------------------------------------------------------
// Description: module
//----------------------------------------------------------------------------
class NCTiExmModule : public CAtlDllModuleT<NCTiExmModule>
{
public :
    DECLARE_LIBID(LIBID_TrackerInterfaceExampleLib1)
    
    DECLARE_REGISTRY_APPID_RESOURCEID(IDR_TIEXM_INTERFACETEST, "{54A8C5BE-F62C-4D15-AFC9-742A475AFDE2}")
};


extern NCTiExmModule g_Module;


#endif //NCTIEXMMODULE_H
