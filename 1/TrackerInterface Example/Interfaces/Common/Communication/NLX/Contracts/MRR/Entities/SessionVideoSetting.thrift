//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   MRR
// Module     :   Noldus.Mrr.Contracts
// File       :   SessionVideoSetting.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 28-04-2017 Dragana Verpoort Petric           - Original version
//----------------------------------------------------------------------------
include "..\\Entities\\Media.thrift"
include "..\\Entities\\Video.thrift"
include "..\\Types\\VisoTypes.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  The session's video settings. 
 */
struct SessionVideoSetting
{
    /** A unique identifier of the file. */
    1: optional i32 id,

    /** Media of the session for which settings are saved. */
    2: optional Media.Media media,
    
    /** The video for which layout settings are saved. */
    3: optional Video.Video video,

    /** True is video is enabled, false otherwise. */
    4: optional bool isVideoEnabled,
    
    /** Video order index. */
    5: optional i32 videoOrderIndex,
    
    /** True if audio is enabled, false if audio is muted. */
    6: optional bool isAudioEnabled,
    
    /** Audio volume level per video. */
    7: optional double audioLevel,
}