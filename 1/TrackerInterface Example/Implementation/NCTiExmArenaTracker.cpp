//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   TrackerInterface
// Module     :   TrackerInterface Example
// File       :   NCTiExmArenaTracker.cpp
//----------------------------------------------------------------------------
#include "TiExmpch.h"
#include "NCTiExmArenaTracker.h"
#include "NCTiExmComContour.h"
#include "NCTiExmImageView.h"
#include "NCTiExmSampleOut.h"
#include "NCTiExmUnionFind.h"
#include "NCTiExmUtils.h"
#include <algorithm>
#include <format>
#include <vector>
#include "NCTiExmDebug.h"


//----------------------------------------------------------------------------
// Function NCTiExmArenaTracker::NCTiExmArenaTracker
//----------------------------------------------------------------------------
// Description  : constructor
// Note         : ATL / COM expects default ctor
//----------------------------------------------------------------------------
NCTiExmArenaTracker::NCTiExmArenaTracker()
: m_eLng            (eLngEnUs)
, m_eTiSubjectType  (eAdinsIdtTiStUndefined)
{
}


//----------------------------------------------------------------------------
// Function NCTiExmArenaTracker::~NCTiExmArenaTracker
//----------------------------------------------------------------------------
// Description  : destructor
//----------------------------------------------------------------------------
NCTiExmArenaTracker::~NCTiExmArenaTracker()
{
}


//----------------------------------------------------------------------------
// Function NCTiExmArenaTracker::FinalConstruct
//----------------------------------------------------------------------------
// Description  : ATL override
//----------------------------------------------------------------------------
HRESULT NCTiExmArenaTracker::FinalConstruct()
{
    return S_OK;
}


//----------------------------------------------------------------------------
// Function NCTiExmArenaTracker::FinalRelease
//----------------------------------------------------------------------------
// Description  : ATL override
//----------------------------------------------------------------------------
void NCTiExmArenaTracker::FinalRelease() 
{
}


//----------------------------------------------------------------------------
// Function NCTiExmArenaTracker::SetSettings
//----------------------------------------------------------------------------
// Description  : set settings
//----------------------------------------------------------------------------
void NCTiExmArenaTracker::SetSettings(EIdtLanguage eLng, [[maybe_unused]] const NCTiExmSettings& crSettings)
{
    const std::lock_guard<std::mutex> lck(m_mtx);
    
    m_eLng = eLng;
}


//----------------------------------------------------------------------------
// Function NCTiExmArenaTracker::SetTrackerProperties
//----------------------------------------------------------------------------
// Description  : set tracker properties
//----------------------------------------------------------------------------
HRESULT NCTiExmArenaTracker::SetTrackerProperties(const NECAdinsIdtTiTrackerProperties2* pTrackerProperties)
{
    _ASSERT_POINTER(pTrackerProperties);

    const std::lock_guard<std::mutex> lck(m_mtx);

    m_flgsPoints    = TiExm::Flags{pTrackerProperties->m_ftrs.m_nFlagsPoints};
    m_flgsScalars   = TiExm::Flags{pTrackerProperties->m_ftrs.m_nFlagsScalars};
    m_flgsAngles    = TiExm::Flags{pTrackerProperties->m_ftrs.m_nFlagsAngles};
    
    return S_OK;
}


//----------------------------------------------------------------------------
// Function NCTiExmArenaTracker::SetArenaProperties
//----------------------------------------------------------------------------
// Description  : set arena properties
//----------------------------------------------------------------------------
HRESULT NCTiExmArenaTracker::SetArenaProperties(const NECAdinsIdtTiArenaProperties* pArenaProperties)
{
    _ASSERT_POINTER(pArenaProperties);
    _ASSERT_IF(pArenaProperties->m_pImageArenaMask, NCTiExmUtils::GetRefCount(pArenaProperties->m_pImageArenaMask) >= 1);

    const std::lock_guard<std::mutex> lck(m_mtx);

    m_szArena = {pArenaProperties->m_szArena.cx, pArenaProperties->m_szArena.cy};

    return S_OK;
}


