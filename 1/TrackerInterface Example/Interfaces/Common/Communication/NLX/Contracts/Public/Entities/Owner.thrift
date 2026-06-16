//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   Owner.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Public.Entities

/** The owner identifies the entity or platform concept that is using another entity. It also leaves room for adding possible other relevant data about the owner. */
struct Owner
{
    /** Identifies the owner of an entity.*/
    1: optional CommonTypes.GUID id,

    /** Specify true if this owner has selected the entity, e.g. for making a recording. Otherwise false. */
    2: optional bool selected,
}
