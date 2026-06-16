//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public contracts
// File       :   MarkerDefinitionList.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 24-10-2022 Tijmen van Voorthuijsen - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "MarkerDefinition.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** 
 *  A marker definition list is a container that holds a collection of marker defintions.
 */
struct MarkerDefinitionList
{
    /** Identifies the marker definition list. If the id is not specified, it means that the marker definition list is not present in 
    *   persistent storage, i.e. it is an ephemeral in-memory object.*/
    1: optional CommonTypes.GUID id,

    /** The name of the marker definition list, visible to the end-user.*/
    2: optional string displayName,

    /** The list of marker definitions owned by this marker definition list. There can be zero to N marker definitions.*/
    3: optional list<MarkerDefinition.MarkerDefinition> markerDefinitions
}