//----------------------------------------------------------------------------
// Function NCTiExmArenaTracker::SetSubjectsProperties
//----------------------------------------------------------------------------
// Description  : set subjects properties
//----------------------------------------------------------------------------
HRESULT NCTiExmArenaTracker::SetSubjectsProperties(const NECAdinsIdtTiSubjectsProperties* pSubjectsProperties)
{
    _ASSERT_POINTER(pSubjectsProperties);

    const std::lock_guard<std::mutex> lck(m_mtx);

    m_vecSubjectIds.resize(pSubjectsProperties->m_nSubjects);

    std::transform(pSubjectsProperties->m_pSubjects, pSubjectsProperties->m_pSubjects + pSubjectsProperties->m_nSubjects,
                   m_vecSubjectIds.begin(),
                   [] (const NECAdinsIdtTiSubjectProperties& crSubject) { return static_cast<TiExm::SubjectId>(crSubject.m_idSubject); });

    if (pSubjectsProperties->m_bUseMinSize)
    {
        m_optMinSubjectSize = pSubjectsProperties->m_nMinSize;
    }

    if (pSubjectsProperties->m_bUseMaxSize)
    {
        m_optMaxSubjectSize = pSubjectsProperties->m_nMaxSize;
    }

    m_eTiSubjectType = pSubjectsProperties->m_eTiSubjectType;

    return S_OK;
}


//----------------------------------------------------------------------------
// Function NCTiExmArenaTracker::IsTrackerValid
//----------------------------------------------------------------------------
// Description  : is detector valid
//----------------------------------------------------------------------------
HRESULT NCTiExmArenaTracker::IsTrackerValid(boolean* pValid, NECAdinsIdtTiError* pError)
{
    UNREFERENCED_PARAMETER(pError);

    const std::lock_guard<std::mutex> lck(m_mtx);

    *pValid = true;

    return S_OK;
}


//----------------------------------------------------------------------------
// Function NCTiExmArenaTracker::Reset
//----------------------------------------------------------------------------
// Description  : reset
//----------------------------------------------------------------------------
HRESULT NCTiExmArenaTracker::Reset()
{
    const std::lock_guard<std::mutex> lck(m_mtx);

    return S_OK;
}


//----------------------------------------------------------------------------
// Function NCTiExmArenaTracker::ProcessSample
//----------------------------------------------------------------------------
// Description  : process sample
//----------------------------------------------------------------------------
HRESULT NCTiExmArenaTracker::ProcessSample(const NECAdinsIdtTiSampleIn2* pSampleIn, long* pnSamples, NECAdinsIdtTiSampleOut** ppSample)
{
    _ASSERT_POINTER(pSampleIn);
    _ASSERT_POINTER(pnSamples);
    _ASSERT_POINTER(ppSample);

    _ASSERT_IF(pSampleIn->m_pImageRaw8bit,      NCTiExmUtils::GetRefCount(pSampleIn->m_pImageRaw8bit)      >= 1);
    _ASSERT_IF(pSampleIn->m_pImageRaw24bit,     NCTiExmUtils::GetRefCount(pSampleIn->m_pImageRaw24bit)     >= 1);
    _ASSERT_IF(pSampleIn->m_pImagePreProcessed, NCTiExmUtils::GetRefCount(pSampleIn->m_pImagePreProcessed) >= 1);

    const std::lock_guard<std::mutex> lck(m_mtx);

    *pnSamples = static_cast<long>(m_vecSubjectIds.size());
    *ppSample  = NCTiExmUtils::CoTaskMemAllocArray<NECAdinsIdtTiSampleOut>(*pnSamples);

    //TrackDummy(*pSampleIn, *pnSamples, *ppSample);
    TrackClaude(*pSampleIn, *pnSamples, *ppSample);

    return S_OK;
}


