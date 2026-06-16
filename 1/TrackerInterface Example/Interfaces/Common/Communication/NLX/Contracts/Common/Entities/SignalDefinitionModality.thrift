//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   SignalDefinitionModality.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 14-03-2023 Rogier Giesen - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "SignalDefinition.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** The SignalDefinitionModality represents the entity in the platform that identifies data that are collected (raw) or processed for a certain device. 
*/
struct SignalDefinitionModality
{
    /** Identifier of this SignalDefinition entity. This identifier is guaranteed to be unique within the platform. It does not represent the storage id because ephemeral signals, 
    *   those that are discovered but not selected in a device, have also a unique id. */
    1: optional CommonTypes.GUID id,

    /** The name given to the Modality that is used in the backend.*/
    2: optional string name,

    /** The short name given as prefix to the SignalDefinition that is often used in the user interface.*/
    3: optional string displayname,

    /** The type of vizualization (DataViewerPanel/OverlayViewerPanel) .*/
    4: optional string visualization,

    /** The list of signals definitions owned by this modality. There can be zero to n definitions.*/
    5: optional list<SignalDefinition.SignalDefinition> signals
}
