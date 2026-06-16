//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   MRR
// Module     :   Noldus.Mrr.Contracts
// File       :   SessionInvite.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 02-11-2015 Krizsán Péter             - Original version
//----------------------------------------------------------------------------
include "..\\Entities\\Session.thrift"
include "..\\Entities\\Room.thrift"
include "..\\Entities\\User.thrift"
include "..\\Entities\\Group.thrift"
include "..\\Entities\\SessionInviteRoom.thrift"
include "..\\..\\Common\\Types\\CommonTypes.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  Holds a session invitation instance
 */
struct SessionInvite
{
    /**  A unique identifier of the room. */
    1: optional i32 id,

    /** The invited user. */
    2: optional User.User invitedUser,

    /** The session where the user is invited to. */
    3: optional Session.Session session,

    /** The current room where the user is invited to. */
    /** deprecated 4: optional Room.Room room, **/

    /** The date when the invitation was created. */
    5: optional CommonTypes.IsoDateTime invitationDate,

    /** The user who made the invitation. */
    6: optional User.User invitedBy,

    /** The list of rooms of one session where the user is invited to. */
    7: optional list<SessionInviteRoom.SessionInviteRoom> sessionInviteRooms,

    /** True if invite is created for scheduled appointment, false for manual started session */
    8: optional bool isScheduled

    /** The planned stop date */
    9: optional CommonTypes.IsoDateTime plannedStopDate,

    /** if true, this invite applies for a group */
    10: optional bool isGroupInvite,

    /** if a group invite, contains the invited group */
    11: optional Group.Group invitedGroup,


}