//----------------------------------------------------------------------------
// Function NCTiExmArenaTracker::TrackDummy
//----------------------------------------------------------------------------
// Description  : track with dummy data (i.e. middle of arena)
//----------------------------------------------------------------------------
void NCTiExmArenaTracker::TrackDummy(const NECAdinsIdtTiSampleIn2& crSampleIn, long nSamples, NECAdinsIdtTiSampleOut* pSample)
{
    UNREFERENCED_PARAMETER(crSampleIn);

    _ASSERT(m_vecSubjectIds.size() == static_cast<size_t>(nSamples));

    // create some dummy samples
    
    size_t nSample = 0;

    for (const TiExm::SubjectId idSubject : m_vecSubjectIds)
    {
        NECAdinsIdtTiSampleOut* pSampleOut = pSample + nSample;

        pSampleOut->m_idSubject = idSubject;

        if (m_flgsPoints.test(eAdinsIdtBasePointCenter))
        {
            pSampleOut->m_sample.m_aPoints[eAdinsIdtBasePointCenter].m_bValid = true;
            pSampleOut->m_sample.m_aPoints[eAdinsIdtBasePointCenter].m_dbX    = m_szArena.cx / 2.0 + nSample;
            pSampleOut->m_sample.m_aPoints[eAdinsIdtBasePointCenter].m_dbY    = m_szArena.cy / 2.0 + nSample;
            pSampleOut->m_sample.m_aPoints[eAdinsIdtBasePointCenter].m_dbZ    = 0.0;
        }

        ++nSample;
    }
}


//----------------------------------------------------------------------------
// Function NCTiExmArenaTracker::TrackClaude
//----------------------------------------------------------------------------
// Description  : track using an AI algorithm from Claude
//----------------------------------------------------------------------------
void NCTiExmArenaTracker::TrackClaude(const NECAdinsIdtTiSampleIn2& crSampleIn, long nSamples, NECAdinsIdtTiSampleOut* pSample)
{
    _ASSERT(m_vecSubjectIds.size() == static_cast<size_t>(nSamples));

    // create samples
    
    const NCTiExmImageView imgv{crSampleIn.m_pImagePreProcessed};

    NCTiExmBlobVector vecBlobs = LabelConnectedComponents(imgv);

    if (m_optMinSubjectSize || m_optMaxSubjectSize)
    {
        auto it = std::remove_if(vecBlobs.begin(), vecBlobs.end(), [this] (const NCTiExmBlob& crBlob)
                                         {
                                             if (m_optMinSubjectSize && crBlob.m_area < *m_optMinSubjectSize)
                                             {
                                                 return true;
                                             }

                                             if (m_optMaxSubjectSize && crBlob.m_area > *m_optMaxSubjectSize)
                                             {
                                                 return true;
                                             }

                                             return false;
                                         });

        vecBlobs.erase(it, vecBlobs.end());
    }

    // assign to output with largest first. It could be improved to assign to closest previous detection

    std::ranges::sort(vecBlobs, [] (const NCTiExmBlob& crBlob1, const NCTiExmBlob& crBlob2) { return crBlob1.m_area > crBlob2.m_area; });

    NCTiExmBlobVector::iterator itBlob = vecBlobs.begin();

    size_t nSample = 0;

    for (const TiExm::SubjectId idSubject : m_vecSubjectIds)
    {
        NECAdinsIdtTiSampleOut* pSampleOut = pSample + nSample;

        pSampleOut->m_idSubject = idSubject;
        pSampleOut->m_nFrame    = crSampleIn.m_nFrame;

        if (itBlob != vecBlobs.end())
        {
            if (m_flgsPoints.test(eAdinsIdtBasePointCenter))
            {
                const std::pair<double, double> pt = itBlob->GetCog();

                pSampleOut->m_sample.m_aPoints[eAdinsIdtBasePointCenter].m_bValid = true;
                pSampleOut->m_sample.m_aPoints[eAdinsIdtBasePointCenter].m_dbX    = pt.first;
                pSampleOut->m_sample.m_aPoints[eAdinsIdtBasePointCenter].m_dbY    = pt.second;
                pSampleOut->m_sample.m_aPoints[eAdinsIdtBasePointCenter].m_dbZ    = 0.0;
            }

            if (m_flgsScalars.test(eAdinsIdtBaseScalarArea))
            {
                pSampleOut->m_sample.m_aScalars[eAdinsIdtBaseScalarArea].m_bValid  = true;
                pSampleOut->m_sample.m_aScalars[eAdinsIdtBaseScalarArea].m_dbValue = static_cast<double>(itBlob->m_area);
            }

            TIEXMTRACE("({:.2f}, {:.2f}) {}\n", pSampleOut->m_sample.m_aPoints[eAdinsIdtBasePointCenter].m_dbX,
                                                pSampleOut->m_sample.m_aPoints[eAdinsIdtBasePointCenter].m_dbY,
                                                pSampleOut->m_sample.m_aScalars[eAdinsIdtBaseScalarArea].m_dbValue);

            ++itBlob;
        }

        ++nSample;
    }
}


