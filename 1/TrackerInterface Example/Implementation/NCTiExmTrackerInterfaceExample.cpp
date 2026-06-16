//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   TrackerInterface
// Module     :   TrackerInterface Example
// File       :   NCTiExmTrackerInterfaceExample.cpp
//----------------------------------------------------------------------------
#include "TiExmpch.h"
#include "NCTiExmTrackerInterfaceExample.h"
#include "NCTiExmArenaTracker.h"
#include "NCTiExmDlgSettings.h"
#include "NCTiExmModule.h"
#include "NCTiExmUtils.h"
#include <filesystem>
#include "NCTiExmDebug.h"


//----------------------------------------------------------------------------
// Function NCTiExmTrackerInterfaceExample::NCTiExmTrackerInterfaceExample
//----------------------------------------------------------------------------
// Description  : constructor
//----------------------------------------------------------------------------
NCTiExmTrackerInterfaceExample::NCTiExmTrackerInterfaceExample()
: m_eLng            (eLngEnUs)
, m_bSettingsChanged(false)
{
}


//----------------------------------------------------------------------------
// Function NCTiExmTrackerInterfaceExample::~NCTiExmTrackerInterfaceExample
//----------------------------------------------------------------------------
// Description  : destructor
//----------------------------------------------------------------------------
NCTiExmTrackerInterfaceExample::~NCTiExmTrackerInterfaceExample()
{
}


//----------------------------------------------------------------------------
// Function NCTiExmTrackerInterfaceExample::FinalConstruct
//----------------------------------------------------------------------------
// Description  : ATL override
//----------------------------------------------------------------------------
HRESULT NCTiExmTrackerInterfaceExample::FinalConstruct()
{
    return S_OK;
}


//----------------------------------------------------------------------------
// Function NCTiExmTrackerInterfaceExample::FinalRelease
//----------------------------------------------------------------------------
// Description  : ATL override
//----------------------------------------------------------------------------
void NCTiExmTrackerInterfaceExample::FinalRelease() 
{
}


//----------------------------------------------------------------------------
// Function NCTiExmTrackerInterfaceExample::GetInfo
//----------------------------------------------------------------------------
// Description  : get info
//----------------------------------------------------------------------------
HRESULT NCTiExmTrackerInterfaceExample::GetInfo(NCIdtAddinInfo* pInfo)
{
    const std::lock_guard<std::mutex> lck(m_mtx);

    // use rc
    const std::wstring strName = NCTiExmUtils::LoadString(IDS_TIEXM_DLL, m_eLng);

    _ASSERT_POINTER(pInfo);
    memset(pInfo->m_szName, 0, sizeof(pInfo->m_szName));

    const errno_t err = wcsncpy_s(pInfo->m_szName, std::size(pInfo->m_szName), strName.c_str(), _TRUNCATE);
    _ASSERT(err == 0 || err == STRUNCATE);
    
    return S_OK;
}


//----------------------------------------------------------------------------
// Function NCTiExmTrackerInterfaceExample::SetLanguage
//----------------------------------------------------------------------------
// Description  : set language
//----------------------------------------------------------------------------
HRESULT NCTiExmTrackerInterfaceExample::SetLanguage(EIdtLanguage eLng)
{
    const std::lock_guard<std::mutex> lck(m_mtx);

    m_eLng = eLng;

    return S_OK;
}


//----------------------------------------------------------------------------
// Function NCSiTstSampleInterface::GetClassID
//----------------------------------------------------------------------------
// Description  : get class id
//----------------------------------------------------------------------------
HRESULT NCTiExmTrackerInterfaceExample::GetClassID(CLSID* pClassID)
{
    _ASSERT_POINTER(pClassID);

    *pClassID = GetObjectCLSID();

    return S_OK;
}


//----------------------------------------------------------------------------
// Function NCSiTstSampleInterface::IsDirty
//----------------------------------------------------------------------------
// Description  : is dirty (i.e. needs settings to be saved)
// Return value : S_OK if dirty; S_FALSE if not
//----------------------------------------------------------------------------
HRESULT NCTiExmTrackerInterfaceExample::IsDirty()
{
    const std::lock_guard<std::mutex> lck(m_mtx);

    return m_bSettingsChanged ? S_OK : S_FALSE;
}


