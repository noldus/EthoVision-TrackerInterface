//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   AuditService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 10-10-2018Viktor Kovacs           - Original version
//----------------------------------------------------------------------------
include "..\\Types\\VisoTypes.thrift"
include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"
include "..\\Entities\\AuditTrailInfoFull.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Services
namespace * Noldus.NLinx.Contracts.Viso

// Settings for this service
const i32         interfaceVersion  = 2;
const string      exchange          = "Noldus.NLinx.Viso.AuditService"
const string      routingKey        = "{84CA1BD7-83EA-4FEF-B46E-C46BC5C98324}"


/**
 *  Information for Audit Trail
 */
struct AuditTrailInfo
{
    /** User */
        1:  optional i32 UserId,

    /** Locatino Id if applicable */
        2:  optional i32 LocationId,

    /** Session id if applicable */
        3:  optional i32 SessionId,

    /** audit info description */
        4:  optional string AuditInfo,

    /** audit info type */
        5:  optional VisoTypes.EAuditAction AuditAction,
    
    /** Group if applicable */
        6:  optional i32 GroupId

}


struct AuditTrailInfoRequest
{
    /** User if applicable , empty if not filtered*/
        1:  optional string User,

    /** Location if applicable , empty if not filtered*/
        2:  optional string Location,

    /** Time interval of the log entry from (should always be set)*/
        3: optional CommonTypes.IsoDateTime logTimeFrom,

    /** Time interval of the log entry to (should always be set)*/
        4: optional CommonTypes.IsoDateTime logTimeTo
}


/**
 *  The AuditService
 */
service AuditService extends CommonService.CommonService
{
    /**
     * Send info for audit trail
     */
    void SendAuditTrailInfo(
            /** The room id */
            1: AuditTrailInfo info
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     * Get audit trail info
     */
    list<AuditTrailInfoFull.AuditTrailInfoFull> GetAuditTrailInfo(
            /** Filter criteria */
            1: AuditTrailInfoRequest filter            
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     * Callback kind of function for the case when the audit trail retention settings were changed.
     */
    void AuditTrailRetentionPolicyChanged() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
     * Callback function for the case when the audit trail Enabled or Disabled.
     */
    void AuditTrailEnabledChanged() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);
}