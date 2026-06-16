//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   Signal.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 14-04-2022 Cecilia Herrera - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** The Signal represents the entity in the platform that identifies data that are collected (raw) or processed for a certain device. 
* Examples of signals: ECG, HR, and IBI signals for the Shimmer ECG device. 
*/
struct Signal
{
    /** Identifier of this signal entity. This identifier is guaranteed to be unique within the platform. It does not represent the storage id because ephemeral signals, 
    *   those that are discovered but not selected in a device, have also a unique id. */
    1: optional CommonTypes.GUID id,

    /** The name given to the signal that is often used in the user interface.*/
    2: optional string name,
}
