//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   TestTrackerInterface
// Module     :   TrackerInterface Example
// File       :   NCTiExmTrackerInterfaceExample.h
//----------------------------------------------------------------------------
#ifndef NCTIEXMTRACKERINTERFACEEXAMPLE_H
#define NCTIEXMTRACKERINTERFACEEXAMPLE_H

#pragma once


#include "TiExmtypes.h"
#include "TiExmfwd.h"
#include "TiExmresource.h"
#include "TiInterface3.h"
#include "tiexminterface1.h"
#include "NCTiExmSettings.h"
#include "Interfaces/VTS/AdinsGuids.h"
#include <mutex>


//----------------------------------------------------------------------------
// class ATL_NO_VTABLE NCTiExmTrackerInterfaceExample
//----------------------------------------------------------------------------
// Description: tracker interface class
// Note       : 'ThreadingModel=Both' means component responsible for thread safety
//----------------------------------------------------------------------------
class ATL_NO_VTABLE NCTiExmTrackerInterfaceExample : public CComObjectRootEx<CComMultiThreadModel>,
                                                     public CComCoClass<NCTiExmTrackerInterfaceExample, &CLSID_TrackerInterfaceExample1>,
                                                     public INCCommonInterface,
                                                     public INECAdinsTiTrackerInterface3
{
public:
                                        NCTiExmTrackerInterfaceExample ();
    virtual                             ~NCTiExmTrackerInterfaceExample();
    
DECLARE_REGISTRY_RESOURCEID(IDR_TIEXM_INTERFACETEST1)

BEGIN_COM_MAP(NCTiExmTrackerInterfaceExample)
    COM_INTERFACE_ENTRY(INCCommonInterface)
    COM_INTERFACE_ENTRY(INECAdinsTiTrackerInterface3)
END_COM_MAP()

BEGIN_CATEGORY_MAP(NCTiExmTrackerInterfaceExample)
   IMPLEMENTED_CATEGORY(CATID_VtsAddinsTrackerInterface3)
END_CATEGORY_MAP()

    DECLARE_PROTECT_FINAL_CONSTRUCT()

    HRESULT                             FinalConstruct              ();
    void                                FinalRelease                (); 

    virtual HRESULT STDMETHODCALLTYPE   GetInfo                     (NCIdtAddinInfo* pInfo) override;
    virtual HRESULT STDMETHODCALLTYPE   SetLanguage                 (EIdtLanguage eLng) override;

    virtual HRESULT STDMETHODCALLTYPE   GetClassID                  (CLSID* pClassID) override;
    virtual HRESULT STDMETHODCALLTYPE   IsDirty                     () override;
    virtual HRESULT STDMETHODCALLTYPE   Load                        (LPCOLESTR pszDirectoryName) override;
    virtual HRESULT STDMETHODCALLTYPE   Save                        (LPCOLESTR pszDirectoryName) override;

    virtual HRESULT STDMETHODCALLTYPE   HasDialog                   (boolean* pDialog) override;
    virtual HRESULT STDMETHODCALLTYPE   ShowDialog                  (boolean bReadonly) override;

    virtual HRESULT STDMETHODCALLTYPE   GetFeatureCaps              (NECAdinsIdtBaseFeatures* pFeatures);
    virtual HRESULT STDMETHODCALLTYPE   GetTrackerLevel             (EAdinsIdtTiTrackerLevel* pTrackerLevel);
    
    virtual HRESULT STDMETHODCALLTYPE   IsTrackerInterfaceValid     (boolean* pValid, NECAdinsIdtTiError* pError) override;
    virtual HRESULT STDMETHODCALLTYPE   IsUseParallel               (boolean* pParallel)  override;
    
    virtual HRESULT STDMETHODCALLTYPE   CreateTrialTracker          (const NECAdinsIdtTiTrackerProperties2* pTrackerProperties, const NECAdinsIdtTiArenasProperties* pArenasProperties, const NECAdinsIdtTiSubjectsProperties* pSubjectsProperties, INECAdinsArenaSetupInterface* pArenaSetupInterface, INECAdinsTiTrialTracker2** ppTracker) override;
    virtual HRESULT STDMETHODCALLTYPE   CreateArenaTracker          (long idArena, const NECAdinsIdtTiTrackerProperties2* pTrackerProperties, const NECAdinsIdtTiArenaProperties* pArenaProperties, const NECAdinsIdtTiSubjectsProperties* pSubjectsProperties, INECAdinsArenaSetupInterface* pArenaSetupInterface, INECAdinsTiArenaTracker2** ppTracker) override;
    
private:
    mutable std::mutex                  m_mtx;
    EIdtLanguage                        m_eLng;

    NCTiExmSettings                     m_settings;
    bool                                m_bSettingsChanged;
};


OBJECT_ENTRY_AUTO(__uuidof(TrackerInterfaceExample1), NCTiExmTrackerInterfaceExample)


#endif //NCTIEXMTRACKERINTERFACEEXAMPLE_H
