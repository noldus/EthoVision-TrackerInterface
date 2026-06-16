//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   Media.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 16-04-2015 Gabriela Ignacio      - Original version
//----------------------------------------------------------------------------
include "..\\Entities\\Video.thrift"
include "..\\Types\\VisoTypes.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  Represents the media (video/audio) related properties of a session
 */
struct Media
{
    /**  A unique identifier of the media. */
    1: optional i32 id,

    /** The list of videos recorded in this session (also contains video file references). */
    2: optional list<Video.Video> recordedVideos,

    /** DEPRECATED since R6. Property is moved to SessionLayoutSettings.VideoLayout.
     *  The layout of the videos when the session was recorded. */
    3: optional VisoTypes.EVideoLayout videoLayout,

    /** True if 'Select audio device to use for all videos (line-in only)' was selected for recording */
    4: optional bool recordedSameAudioForAll
}

