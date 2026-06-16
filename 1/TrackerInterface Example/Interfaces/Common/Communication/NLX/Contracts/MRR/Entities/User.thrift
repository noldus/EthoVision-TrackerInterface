//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   User.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 02-12-2014 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------
include "..\\Types\\VisoTypes.thrift"
include "..\\Entities\\UserProfile.thrift"
include "..\\Entities\\UserSettings.thrift"
include "..\\..\\Common\\Types\\CommonTypes.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Entities
namespace * Noldus.NLinx.Contracts.Viso

/**
 *  Represents a single user in the Viso solution.
 */
struct User
{
    /**  A unique identifier of the user. */
    1: optional i32 id,

    /** The user name used for logging in. For example: JB. */
    2: optional string userName,
    
    /** The full name of the user that is shown in the user interface, for example Isaac Mendez. */
    3: optional string fullName,

    /** The first name of the user that is shown in the user interface, for example Isaac. */
    5: optional string firstName,

    /** The last name of the user that is shown in the user interface, for example Mendez. */
    6: optional string lastName,

    /** The user profile which contains the users rights */
    7: optional UserProfile.UserProfile profile,

    /** True if the user should be authenticated via an LDAP server, false otherwise */
    8: optional bool isDomainUser,

    /** A unique guid to identify the device on which user is logged in */
    9: optional CommonTypes.GUID deviceId,

    /** When NotRemoved the user can login and use the Viso solution. Otherwise the user cannot login. The Viso administrator can add or remove a user. */
    10: optional VisoTypes.EUserRemovedStatus userRemovedStatus,

    /** User persistency settings. */
    11: optional UserSettings.UserSettings userSettings,

    /** The number of invalid retries for the given user. After 3 retries the user is locked out for 15 minutes */
    12: optional i32 nrRetries,

    /** last failed login attempt */
    13: optional CommonTypes.IsoDateTime lastTimeFailed,

    /** Indicates whether we should hide the data consent dialog for this user on login. */
    14: optional bool hideDataConsent,

    /** User needs to change password  */
    15:optional bool needsPasswordChange
}

