//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   SignalGroup.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 14-04-2022 Cecilia Herrera - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "Signal.thrift"
include "Owner.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** The SignalGroup represents the entity in the platform that identifies the signal group that is selected for a device.
* Examples of signal grups: FacialExpressions and ParticipantView for a Webcam device. 
*/
struct SignalGroup
{
    /** Identifier of this SignalGroup entity. This identifier is guaranteed to be unique within the platform. It does not represent the storage id because  
    *   ephemeral signal groups, those that are discovered but not selected for a device, have also a unique id. */
    1: optional CommonTypes.GUID id,

    /** Name of the signal group. */
    2: optional string name,

    /** Specifies a list of signals under the signal group that are selected for the device. For example, for FacialExpression signal group
    *   you can have Happy and Sad signals.*/
    3: optional list<Signal.Signal> signals, 

    /** Specifies a list of entities who selected the signal group. For example the signal group can be selected by a project or not. */
    4: optional list<Owner.Owner> owners, 
}
