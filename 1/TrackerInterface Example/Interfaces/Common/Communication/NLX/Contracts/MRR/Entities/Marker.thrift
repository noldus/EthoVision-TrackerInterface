//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   Marker.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 15-12-2014 Gabriela Ignacio      - Original version
//----------------------------------------------------------------------------
include "..\\Entities\\MarkerDefinition.thrift"
include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\Types\\VisoTypes.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  Holds the information and data of one marker.
 */
struct Marker
{
    /**  A unique identifier of the marker. */
    1: optional i32 id,

    /** The marker definition of the marker, extended information about the marker. */
    2: optional MarkerDefinition.MarkerDefinition markerDefinition,

    /**  A key code to score the marker. */
    3: optional string key,

    /**  The color that is used to show this marker. */
    4: optional CommonTypes.Color color,

    /**  The order index, to maintain the ordering of the markers in the codes list. */
    5: optional i32 orderIndex,

    /**  The shape of the marker */
    6: optional VisoTypes.EMarkerShapes shape
}

