//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   UserProfile.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 02-12-2014 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  Represents a single user profile in the Viso solution.
 */
struct UserProfile
{
    /** A unique identifier of the user. */
    1: optional i32 id,

    /** The user profile name. */
    2: optional string name,

    /** The user-right flags */
    3: optional i64 rights,

    /** The user profile type. */
    4: optional i32 profileType,
}
