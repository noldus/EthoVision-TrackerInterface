//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   MRR
// Module     :   Noldus.Mrr.Contracts
// File       :   Schedule.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 29-09-2015 Rogier Giesen   - Original version
//----------------------------------------------------------------------------
include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\Types\\VisoTypes.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  An entity that contains settings for recurring tasks such as session backup and ldap synchronization.
 */
struct Schedule
{
        /**  A unique identifier of the schedule settings */
        1: optional i32 Id,

        /**  The recurence mode enum ESchedulerRecurrence */
        2: optional VisoTypes.ESchedulerRecurrence recurrenceMode,

        /** Time of day the recurrence should occur */
        3: optional CommonTypes.IsoDateTime timeOfDay,

        /**  Date and time of the latest successful occurrence */
        4: optional CommonTypes.IsoDateTime latestTimeSuccessful,

        /** DEPRECATED since R6. Error message from (latest) occurrence. Gets set when an error occurs executing a recurring task.
         * Gets cleared the next time a user with session or LDAP management logs in (and the viewer shows this message) */
        5: optional string errorMessage,

        /** e.g. every x day(s), with x = DailyRecurrence */
        6: optional i32 dailyRecurrence,

        /** e.g every monday and friday of every x week(s), with x = WeeklyRecurrence */
        7: optional i32 weeklyRecurrence,

        /** Flagged enum. EDayOfWeek with Monday = 1. e.g. 5 = 4 + 1 = Monday and Friday */
        8: optional i32 weeklyDayOfWeek,

        /** e.g. the 4th of every x month(s), with x = MonthlyDomRecurrence */
        9: optional i32 monthlyDomRecurrence,

        /** e.g. the x-th of every 3 month(s), with x = MonthlyDomDay */
        10: optional i32 monthlyDomDay,

        /** e.g. the second Wednesday of every x month(s), with x = MonthlyDowRecurrence */
        11: optional i32 monthlyDowRecurrence,

        /** e.g. the x Wednesday of every 2 month(s), with x = MonthlyDowWeekOfMonth */
        12: optional VisoTypes.EWeekOfMonth monthlyDowWeekOfMonth,

        /** e.g. the second x of every 2 month(s), with x = MonthlyDowDayOfWeek */
        13: optional VisoTypes.EDayOfWeek monthlyDowDayOfWeek,

        /**  Date and time of the next occurrence */
        14: optional CommonTypes.IsoDateTime nextOccurrence,

        /** Error message type from (latest) occurrence. Gets set when an error occurs executing a recurring task.
         * Gets cleared the next time a user with session or LDAP management logs in (and the viewer shows this message) */
        15: optional VisoTypes.ESchedulerResult result

}