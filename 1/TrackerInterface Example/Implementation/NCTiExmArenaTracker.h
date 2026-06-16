//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   TestTrackerInterfaceExample
// Module     :   TrackerInterface Example
// File       :   NCTiExmArenaTracker.h
//----------------------------------------------------------------------------
#ifndef NCTIEXMARENATRACKER_H
#define NCTIEXMARENATRACKER_H

#pragma once


#include "TiExmfwd.h"
#include "TiExmtypes.h"
#include "TiInterface3.h"
#include "NCTiExmBlob.h"
#include "NCTiExmSampleOut.h"
#include <atltypes.h>
#include <cstdint>
#include <mutex>
#include <optional>


//----------------------------------------------------------------------------
// class ATL_NO_VTABLE NCTiExmArenaTracker
//----------------------------------------------------------------------------
// Description: tracker on arena level
//----------------------------------------------------------------------------
class ATL_NO_VTABLE NCTiExmArenaTracker : public CComObjectRootEx<CComMultiThreadModel>
                                        , public INECAdinsTiArenaTracker2
{
public:
                                        NCTiExmArenaTracker     ();
    virtual                             ~NCTiExmArenaTracker    ();
    
BEGIN_COM_MAP(NCTiExmArenaTracker)
    COM_INTERFACE_ENTRY(INECAdinsTiArenaTracker2)
END_COM_MAP()

    DECLARE_PROTECT_FINAL_CONSTRUCT()

    HRESULT                             FinalConstruct          ();
    void                                FinalRelease            (); 

    void                                SetSettings             (EIdtLanguage eLng, [[maybe_unused]] const NCTiExmSettings& crSettings);

    virtual HRESULT STDMETHODCALLTYPE   SetTrackerProperties    (const NECAdinsIdtTiTrackerProperties2* pTrackerProperties) override;
    virtual HRESULT STDMETHODCALLTYPE   SetArenaProperties      (const NECAdinsIdtTiArenaProperties* pArenaProperties) override;
    virtual HRESULT STDMETHODCALLTYPE   SetSubjectsProperties   (const NECAdinsIdtTiSubjectsProperties* pSubjectsProperties) override;

    virtual HRESULT STDMETHODCALLTYPE   IsTrackerValid          (boolean* pValid, NECAdinsIdtTiError* pError) override;
        
    virtual HRESULT STDMETHODCALLTYPE   Reset                   () override;
        
    virtual HRESULT STDMETHODCALLTYPE   ProcessSample           (const NECAdinsIdtTiSampleIn2* pSampleIn, long* pnSamples, NECAdinsIdtTiSampleOut** ppSample) override;
    
private:
    void                                TrackDummy              (const NECAdinsIdtTiSampleIn2& crSampleIn, long nSamples, NECAdinsIdtTiSampleOut* pSample);
    void                                TrackClaude             (const NECAdinsIdtTiSampleIn2& crSampleIn, long nSamples, NECAdinsIdtTiSampleOut* pSample);
    
    static NCTiExmBlobVector            LabelConnectedComponents(const NCTiExmImageView& crImgv, std::uint8_t threshold = 128);

private:
    mutable std::mutex                  m_mtx;

    EIdtLanguage                        m_eLng;
    TiExm::Flags                        m_flgsPoints;
    TiExm::Flags                        m_flgsScalars;
    TiExm::Flags                        m_flgsAngles;

    CSize                               m_szArena;

    TiExm::SubjectIdVector              m_vecSubjectIds;
    std::optional<int>                  m_optMinSubjectSize;
    std::optional<int>                  m_optMaxSubjectSize;
    EAdinsIdtTiSubjectType              m_eTiSubjectType;
};


#endif //NCTIEXMARENATRACKER_H
