//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public contracts
// File       :   WebRtcSource.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 28-09-2021 Tijmen van Voorthuijsen - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Entities\\Process.thrift"
include "..\\..\\Common\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** 
 *  Holds information on one WebRtc video source. This information is used for establishing a WebRtc channel for recording.
 */
struct WebRtcSource
{
    /** Identifies the WebRtc streaming channel. This is a runtime identifier and changes value each time the caller page is refreshed. It is 
    *   used for WebRtc streaming logic between frontend and backend video web service.*/
    1: optional CommonTypes.GUID streamId,

    /** The webRtc streaming channel name. These are reserved words, similar to ["screensharereceiver", "videoreceiver"].*/
    2: optional string streamName,

    /** The next field is OBSOLETE. Don't renumber the remaining fields! */
    /** 3: optional Process.Process nlinxVirtualVideoProcess */

    /** The friendly name of the video device. This name will be used in the user interface. These can be words like "Web cam" or "Screen capture".*/
    4: optional string name,

    /** A friendly name of the computer or device the web video source is located.*/
    5: optional string machineName,

    /** A unique identifier of the computer or device the web video source is located.*/
    6: optional CommonTypes.GUID machineId,

    /** SignalR connection id.*/
    7: optional string connectionId
}
