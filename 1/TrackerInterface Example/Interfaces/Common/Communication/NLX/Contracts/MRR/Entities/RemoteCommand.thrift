//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   RemoteCommand.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 30-05-2022 Krizsán Péter   - Original version
//----------------------------------------------------------------------------
include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\Entities\\Room.thrift"
include "..\\Entities\\User.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  Represents a unique token that is used as a
 *  remote command for a certain user in the specified room.
 */
struct RemoteCommand
{
    /** The user entity this command belongs to */
    1: optional User.User user,

    /** The room entity this command belongs to */
    2: optional Room.Room room,

    /** The unique token in a guid form of the remote command  */
    3: optional CommonTypes.GUID token
}

