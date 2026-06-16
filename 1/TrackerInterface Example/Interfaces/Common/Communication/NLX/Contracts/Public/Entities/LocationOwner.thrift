//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   LocationOwner.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** The location owner identifies who is using a location and possible other important data like if the location is in use. */
struct LocationOwner
{
    /** Identifies an owner of a location.*/
    1: optional CommonTypes.GUID id,

    /** Specify true if this owner is using the location, for planning or making a recording. The location is then locked by this owner. Specify false when the 
    *   location is not currently in use by the owner. */
    2: optional bool locked,

    /** Specify true if the owner has selected the location for making recordings. Specify false when the location is not selected by the owner.*/
    3: optional bool selected
}
