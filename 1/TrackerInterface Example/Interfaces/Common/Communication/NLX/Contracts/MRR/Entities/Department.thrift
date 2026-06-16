//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   Department.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 23-08-2022 Viktor Kovacs   - Original version
//----------------------------------------------------------------------------
include "..\\Entities\\User.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  Represents a department
 */
struct Department
{
    /**  A unique identifier of the department. */
    1: optional i32 id,

    /** The name of the department. This must be unique. */
    2: optional string name,

    /** The user who created this department. */
    3: optional User.User creator,

    /** Copy Folder */
    4: optional string copyFolder
}