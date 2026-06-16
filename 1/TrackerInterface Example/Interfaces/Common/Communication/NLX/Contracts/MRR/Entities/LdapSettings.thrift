//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   MRR
// Module     :   Noldus.Mrr.Contracts
// File       :   LdapSettings.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 29-09-2015 Krizsán Péter             - Original version
// 13-11-2015 Rogier Giesen             - Adding synchronization
//----------------------------------------------------------------------------
include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\Entities\\Schedule.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  An entity that contains the ldap settings
 */
struct LdapSettings
{
    /**  A unique identifier of the ldap settings */
    1: optional i32 id,

    /** Hostname or IP of the LDAP server */
    2: optional string hostName,

    /** Domain name of LDAP connection */
    3: optional string domain,

    /** Port number of the LDAP server */
    4: optional i32 port,

    /** Username used for the connection */
    5: optional string userName,

    /** Password for the username */
    6: optional string password,

    /** Customization string for queries */
    7: optional string baseDN

    /** Recurring schedule */
    8: optional Schedule.Schedule schedule
   }