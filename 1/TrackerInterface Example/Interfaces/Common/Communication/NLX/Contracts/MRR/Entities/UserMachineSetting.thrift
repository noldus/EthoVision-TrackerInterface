//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   MRR
// Module     :   Noldus.Mrr.Contracts
// File       :   UserMachineSetting.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 26-04-2017 Dragana Verpoort Petric           - Original version
//----------------------------------------------------------------------------

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  The user machine list persistency settings. 
 */
struct UserMachineSetting
{
    /**  A unique identifier of the file. */
    1: optional i32 id,

    /** The machine id. */
    2: optional i32  machineId,

    /** True if machine locations list is expanded per user, false otherwise. */
    3: optional bool isExpanded
}