//----------------------------------------------------------------------------
// Function NCTiExmArenaTracker::LabelConnectedComponents
//----------------------------------------------------------------------------
// Description  : Two-pass connected component labeling using 8-connectivity.
//                
//                Pass 1: scan top-to-bottom, left-to-right. For every foreground pixel
//                        look at its already-visited neighbours (NW, N, NE, W). If none
//                        are labeled, give the pixel a new label. Otherwise inherit the
//                        smallest neighbour label and record that all visited neighbour
//                        labels are equivalent in the union-find.
//                
//                Pass 2: replace every label by the representative of its equivalence
//                        class, then renumber labels to be contiguous (1, 2, 3, ...).
// ---------------------------------------------------------------------------
NCTiExmBlobVector NCTiExmArenaTracker::LabelConnectedComponents(const NCTiExmImageView& crImgv, std::uint8_t threshold)
{
    const size_t w = crImgv.GetSize().cx;
    const size_t h = crImgv.GetSize().cy;
    
    std::vector<size_t> vecLabels(w * h, 0);
    
    NCTiExmUnionFind uf;
    uf.MakeSet();      // index 0 is reserved for background

    // Offsets to the four already-visited 8-connected neighbours.
    constexpr int dx[4] = {-1, 0, 1, -1};
    constexpr int dy[4] = {-1, -1, -1, 0};

    // ---- Pass 1 ----
    for (int y = 0; y < h; ++y) 
    {
        for (int x = 0; x < w; ++x) 
        {
            if (crImgv.GetPixel(x, y) < threshold)
            {
                continue;   // background pixel
            }

            size_t best = 0;
            for (int k = 0; k < 4; ++k) 
            {
                const int nx = x + dx[k];
                const int ny = y + dy[k];
                if (nx < 0 || nx >= w || ny < 0 || ny >= h) 
                    continue;
                
                // check for labeled neighbor pixel
                const size_t nl = vecLabels[ny * w + nx];
                
                if (nl != 0 && (best == 0 || nl < best))
                {
                    best = nl;
                }
            }

            if (best == 0) 
            {
                // no label detected; brand-new component
                best = uf.MakeSet();
            } 
            else 
            {
                // merge all neighbour labels with the chosen one.
                for (int k = 0; k < 4; ++k) 
                {
                    const int nx = x + dx[k];
                    const int ny = y + dy[k];
                    if (nx < 0 || nx >= w || ny < 0 || ny >= h)
                    {
                        continue;
                    }
                    
                    const size_t nl =vecLabels[ny * w + nx];
                    if (nl != 0)
                    {
                        uf.Unite(best, nl);
                    }
                }
            }

            vecLabels[y * w + x] = best;
        }
    }

    // ---- Pass 2: flatten labels and renumber them to 1..N ----
    std::vector<size_t> remap(uf.GetSize(), 0);
    size_t              nNextId = 0;
    for (size_t& rLabel : vecLabels) 
    {
        if (rLabel == 0)
        {
            continue;
        }

        const size_t root = uf.Find(rLabel);
        if (remap[root] == 0)
        {
            remap[root] = ++nNextId;
        }

        rLabel = remap[root];
    }

    // ---- Compute per-blob statistics in a single sweep ----
    NCTiExmBlobVector vecBlobs(nNextId);
    for (size_t i = 0; i < nNextId; ++i)
    {
        vecBlobs[i].m_id = i + 1;
    }

    for (int y = 0; y < h; ++y) 
    {
        for (int x = 0; x < w; ++x) 
        {
            const size_t lab = vecLabels[y * w + x];
            if (lab == 0)
            {
                continue;
            }
            
            NCTiExmBlob& rBlob = vecBlobs[lab - 1];
            rBlob.m_area += 1;
            rBlob.m_minX = std::min(rBlob.m_minX, x);
            rBlob.m_minY = std::min(rBlob.m_minY, y);
            rBlob.m_maxX = std::max(rBlob.m_maxX, x);
            rBlob.m_maxY = std::max(rBlob.m_maxY, y);
            rBlob.m_sumX += x;
            rBlob.m_sumY += y;
        }
    }

    return vecBlobs;
}
