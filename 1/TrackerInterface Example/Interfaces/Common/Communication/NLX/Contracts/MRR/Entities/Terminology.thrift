//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   Terminology.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 15-08-2016 Cecilia Herrera   - Original version
//----------------------------------------------------------------------------
include "..\\Types\\VisoTypes.thrift"
include "..\\..\\Common\\Types\\CommonTypes.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  An entity that contains the terminology settings
 */
struct Terminology
{
    /**  A unique identifier of the room. */
    1: optional i32 id,

    /** The enum of the terminology. */
    2: optional VisoTypes.ETerminologyItem item,

    /** The item name. */
    3: optional string itemName,

    /** The user-defined singular term. */
    4: optional string singularText,

    /** The user-defined plural term. */
    5: optional string pluralText
}

