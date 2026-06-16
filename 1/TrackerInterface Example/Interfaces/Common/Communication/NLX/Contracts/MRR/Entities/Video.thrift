//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   Video.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 16-04-2015 Gabriela Ignacio      - Original version
//----------------------------------------------------------------------------

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  Represents a recorded video with its reference to file and its layout information.
 */
struct Video
{
    /**  A unique identifier of the file. */
    1: optional i32 id,

    /** The full file path to the video file. */
    2: optional string path,
    
    /** True when the file has been moved to the central storage location of video files. False when the file is still on the recorder computer. */
    3: optional bool isArchived,
    
    /** DEPRECATED since R6. Property is moved to SessionVideoSettings.IsVideoEnabled.
     *  True if the video is visible on the screen. */
    4: optional bool isVisible,

    /** DEPRECATED since R6. Property is moved to SessionVideoSettings.OrderIndex.
     *  The order in which the video is shown on the screen. */
    5: optional i32 orderIndex
}

