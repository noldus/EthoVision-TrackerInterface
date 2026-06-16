//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public contracts
// File       :   MarkerDefinition.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 24-10-2022 Tijmen van Voorthuijsen - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** 
 *  Defines the properties of a marker. Marker definitions are used for scoring point events that have no duration.
 */
struct MarkerDefinition
{
    /** Identifies the marker definition. If the id is not specified, it means that the marker definition is not present in 
    *   persistent storage, i.e. it is an ephemeral in-memory object.*/
    1: optional CommonTypes.GUID id,

    /** The name of the marker definition, visible to the end-user.*/
    2: optional string displayName,

    /** The color of the marker definition, as ARGB value.*/
    3: optional CommonTypes.Color color,

    /** The shortcut key, used to score a marker event.*/
    4: optional string shortcutKey,

    /** Indicates if this marker definition is removed and cannot be used for scoring anymore.*/
    5: optional bool isDeleted

}
