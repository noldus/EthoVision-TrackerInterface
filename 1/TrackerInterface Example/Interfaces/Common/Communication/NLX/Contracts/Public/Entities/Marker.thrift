//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public contracts
// File       :   Marker.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 16-11-2022 Adrian Kovacs - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** 
 *  Defines the properties of a marker. Markers are combined from AbstractEvent and MarkerDefinition.
 */
struct Marker
{
    /** The marker Id. */
    1: optional CommonTypes.GUID id,

    /** The start time of an event. */
    2: optional CommonTypes.UnixTime startTime,

    /** The observer, who scored the marker */
    3: optional string scorerId,

    /** The id of the marker definition */
    4: optional CommonTypes.GUID markerDefinitionId,

    /** The name of the marker definition, visible to the end-user.*/
    5: optional string displayName,

    /** The color of the marker definition, as ARGB value.*/
    6: optional CommonTypes.Color color,
}
