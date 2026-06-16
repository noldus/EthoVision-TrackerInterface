//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   File.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 02-12-2014 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  Represents a reference to a recorded video file.
 */
struct File
{
    /**  A unique identifier of the file. */
    1: optional i32 id,

    /** The full file path to the video file. */
    2: optional string path,
    
    /** True when the file has been moved to the central storage location of video files. False when the file is still on the recorder computer. */
    3: optional bool isArchived
}

