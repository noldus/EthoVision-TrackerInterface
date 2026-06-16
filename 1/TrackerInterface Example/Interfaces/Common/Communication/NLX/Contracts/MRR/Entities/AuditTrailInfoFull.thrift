//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   MRR
// Module     :   Noldus.Mrr.Contracts
// File       :   AuditTrailInfoFull.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 21-11-2018 Laszlo Abari-Toth         - Original version
//----------------------------------------------------------------------------
include "..\\Types\\VisoTypes.thrift"
include "..\\..\\Common\\Types\\CommonTypes.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  Full textual information for Audit Trail with timestamp
 */
struct AuditTrailInfoFull
{
    /** User name */
        1:  optional string User,

    /** Location name if applicable */
        2:  optional string Location,

    /** Session name if applicable */
        3:  optional string Session,

    /** audit info description */
        4:  optional string AuditInfo,

    /** audit info type */
        5:  optional VisoTypes.EAuditAction AuditAction,

    /** time of the log entry */
        6: optional CommonTypes.IsoDateTime logTime,
    
    /** Group name if applicable */
        7:  optional string Group

}

