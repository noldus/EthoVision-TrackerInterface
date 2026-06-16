//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   ScheduleEntry.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 31-01-2018 Viktor Kovács   - Original version
//----------------------------------------------------------------------------
include "..\\Entities\\Room.thrift"
include "..\\Entities\\File.thrift"
include "..\\Entities\\User.thrift"
include "..\\Types\\VisoTypes.thrift"
include "..\\..\\Common\\Types\\CommonTypes.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  Holds the information and data from one schedule entry
 */
struct ScheduleEntry
{
    /**  A unique identifier of the ScheduleEntry. */
    1: optional i32 id,

    /** A friendly name of the ScheduleEntry as seen in the user interface. */
    2: optional string title,

    /** The start date and time of recording for this ScheduleEntry. */
    3: optional CommonTypes.IsoDateTime startTime,

    /** The stop date and time of recording for this ScheduleEntry. */
    4: optional CommonTypes.IsoDateTime stopTime,
    
    /** The user who created the ScheduleEntry */
    5: optional User.User creator,

    /** The status of the ScheduleEntry. */
    6: optional VisoTypes.ECombinedStatus status,
        
    /** true if the ScheduleEntry is planned but not yet executed (was no turned into a session yet)*/
    7: optional bool IsPlanned,

    /** A Guid indicating in what separate batch the schedule or session owning this schedule entry is involved or null if not involved in any separate batch. */
    8: optional CommonTypes.GUID separateBatchId,
    
    /**  The original type of single, opcmposite or separate sessions */
    9: optional VisoTypes.EAppointmentType appointmentType,

    /** The creator of the scheduling/session can ask an assistant who can perform the annotations. */
    10: optional User.User annotator,
}

