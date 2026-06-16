//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   SLClient
// Module     :   NoldusSiteLicenseCommunication
// File       :   UserData.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 11-08-2015                           - Original version
//----------------------------------------------------------------------------
include "..\\..\\Common\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.SiteLicense

/**
*  The Status of the License
*/
enum StateId
{
    /** Unknown result */
    UNKNOWN_ERROR       = 0,

    /** License exist */
    SUCCESS             = 1,

    /** No License found */
    MISSING_LICENSE     = 4,

    /** Communication error */
    CONNECTION_TIME_OUT = 5,
}

/** 
* Result of GetRestriction
*/
struct RestrictionResult
{
    /** State */
    1 : optional    i32 State,

    /** Restriction bits*/
    2 : optional    i64 RestrictionsBits
}

/** 
* Information about the User/Application
*/
struct UserData
{
    /** Computer GUID */
    1 : optional 	CommonTypes.GUID ComputerID,

    /** Application (Dongle)ID */
    2 : optional 	i32 AppID,

    /** Application Version num.  */
    3 : optional 	i32 AppVerMajor,

    /** User name*/
    4 : optional 	string UserName
}

/**
* Information about the Application
*/
struct ProductData
{
    /** Application (Dongle)ID */
    1 : optional 	i32 AppID,

    /** Application Version num.  */
    2 : optional 	i32 AppVerMajor,
}
