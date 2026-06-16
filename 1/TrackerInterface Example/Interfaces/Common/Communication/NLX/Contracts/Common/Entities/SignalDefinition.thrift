//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   SignalDefinition.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 14-03-2023 Rogier Giesen - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "SignalDefinitionDisplay.thrift"
include "SignalDefinitionStorage.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** The SignalDefinition represents the entity in the platform that identifies data that are collected (raw) or processed for a certain device. 
*/
struct SignalDefinition
{
    /** Identifier of this Signal entity. This identifier is guaranteed to be unique within the platform. It does not represent the storage id because ephemeral signals, 
    *   those that are discovered but not selected in a device, have also a unique id. */
    1: optional CommonTypes.GUID signalId,

    /** The name given to the SignalDefinition that is used in the backend.*/
    2: optional string name,

    /** Information on how to display a signal.*/
    3: optional SignalDefinitionDisplay.SignalDefinitionDisplay displayInfo,

    /** Location where the signal is stored.*/
    4: optional SignalDefinitionStorage.SignalDefinitionStorage storageLocation
}
