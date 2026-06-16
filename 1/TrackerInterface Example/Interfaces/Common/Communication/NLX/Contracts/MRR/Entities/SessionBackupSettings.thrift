//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   MRR
// Module     :   Noldus.Mrr.Contracts
// File       :   SessionBackupSettings.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 25-07-2016 Péter Krizsán                 - Original version
//----------------------------------------------------------------------------
include "..\\Entities\\Schedule.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 * Struct to hold settings of the backup.
 */
struct SessionBackupSettings
{
    /** Location to copy the files to */
    1: optional i32 id,

    /** Location to copy the files to */
    2: optional string copyLocation,

    /** Recurring schedule */
    3: optional Schedule.Schedule schedule
}
