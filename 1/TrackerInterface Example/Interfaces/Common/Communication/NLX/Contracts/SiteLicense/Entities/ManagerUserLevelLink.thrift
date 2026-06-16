//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   SLClient
// Module     :   NoldusSiteLicenseCommunication
// File       :   ManagerUserLevelLink.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 11-10-2015   Laszlo Abari-Toth                    - Original version
//----------------------------------------------------------------------------
//include "..\\Types\\SiteLicenseTypes.thrift"
include "..\\..\\Common\\Types\\CommonTypes.thrift"


namespace * Noldus.NLinx.Contracts.SiteLicense


/**  
* Holds the information of  users
*/
struct SLMBusEntUser 
 {
        /** The user displayname */
        1 : optional string DisplayName;

        /** The user's name	*/
        2 : optional string UserName;

        /** The user's ID */
        3 : optional i32 Id;
}


/**  
* Holds the information of  user Levels
*/
struct SLMBusEntUserLevel
{
        /** The userlevel's name */
        1 : optional string  UserLevelName;

        /** The product's ID */
        2 : optional i32	 ProductId;

        /** The userlevel's ID */
        3 : optional i32	 Id;
}	


/**  
* Linking information between  user and user level 
*/
struct SLMBusEntUserAndUserLvlLink
 {
        /** The link user's  id. */
        1 : optional i32	UserLinkId;

        /** The link's user. */
        2 : optional SLMBusEntUser	User;

        /** The link's level id.*/
        3 : optional i32	UserLvlLinkId;

        /** The link userlevel. */
        4 : optional SLMBusEntUserLevel UserLevel;

        /** Is the user online. */
        5 : optional bool 								IsUserOnline;

        /** When did he/she logged in. */
        6 : optional CommonTypes.IsoDateTime 			LoginDate;

        /** When did he/she send the latest keep alive signal. */
        7 : optional CommonTypes.IsoDateTime 			LastAliveSignal;

        /** Which computer did he/she logged in from. */
        8 : optional string 							LogedInFrom;

        /** The link's ID */
        9 : optional i32								Id;

        /** The computer's IP address. */
        10 : optional string							IPAddress;

        /** The computer's GUID. */
        11 : optional CommonTypes.GUID					ComputerId;
}


/**
* List of Users 
*/
struct SLMBusEntUserList
{
    /** The list of SLMBusEntUser. */
    1: required list<SLMBusEntUser> UserList
}

/**  List of User levels*/
struct SLMBusEntUserLevelList
{
    /** The list of SLMBusEntUserLevel. */
    1: required list<SLMBusEntUserLevel> UserLevelList
}

/**List of User-Userlevel links */
struct SLMBusEntUserAndUserLvlLinkList
{
    /** The list of SLMBusEntUserAndUserLvlLink. */
    1: required list<SLMBusEntUserAndUserLvlLink> UserAndUserLevelList
}

