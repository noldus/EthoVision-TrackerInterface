//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   Group.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 08-03-2022 Krizsán Péter   - Original version
//----------------------------------------------------------------------------
include "..\\Entities\\Department.thrift"
include "..\\Entities\\User.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  Represents a user group
 */
struct Group
{
    /**  A unique identifier of the group. */
    1: optional i32 id,

    /** The name of the group. This must be unique. */
    2: optional string name,

    /** The user who created this group. */
    3: optional User.User creator,

    /** True if the group is private and can be seen/used by the owner only. */
    4: optional bool isPrivate,

    /** Holds the department that this group belongs to. */
    5: optional Department.Department department
}