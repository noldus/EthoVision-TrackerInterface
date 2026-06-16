//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   Appointment.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 12-04-2014 Rogier Giesen   - Original version
//----------------------------------------------------------------------------
include "..\\Entities\\User.thrift"
include "..\\Entities\\Room.thrift"
include "..\\Entities\\ScheduleEntry.thrift"
include "..\\Entities\\Session.thrift"
include "..\\Entities\\SessionInvite.thrift"
include "..\\Entities\\AppointmentRoom.thrift"
include "..\\Types\\VisoTypes.thrift"
include "..\\..\\Common\\Types\\CommonTypes.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso


/**
 *  Holds the information and data from one Appointment.
 */
struct Appointment
{
    /**  A unique identifier of the appointment. */
    1: optional i32 id,

    /** The list of invites (for participants.) */
    8: optional list<SessionInvite.SessionInvite> sessionInvites,

    /** The list of locations. */ 
    9: optional list<AppointmentRoom.AppointmentRoom> locations,

    /** User which locked the appointment. */ 
    10: optional User.User AppointmentLockedBy,

    /** From Viso R7 this field is used to transfer the schedule Entry contents*/
    11: optional ScheduleEntry.ScheduleEntry scheduleEntry
}