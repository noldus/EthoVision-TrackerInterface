//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   MediaSettings.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 08-05-2015 Jeroen Diederix           - Original version
//----------------------------------------------------------------------------
include "..\\Entities\\ChannelSettings.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
*  Represents the media settings (video/audio) related properties of a session
*/
struct MediaSettings
{
    /**  A unique identifier of the media. */
    1: optional i32 id,

    /** The list of videos device settings */
    2 : optional list<ChannelSettings.ChannelSettings> channelSettings,

    /** True if we are using one of the channels audio device for all of the channels */
    3: optional bool selectAudioDeviceForAll
}

