//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   SessionInviteRoom.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 03-03-2017 Dragana Verpoort Petric          - Original version
//----------------------------------------------------------------------------
include "..\\Entities\\Room.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  Holds information about the pair of room and session invite. 
 *  Room for which session invite is created.
 */
struct SessionInviteRoom
{
    /**  A unique identifier of the session invite room. */
    1: optional i32 id,

    /** Room which is part of the session for which session invite is created. */
    2: optional Room.Room room
}

