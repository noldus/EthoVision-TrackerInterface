//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   ChannelSettings.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 08-05-2015 Jeroen Diederix           - Original version
//----------------------------------------------------------------------------
include "..\\Entities\\VideoDevice.thrift"
include "..\\Entities\\AudioDevice.thrift"


namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  Represents the video device settings
 */
struct ChannelSettings
{
    /** A unique identifier of the settings */
    1: optional i32 id,

    /** The index of this video channel, used to make the order persistent */
    2: optional i32 channelIndex,

    /** Flag that indicated whether this device is enabled */
    3: optional bool enabled,

    /** The name of the device */
    4: optional string name,

    /** The Ip adress of the device */
    5: optional string ipAddress,

    /** The port to which to connect */
    6: optional i32 port,

    /** DEPRECATED since R11 for security */
    /** The user name to connect to the device */
    7: optional string userName,

    /** DEPRECATED since R11 for security */
    /** The password to connect to the device */
    8: optional string password,

    /** The properties of the video device */
    9: optional VideoDevice.VideoDevice videoDevice,

    /** The properties of the audio device */
    10: optional AudioDevice.AudioDevice audioDevice,

    /** True if the current channel's audio is used for all the channels */
    11 : optional bool useAudioForAll,

    
    /** The user name to connect to the device */
    12: optional string userNameEncoded,

    /** The password to connect to the device */
    13: optional string passwordEncoded

}

