//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   Stream.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 07-11-2014 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------
include "..\\Types\\VisoTypes.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  Holds the information and data from one stream.
 */
struct Stream
{
    /** A unique identifier of the stream. */
    1: optional i32 id,
    
    /** The optinal stream url */
    2: optional string url,

    /** The optional PTZ control's Id */
    3: optional i32 ptzSettingsId,

    /** Status information, is the stream OK or reason of failure */
    4: optional VisoTypes.EAudioVideoDeviceStatus status,

    /** True if that is a combined stream made by merging other streams to PbP or PiP */
    5: optional bool combinedStream
}

