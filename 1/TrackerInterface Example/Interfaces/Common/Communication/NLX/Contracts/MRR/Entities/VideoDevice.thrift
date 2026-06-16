//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   MRR
// Module     :   Noldus.Mrr.Contracts
// File       :   VideoDevice.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 13-05-2015 Jeroen Diederix           - Original version
//----------------------------------------------------------------------------
include "..\\Types\\VisoTypes.thrift"
include "..\\Entities\\PtzSettings.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  An entity that contains the specific video properties of a channel
 */
struct VideoDevice
{
    /**  A unique identifier of the device. */
    1: optional i32 id,

    /**  The video resolution */
    2: optional VisoTypes.IntSize resolution,

    /**  The number of frames per second */
    3: optional i32 framesPerSecond,

    /**  The encoding interval */
    4: optional i32 encodingInterval,

    /**  The encoding bit rate in bits per second */
    5: optional i32 bitrate,

    /**  The GOV length determines how many frames of the one type (I or P) are sent before the next type is sent. */
    6: optional i32 govLength,

    /**  The encoding quality parameter */
    7: optional i32 quality,

    /**  The encoding profile name */
    8: optional string encodingProfile,

    /**  An optional RTSP connections string in case the device is not ONVIF capable */
    9: optional string connectionString,

    /**  An optional RTSP connections string in case the device is not ONVIF capable */
    10: optional PtzSettings.PtzSettings ptzSettings

}