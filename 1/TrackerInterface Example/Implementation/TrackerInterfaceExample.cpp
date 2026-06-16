//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   TrackerInterface
// Module     :   TrackerInterface Example
// File       :   TrackerInterfaceExample.cpp
//----------------------------------------------------------------------------
#include "TiExmpch.h"
#include "TiExmresource.h"
#include "NCTiExmModule.h"
#include "Interfaces/VTS/AdinsGuids.h"
#include "NCTiExmDebug.h"


namespace
{
}


//----------------------------------------------------------------------------
// Function DllMain
//----------------------------------------------------------------------------
// Description  : dll main
//----------------------------------------------------------------------------
extern "C" BOOL WINAPI DllMain(HINSTANCE hInstance, DWORD dwReason, LPVOID lpReserved)
{
    UNREFERENCED_PARAMETER(hInstance);

    return g_Module.DllMain(dwReason, lpReserved); 
}


//----------------------------------------------------------------------------
// Function DllCanUnloadNow
//----------------------------------------------------------------------------
// Description  : Used to determine whether the DLL can be unloaded by OLE
//----------------------------------------------------------------------------
STDAPI DllCanUnloadNow(void)
{
    return g_Module.DllCanUnloadNow();
}

//----------------------------------------------------------------------------
// Function DllGetClassObject
//----------------------------------------------------------------------------
// Description  : Returns a class factory to create an object of the requested type
//----------------------------------------------------------------------------
STDAPI DllGetClassObject(REFCLSID rclsid, REFIID riid, LPVOID* ppv)
{
    return g_Module.DllGetClassObject(rclsid, riid, ppv);
}


//----------------------------------------------------------------------------
// Function DllRegisterServer
//----------------------------------------------------------------------------
// Description  : Adds entries to the system registry
//----------------------------------------------------------------------------
STDAPI DllRegisterServer(void)
{
    // registers object, typelib and all interfaces in typelib
    const HRESULT hr = g_Module.DllRegisterServer();

    return hr;
}


//----------------------------------------------------------------------------
// Function DllUnregisterServer
//----------------------------------------------------------------------------
// Description  : Removes entries from the system registry
//----------------------------------------------------------------------------
STDAPI DllUnregisterServer(void)
{
    const HRESULT hr = g_Module.DllUnregisterServer();

    return hr;
}
