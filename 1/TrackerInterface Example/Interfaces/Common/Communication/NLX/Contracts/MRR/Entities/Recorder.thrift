//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   Recorder.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 02-12-2014 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------
include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\Entities\\Machine.thrift"
include "..\\Entities\\MediaSettings.thrift"
include "..\\Types\\VisoTypes.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  Represents a Viso Recorder device.
 */
struct Recorder
{
    /** A unique identifier of the Viso Recorder device. */
    1: optional i32 id,

    /** A (fixed) GUID identifier of a Viso Recorder instance. This identifier is created once at the first start up of the Viso Recorder application.  */
    2: optional CommonTypes.GUID deviceId,

    /** A physical machine on which this recorder is running */
    3: optional Machine.Machine machine,

    /** A flag that indicates whether or not this recorder should be started automatically */
    4: optional bool startup,

    /** The settings for the video and audio of this recorder */
    5: optional MediaSettings.MediaSettings mediaSettings,

    /** The status of the Recorder, see ERecorderStatus for more details. */
    6: optional VisoTypes.ERecorderStatus recorderStatus
}

