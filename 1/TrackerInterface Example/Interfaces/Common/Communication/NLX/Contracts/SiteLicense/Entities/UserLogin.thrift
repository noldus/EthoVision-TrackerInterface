//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   SLClient
// Module     :   NoldusSiteLicenseCommunication
// File       :   UserLogin.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 11-08-2015                           - Original version
//----------------------------------------------------------------------------
include "..\\..\\Common\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.SiteLicense

/**
* Result of the login
*/
enum LoginResultId
{

    /** Unknown result */
    UNKNOWN_FAIL			= 0,

    /** Login succcessful */
    SUCCESS					= 1,

    /** Invalig username or password */
    INVALID_USERNAME		= 2,

    /** User allready logged in on other computer */
    ALREADY_LOGGED_IN		= 3,

    /** license not found */
    MISSING_LICENSE			= 4,

    /** Communication error */
    CONNECTION_TIME_OUT		= 5,

    /** No More free license for the app  */
    NO_MORE_FREE_LICENSE	= 6,

    /** License expired */
    LICENSE_EXPIRED			= 7,

    /** User have no rigts for this app */
    USER_HAVE_NO_RIGHTS		= 8,

    /** Guest login not allowed by the admin */
    ADMIN_BANS_GUEST_LOGIN	= 9,

    /** too much different in system time between client and server  */
    PROBLEM_WITH_TIME_SYNC	= 10,

    /** wrong data in login */
    LOGIN_DATA_MISSING		= 11,

}

/**
* Result of License check
*/
enum CheckLicenseResult
{

    /** No valid License exist for this product*/
    NoValidLicense      = 0,

    /** No valid License exist for this product*/
    ValidLicense        = 1,

    /** No valid normal and guest License exist for this product*/
    ValidLicenseGuest   = 2,
}


/**
* Result of Login
*/
struct LoginResult
{
    /** Result ID*/
    1 : required    i32 ResultID,

    /** Result Message (detail from Service)*/
    2 : required    string ResultMessage,

    /** Product code which is connected to the user*/
    3 : optional    i32 ProductID,

    /** License Number*/
    4 : optional    string LicenseNum,

    /** Validity of license*/
    5 : optional	i32 DaysLeft,
}

/**
* Application ID
*/
struct ProgramID
{
    /** Program ID*/
    1 : required i32 ProgID;
}


/**
* User datas tor login
*/
struct UserLogin
{
    /** Computer Hardware ID */
    1 : optional 	CommonTypes.GUID ComputerID,

    /** Name of computer */
    2 : optional    string ComputerName,

    /** Product IDs for client application */
    3 : optional 	list<ProgramID> ProductList,

    /** Application Version number */
    4 : optional 	i32 AppVerMajor,

    /** User name */
    5 : optional 	string UserName,

    /** Password (encrypted) */
    6 : optional 	string Password,

    /** Current time of client */
    7 : optional	CommonTypes.IsoDateTime LoginTime,

    /** IP address of client */
    8 : optional	string IPAddress,
}

/**
* Result of Logoff
*/
struct UserLogoff
{
    /** Computer Hardware ID */
    1 : optional 	CommonTypes.GUID ComputerID,

    /** Name of computer */
    2 : optional    string ComputerName,

    /** Product ID of client application */
    3 : optional 	i32 AppID,

    /** Application Version number */
    4 : optional 	i32 AppVerMajor,

    /** User name */
    5 : optional 	string UserName,
}

/**
* User data to Password change 
* Not implemented in this version
*/
struct UserChangePassword
{
    /** Computer Hardware ID */
    1 : optional 	CommonTypes.GUID ComputerID,

    /** Name of computer */
    2 : optional    string ComputerName,

    /** Product ID of client application */
    3 : optional 	i32 AppID,

    /** Application Version number */
    4 : optional 	i32 AppVerMajor,

    /** User name */
    5 : optional 	string UserName,

    /** Old User Password */
    6 : optional 	string OldPassword,

    /** New User Password */
    7 : optional 	string NewPassword,

}