//----------------------------------------------------------------------------
// Function NCTiExmTrackerInterfaceExample::Load
//----------------------------------------------------------------------------
// Description  : load
// Input        : pszDirectoryName : directory under experiment
//----------------------------------------------------------------------------
HRESULT NCTiExmTrackerInterfaceExample::Load(LPCOLESTR pszDirectoryName)
{
    // load settings

    const std::lock_guard<std::mutex> lck(m_mtx);

    const std::filesystem::path pth = std::filesystem::path(pszDirectoryName) / TiExm::g_szFile;
    
    std::error_code ec;

    if (std::filesystem::exists(pth, ec))
    {
        // etc.
    }

    return S_OK;
}


//----------------------------------------------------------------------------
// Function NCTiExmTrackerInterfaceExample::Save
//----------------------------------------------------------------------------
// Description  : save
// Input        : pszDirectoryName : directory under experiment
//----------------------------------------------------------------------------
HRESULT NCTiExmTrackerInterfaceExample::Save(LPCOLESTR pszDirectoryName)
{
    const std::lock_guard<std::mutex> lck(m_mtx);
    
    std::filesystem::path pth = pszDirectoryName;
    
    std::error_code ec;

    std::filesystem::create_directories(pth, ec);

    pth /= TiExm::g_szFile; 

    // save settings
    
    return S_OK;
}


//----------------------------------------------------------------------------
// Function NCTiExmTrackerInterfaceExample::HasDialog
//----------------------------------------------------------------------------
// Description  : has dialog
//----------------------------------------------------------------------------
HRESULT NCTiExmTrackerInterfaceExample::HasDialog(boolean* pDialog)
{
    _ASSERT_POINTER(pDialog);
    
    const std::lock_guard<std::mutex> lck(m_mtx);

    *pDialog = true;

    return S_OK;
}


//----------------------------------------------------------------------------
// Function NCTiExmTrackerInterfaceExample::ShowDialog
//----------------------------------------------------------------------------
// Description  : show dialog
//----------------------------------------------------------------------------
HRESULT NCTiExmTrackerInterfaceExample::ShowDialog(boolean bReadonly)
{
    // Don't lock during dialog popup. It can cause a deadlock: when the modal dialog 
    // is open for a long time, the autosave will call Save, which starts with a lock. See TT8434.
    
    NCTiExmSettings settings;

    {
        const std::lock_guard<std::mutex> lck(m_mtx);

        settings = m_settings;
    }

    NCTiExmDlgSettings dlg{bReadonly ? true : false, settings};

    if (dlg.DoModal() == IDOK && !bReadonly)
    {
        settings = dlg.GetSettings();

        const std::lock_guard<std::mutex> lck(m_mtx);

        m_settings          = settings;
        m_bSettingsChanged  = true;
    }

    return S_OK;
}


//----------------------------------------------------------------------------
// Function NCTiExmTrackerInterfaceExample::GetFeatureCaps
//----------------------------------------------------------------------------
// Description  : get feature caps
//----------------------------------------------------------------------------
HRESULT NCTiExmTrackerInterfaceExample::GetFeatureCaps(NECAdinsIdtBaseFeatures* pFeatures)
{
    _ASSERT_POINTER(pFeatures);

    //const std::lock_guard<std::mutex> lck(m_mtx);

    // only cog and area

    *pFeatures = {};
    pFeatures->m_nFlagsPoints  = (1 << eAdinsIdtBasePointCenter);
    pFeatures->m_nFlagsScalars = (1 << eAdinsIdtBaseScalarArea);

    return S_OK;
}


//----------------------------------------------------------------------------
// Function NCTiExmTrackerInterfaceExample::GetTrackerLevel
//----------------------------------------------------------------------------
// Description  : get feature caps
//----------------------------------------------------------------------------
HRESULT NCTiExmTrackerInterfaceExample::GetTrackerLevel(EAdinsIdtTiTrackerLevel* pTrackerLevel)
{
    _ASSERT_POINTER(pTrackerLevel);

    // tracker on arena level

    *pTrackerLevel = eAdinsIdtTiTlArena;

    return S_OK;
}


