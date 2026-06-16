//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   MarkerDefinition.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 15-12-2014 Gabriela Ignacio          - Original version
//----------------------------------------------------------------------------

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  Holds unique information of a marker, like the name of a marker.
 *  This information is shared among markers in different codes lists.
 *  Eg.: marker definition A can be used in codes list C and B with different key codes or colors.
 */
struct MarkerDefinition
{
    /**  A unique identifier of the marker definition. */
    1: optional i32 id,

    /** The name of the marker definition. */
    2: optional string name,

    /** The flag for marking marker definition used only for one session. */
    3: optional bool isPrivate
}

