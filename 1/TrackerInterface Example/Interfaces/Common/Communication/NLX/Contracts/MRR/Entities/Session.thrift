//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   Session.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 07-11-2014 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------
include "..\\Entities\\Room.thrift"
include "..\\Entities\\File.thrift"
include "..\\Entities\\Media.thrift"
include "..\\Entities\\User.thrift"
include "..\\Entities\\EventLog.thrift"
include "..\\Entities\\SessionRoomMedia.thrift"
include "..\\Entities\\SessionSettings.thrift"
include "..\\Entities\\ScheduleEntry.thrift"
include "..\\Types\\VisoTypes.thrift"
include "..\\..\\Common\\Types\\CommonTypes.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso


/**
 *  Holds the information and data from one recording session.
 */
struct Session
{
    /**  A unique identifier of the session. */
    1: optional i32 id,

    /** The room or location in which this session was recorded. */
    3: optional Room.Room room,
   
    /** The list of file references to the video files recorded in this session. */
    6: optional list<File.File> recordedFiles,

    /** When a user uses a session to edit markers and comments the session is locked from other users. Other users can only view the session but not change events. */
    7: optional User.User lockedBy,

    /** The date and time when the user locked the session for editing. */
    8: optional CommonTypes.IsoDateTime lockedTime,

    /** The event log of the session. */
    10: optional EventLog.EventLog eventLog,

    /** DEPRECATED since R6. Please use SessionRoomMedia instead! */
    11: optional Media.Media media,

    /** The SessionRoomMedia of the recorded session. */
    13: optional list<SessionRoomMedia.SessionRoomMedia> sessionRoomMedia,

    /** The duration of the longest video file in a session that determines the session length. Each unit represents 100 nanoseconds. */
    14: optional i64 sessionDuration,

    /** DEPRECATED since R7. Use ScheduleEntry.SeparateBatchId instead to determine. */
    15: optional bool IsSeparateSessions,

    /** Session persistency settings. */
    16: optional SessionSettings.SessionSettings sessionSettings,

    /** An (optional) Appointment Id associated with this session. */
    17: optional i32 appointmentId,

    /** Specifies how the session was started, manually or via scheduler. */
    18: optional VisoTypes.ESessionStartingType sessionStartingType,

    /** DEPRECATED since R7. Use ScheduleEntry.SeparateBatchId instead. */
    19: optional CommonTypes.GUID separateSessionsBatchId,

    /** From Viso R7 this field is used to transfer the schedule Entry contents*/
    20: optional ScheduleEntry.ScheduleEntry scheduleEntry,

    /** Session imported flag */
    21: optional bool imported,

    /** Session secured flag */
    22: optional bool secured

}