//----------------------------------------------------------------------------
// Function NCTiExmTrackerInterfaceExample::IsTrackerInterfaceValid
//----------------------------------------------------------------------------
// Description  : is tracker interface valid
//----------------------------------------------------------------------------
HRESULT NCTiExmTrackerInterfaceExample::IsTrackerInterfaceValid(boolean* pValid, NECAdinsIdtTiError* pError)
{
    _ASSERT_POINTER(pValid);
    _ASSERT_POINTER(pError);

    *pValid = true;

    return S_OK;
}


//----------------------------------------------------------------------------
// Function NCTiExmTrackerInterfaceExample::IsUseParallel
//----------------------------------------------------------------------------
// Description  : is use parallel
//----------------------------------------------------------------------------
HRESULT NCTiExmTrackerInterfaceExample::IsUseParallel(boolean* pParallel)
{
    _ASSERT_POINTER(pParallel);

    *pParallel = true;

    return S_OK;
}


//----------------------------------------------------------------------------
// Function NCTiExmTrackerInterfaceExample::CreateTrialTracker
//----------------------------------------------------------------------------
// Description  : create trial tracker
//----------------------------------------------------------------------------
HRESULT NCTiExmTrackerInterfaceExample::CreateTrialTracker(const NECAdinsIdtTiTrackerProperties2* pTrackerProperties, const NECAdinsIdtTiArenasProperties* pArenasProperties, const NECAdinsIdtTiSubjectsProperties* pSubjectsProperties, INECAdinsArenaSetupInterface* pArenaSetupInterface, INECAdinsTiTrialTracker2** ppTracker)
{
    _ASSERT_POINTER(pTrackerProperties);
    _ASSERT_POINTER(pArenasProperties);
    _ASSERT_POINTER(pSubjectsProperties);
    _ASSERT_POINTER(pArenaSetupInterface);
    _ASSERT_POINTER(ppTracker);
    _ASSERT(NCTiExmUtils::GetRefCount(pArenaSetupInterface) >= 1);

    //trial trackers not supported but they work almost the same except on trial level
    _ASSERT(false);

    return E_NOTIMPL;
}


//----------------------------------------------------------------------------
// Function NCTiExmTrackerInterfaceExample::CreateArenaTracker
//----------------------------------------------------------------------------
// Description  : create tracker on arena level
// Note         : CComObject only supports default ctor; if ctor with argument
//                is important use trick of Don Box in MSJ July 1997 'Q&A ActiveX / COM'
//----------------------------------------------------------------------------
HRESULT NCTiExmTrackerInterfaceExample::CreateArenaTracker(long idArena, const NECAdinsIdtTiTrackerProperties2* pTrackerProperties, const NECAdinsIdtTiArenaProperties* pArenaProperties, const NECAdinsIdtTiSubjectsProperties* pSubjectsProperties, INECAdinsArenaSetupInterface* pArenaSetupInterface, INECAdinsTiArenaTracker2** ppTracker)
{
    UNREFERENCED_PARAMETER(idArena);

    _ASSERT_POINTER(pTrackerProperties);
    _ASSERT_POINTER(pArenaProperties);
    _ASSERT_POINTER(pSubjectsProperties);
    _ASSERT_POINTER(pArenaSetupInterface);
    _ASSERT_POINTER(ppTracker);
    _ASSERT(NCTiExmUtils::GetRefCount(pArenaSetupInterface) >= 1);

    const std::lock_guard<std::mutex> lck(m_mtx);

    using TiTstArenaTrackerComObject = CComObject<NCTiExmArenaTracker>;

    // create tracker (need to do an extra 'AddRef')
    TiTstArenaTrackerComObject* pTracker = nullptr;
    TiTstArenaTrackerComObject::CreateInstance(&pTracker);
    pTracker->AddRef();

    _ASSERT(NCTiExmUtils::GetRefCount(pTracker) == 1);

    pTracker->SetSettings(m_eLng, m_settings);
    pTracker->SetTrackerProperties(pTrackerProperties);
    pTracker->SetArenaProperties(pArenaProperties);
    pTracker->SetSubjectsProperties(pSubjectsProperties);
    
    *ppTracker = pTracker;

    return S_OK;
}
