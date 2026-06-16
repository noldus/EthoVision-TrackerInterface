//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Viso Contracts
// File       :   SecurityService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 07-11-2014 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------
include "..\\Entities\\User.thrift"
include "..\\Entities\\Group.thrift"
include "..\\Entities\\Department.thrift"
include "..\\Entities\\UserProfile.thrift"
include "..\\Entities\\LdapSettings.thrift"
include "..\\Entities\\Terminology.thrift"
include "..\\Entities\\ApplicationSettings.thrift"
include "..\\Entities\\UserCodesSetting.thrift"
include "..\\Entities\\UserMachineSetting.thrift"
include "..\\Entities\\UserSettings.thrift"
include "..\\Entities\\CodesList.thrift"
include "..\\Entities\\Machine.thrift"
include "..\\Types\\VisoTypes.thrift"
include "..\\Types\\SecurityRights.thrift"
include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"

namespace csharp Noldus.NLinx.Contracts.Viso.Services
namespace * Noldus.NLinx.Contracts.Viso

// Settings for this service
const i32         interfaceVersion  = 2;
const string      exchange          = "Noldus.NLinx.Viso.SecurityService"
const string      routingKey        = "97C3A7C3-6A1A-4991-8478-D24EAEA89F56"


/**
*  Simple data container for registration result.
*/
struct RegisterResult
{
    /** The registration result */
    1: optional VisoTypes.ERegisterResult result,

    /** The version number of the service */
    2: optional string serviceVersion
}


/**
*  Simple data container for the dongle status
*/
struct DongleInfo
{
    /** The user name */
    1: optional string userName,

    /** The licenkey */
    2: optional string licenceKey,

    /** The expiration date */
    3: optional string expirationDate
}


/**
*  The result of the dongle upgrade
*/
enum EDongleUpgradeResult
{
    /** Upgrade successful */
    Success = 0,

    /** Upgrade with User Management successful */
    SuccessUserManagement = 1,

    /** Upgrade key invalid */
    Error = 2,

    /** To many tries in a row */
    TooManyTries = 3,

    /** Upgrade is prevented, application is in use */
    SystemInUse = 4,

    /** License key does not contain Advanced UM donglebit. Downgrades dongle. */
    MissingAdvancedUM = 5
}


/**
*  The result of a login
*/
enum ELoginResult
{
    /** Unknown login result */
    Unknown = 0,

    /** Login succesful, session token created */
    LoginSuccess = 1,

    /** Login failed, password was incorrect */
    WrongPassword = 2,

    /** Login failed, username not found */
    UnknownUser = 3,

    /** Login failed, same user already logged in */
    AlreadyLoggedIn = 4,

    /** Login failed, this acount is removed */
    RemovedAccount = 5,

    /** Login failed, too many wrong attempts */
    TooManyAttempts = 6,

   /** Login successful, but password expired */
   PasswordExpired = 7
}


/**
*  The result of a logout
*/
enum ELogoutResult
{
    /** Unknown logout result */
    Unknown = 0,

    /** Logout succesful */
    Success = 1,

    /** Logout failed, username not found */
    UnknownUser = 2,

    /** Logout failed, this account is removed */
    RemovedAccount = 3
}


/**
*  Login result class
*/
struct LoginResult
{
    /** The login result */
    1:  optional ELoginResult   result,

    /** The session token if succesfully logged in */
    2: optional string          sessionToken,

    /** Holds on successful login the information about the logged in user. */
    3: optional User.User       user,

    /** Holds on successful login the rights for this user. */
    4: optional i64             rights
}


/**
*  ChangePassword return enum
*/
enum EChangePasswordResult
{
    /** Unknown result */
    Unknown = 0,

    /** Password changes successfully */
    Success = 1,

    /** Failed, old password is incorrect */
    WrongPassword = 2,

    /** Failed, no user is currently logged in */
    NoUserLoggedIn = 3,

    /** Password already used before */
    AlreadyUsed = 4
}


/**
*  CheckPassword return enum
*/
enum ECheckPasswordResult
{
    /** Unknown user result */
    UnknownUser = 0,

    /** Password is correct */
    Success = 1,

    /** Failed, password is not correct */
    WrongPassword = 2,

    /** Failed, no user is currently logged in */
    NotLoggedIn = 3
}


/**
*  User Status
*/
enum EUserStatus
{
    /** We don't know the current status of the user */
    Unknown = 0,

    /** The user is removed from the Viso system */
    Removed = 1,

    /** The user is currently not logged in */
    LoggedOut = 2,

    /** The user is currently logged in */
    LoggedIn = 3,

    /** The user is currently making a recording */
    Recording = 4,

    /** The user is a domain user and is removed from the LDAP */
    RemovedFromLDAP = 5
}


/**
*  Class to send the user status
*/
struct UserStatus
{
    /** The user id */
    1:  optional i32 userId,

    /** The status of the user */
    2: optional EUserStatus status
}


/**
* Struct to hold results on Add/Update/Get LdapSettings.
* This way we can give back also a null value.
*/
struct LdapSettingsResult
{
    /** Function succeeded or failed */
    1: bool success,

    /** Resulted LdapSettings in the database */
    2: LdapSettings.LdapSettings ldapSettings
}


/**
* Struct to hold results of a Ldap search.
*/
struct LdapSearchResult
{
    /** Function succeeded or failed */
    1: bool success,

    /** Resulted LdapSettings in the database */
    2: list<User.User> searchResults,

    /** Error message describing the problem happend if any */
    3: string errorMessage
}


/**
*  The result of a login
*/
enum ELdapSyncResult
{
    /** Unknown result */
    Unknown = 0,

    /** Synchronization was succesful */
    Success = 1,

    /** Failed to connect */
    FailedToConnect = 2,

    /** No users to synchronize */
    NoDomainUsers = 3,

    /** No users need to synchronize */
    NoChangesInUsers = 4,

    /** Exception occured in service */
    ExceptionInService = 5
}


/**
* Struct to hold results of a Ldap sync.
*/
struct LdapSyncResult
{
    /** Function succeeded or failed */
    1: ELdapSyncResult result,

    /** Number of users synced */
    2: i32 numberOfUsersSynced,

    /** Number of users Changed */
    3: i32 numberOfUsersChanged,

    /** Number of users disabled, they no longer exist in Ldap */
    4: i32 numberOfUsersDisabled
}


/*
 *  The security service is responsable for user login/logout and rights management 
 */
service SecurityService extends CommonService.CommonService
{
    /**
    *  Registers a MRR Viewer or MRR Recorder to the system. The MRR Solution limits the maximum number of running
    *  Viewers and Recorders.
    *  @return RegisterResult - The result of registering.
    */
    RegisterResult Register(
            /** The type of client (viewer, recorder, see EClientType). */
            1: VisoTypes.EClientType clientType,
            /** Unique identifier of the running client process (viewer, recorder).*/
            2: CommonTypes.GUID processId,
            /** The version of the client */
            3: string clientVersion
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Unregisters a MRR Viewer or MRR Recorder from the system. The MRR Solution limits the maximum number of running
    *  Viewers and Recorders.
    */
    void UnRegister(
            /** The type of client (viewer, recorder, see EClientType). */
            1:  VisoTypes.EClientType clientType,
            /** Unique identifier of the running client process (viewer, recorder).*/
            2: CommonTypes.GUID processId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Retrieve information about the license/dongle of the MRR Solution.
    *  @return DongleInfo - user name, license number and dongle expiration data.
    */
    DongleInfo GetDongleInformation() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);
    

    /**
    *  Get the maximum number of allowed running instances of the MRR Viewer or the MRR Recorder.
    *  @ return int - The maximum number of allowed instances.
    */
    i32 GetMaxNrOfAllowedInstances(
            /** The type of client (viewer, recorder, see EClientType). */
            1:  VisoTypes.EClientType clientType
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Upgrade the dongle key
    *  @return EDongleUpgradeResult - The upgrade result.
    */
    EDongleUpgradeResult UpgradeDongle(
            /** The upgrade key */
            1:  string upgradeKey
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Get the number of days left for the license.
    *  @return int - The number of days left.
    */
    i32 GetLicenseDaysLeft() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Check if the user has all the needed rights
    *  @return bool - True if the rights are there, false otherwise
    */
    bool HasRights(
            /** The rights flags needed */
            1:  i64 rightsNeeded
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Check if the user has the dongle rights needed
    *  @return bool - True if the rights are there, false otherwise
    */
    bool HasDongleRights(
            /** The rights flags needed */
            1:  i64 rightsNeeded
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Get all the rights of the current user
    *  @return long - The flags that are allowed are set
    */
    i64 GetRights() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Login with a username and password, and optional device ID.
    *  @return LoginResult - the session token
    */
    LoginResult TryLogin(
            /** The users name (not the display name) */
            1:  string userName,
            /** The plain password */
            2:  string password,
            /** The id of the device where the user is trying to login. Specify a null GUID if the device is irrelevant.*/
            3:  CommonTypes.GUID deviceId,
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Logout a user with a user and optional device.
    *  @return ELogoutResult - The result of the logout
    */
    ELogoutResult TryLogoutUserToEdit(
            /** The user's name (not the display name) */
            1:  string userName,
            /** The id of the device where the user is trying to login. Specify a null GUID if the device is irrelevant.*/
            2:  CommonTypes.GUID deviceId,
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Logout from the current session
    */
    void Logout() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Get the user entity based on the unique user name
    *  @return User - the user entity,
    */
    User.User GetUserByName(
            /** The unique user name */
            1:  string userName
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Check if the user exists 
    *  @return bool - True if the user exists, false otherwise,
    */
    bool GetIsUser(
            /** The unique user name */
            1:  string userName
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Get the user entity based on the user id.
    *  @return User - the user entity,
    */
    User.User GetUserById(
            /** The id of the user */
            1:  i32 userId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Get the currently logged in user.
    *  @return User - The logged in user or null
    */
    User.User GetCurrentUser() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Get all current users of Viso.
    *  @return list<user> - A list of users
    */
    list<User.User> GetUsers() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Get all current and removed users.
    *  @return list<user> - A list of users
    */
    list<User.User> GetAllUsers() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Get the possible participant/annotator users based on the current user of Viso.
    *  @return list<user> - A list of all possible participant/annotator users.
    */
    list<User.User> GetUsersToFillParticipants() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);
    

    /**
    *  Check if the given user is currently logged in
    *  @return bool - True if the user is logged in, false otherwise.
    */
    bool IsUserLoggedIn(
            /** The unique user Id */
            1:  i32 userId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Check if the given user password is expired. Returns false if it is too old, also returns false if the settings do not contain the password expire option
    *  @return bool - True if the user is logged in, false otherwise.
    */
    bool IsUserPasswordExpired(
            /** The unique user Id */
            1:  i32 userId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Change the password of a valid user.
    *  @return EChangePasswordResult - The result of the password change
    */
    EChangePasswordResult TryChangePassword(
            /** The old password */
            1:  string oldPassword,
            /** The new password that should fulfill the current password policy */
            2: string newPassword
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx, 4: VisoTypes.PasswordPolicyException ppEx);


    /**
    *  Check the password of a valid user.
    *  @return ECheckPasswordResult - The result of the password check
    */
    ECheckPasswordResult CheckPassword(
            /** Password to check*/
            1:  string checkPassword,
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Add a new user to Viso.
    *  @return User - The newly added user
    */
    User.User AddUser(
            /** The new user entity. */
            1:  User.User user,
            /** The new user password that should fulfill the current password policy. */
            2: string password
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx, 4: VisoTypes.PasswordPolicyException ppEx);


    /**
    *  Change the user data and password.
    *  @return User - The user with updated information.
    */
    User.User UpdateUser(
            /** The changed user */
            1:  User.User user,
            /** The password string that should fulfill the current password policy. */
            2: string password
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx, 4: VisoTypes.PasswordPolicyException ppEx);
        

    /**
    *  Remove or restore a user from the Viso system.
    */
    void SetUserAsRemoved(
        /** The entity id of the user that should be removed or readded. */
        1:  i32 entityId
        /** When set to true the user will be flagged as removed and will not show up in Viso, specify false to restore a previously removed user.*/
        2:  bool remove = true
        ) throws(1: VisoTypes.SystemException sysEx, 2 : VisoTypes.AuthorizationException authEx, 3 : VisoTypes.ApplicationException appEx);


    /**
    *  Remove or restore a user from the Viso system.
    */
    bool HasUserLinksToSessionsMarkersOrInvites(
        /** The entity id of the user that should be removed or readded. */
        1:  i32 entityId
        ) throws(1: VisoTypes.SystemException sysEx, 2 : VisoTypes.AuthorizationException authEx, 3 : VisoTypes.ApplicationException appEx);


    /**
    *  Get a list of the current status of all users
    *  @return list<UserStatus> - A list of userid's and user status pairs
    */
    list<UserStatus> GetUserStatus() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Get a list of user profiles
    *  @return List<UserProfile> - A list of user profiles
    */
    list<UserProfile.UserProfile> GetUserProfiles() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);
  
     
    /**
    *  Adds a new LDAP settings into the database
    *  @return LdapSettings - The newly stored settings in the database
    */
    LdapSettings.LdapSettings AddLdapSettings(
            /** The new LDAP settings to store */
            1: LdapSettings.LdapSettings ldapSettings
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Updates the LDAP settings in the database with the given settings
    *  @return LdapSettings - The newly stored settings in the database
    */
    LdapSettings.LdapSettings UpdateLdapSettings(
            /** The new LDAP settings to store */
            1: LdapSettings.LdapSettings ldapSettings
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Get the stored LDAP settings from the database
    *  @return LdapSettings - The stored settings in the database
    */
    LdapSettings.LdapSettings GetLdapSettings() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    * Test LDAP server connection with the given arguments
    * @return string - An error message on failure or an empty string on success
    */
    string TestLdapConnection(
            /** Host name */
            1: string hostName,
            /** Domain name */
            2: string domainName,
            /** port number */
            3: i32 port,
            /** User name */
            4: string userName,
            /** Password */
            5: string password
            /** Password */
            6: string baseDN
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    * Detect LDAP server connection with the given domain if available
    * @return LdapSettingsResult - An error message on failure or an empty string on success
    */
    LdapSettingsResult DetectLdapSettings(
            /** Domain name */
            1: string domainName,
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    * Search for LDAP users with the given search string
    * @return LdapSearchresult - A list of the matching objects and a possible error message
    */
    LdapSearchResult SearchUsersByName(
            /** Look for this string in first and last names */
            1: string searchInFullName,
            /** Look for this string in user name */
            2: string searchInUserName,
            /** Maximum matching elements to return back in the list */
            4: i32 sizeLimit
            /** Limit elements to return back in the list */
            5: bool hasSizeLimit
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    * Loop through LDAP users and update them if neccesary
    * @return string - An error message on failure or an empty string on success
    */
    LdapSyncResult SyncLDAP(
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    * If needed, upgrades the data version and user profiles
    * @return bool - True if the upgrade is done, false otherwise
    */
    bool DataUpgrade(
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    * Gets the current terminology list
    * @return list of terminologies
    */
    list<Terminology.Terminology> GetTerminologies(
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    * Updates the terminology list
    */
    bool UpdateTerminologies(
            /** The Terminology list to update from */
            1: list<Terminology.Terminology> listTerminology
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Updates the application persistency settings in the database with the given settings
    *  @return ApplicationSettings - The newly stored settings in the database
    */
    ApplicationSettings.ApplicationSettings UpdateApplicationSettings(
            /** The new application settings to store */
            1: ApplicationSettings.ApplicationSettings applicationSettings
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Get the stored application persistency settings from the database
    *  @return ApplicationSettings - The stored settings in the database
    */
    ApplicationSettings.ApplicationSettings GetApplicationSettings() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Updates the users machine persistency settings.
    *  @return List<UserMachineSetting> - list of all added user machine settings.
    */
    list<UserMachineSetting.UserMachineSetting> AddUsersMachineSettings(
            /** Added machine */
            1:  Machine.Machine machine
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Updates the users codes persistency settings.
    *  @return List<UserCodesSetting> - list of all added user codes list settings.
    */
    list<UserCodesSetting.UserCodesSetting> AddUsersCodesSettings(
            /** Added codes list */
            1:  CodesList.CodesList codesList
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Removes the users codes persistency settings.
    */
    void RemoveUsersCodesSettings(
            /** Removed codes list */
            1:  CodesList.CodesList codesList
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Removes the users machine persistency settings.
    */
    void RemoveUsersMachineSettings(
            /** Removed machine */
            1:  Machine.Machine machine
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    
    /**
    *  Updates the user persistency settings in the database with the given settings
    *  @return UserSettings - The newly stored settings in the database
    */
    UserSettings.UserSettings UpdateUserSetting(
            /** The new user settings to store */
            1: UserSettings.UserSettings userSettings
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Updates the user codes list persistency settings in the database with the given settings
    *  @return UserCodesSetting - The newly stored settings in the database
    */
    UserCodesSetting.UserCodesSetting UpdateUserCodesSetting(
            /** The new user codes settings to store */
            1: UserCodesSetting.UserCodesSetting userCodesSettings
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    
    /**
    *  Updates the user machine persistency settings in the database with the given settings
    *  @return UserMachineSetting - The newly stored settings in the database
    */
    UserMachineSetting.UserMachineSetting UpdateUserMachineSetting(
            /** The new user machine settings to store */
            1: UserMachineSetting.UserMachineSetting userMachineSettings
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    
    /**
    *  Add a new group to Viso.
    *  @return Group - The newly added group
    */
    Group.Group AddGroup(
            /** The new group entity to add */
            1: Group.Group group
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Get the group entity based on the group id.
    *  @return Group - the group entity,
    */
    Group.Group GetGroup(
            /** The id of the group */
            1:  i32 groupId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Get all current groups of Viso.
    *  @return list<Group> - A list of groups
    */
    list<Group.Group> GetGroups() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Remove the group entity based on the group id.
    */
    void RemoveGroup(
            /** The id of the group */
            1:  i32 groupId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Change the group data.
    *  @return Group - The group with updated information.
    */
    Group.Group UpdateGroup(
            /** The changed group */
            1:  Group.Group group
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Get all the groups that the specified user is part of.
    *  @return list<Group> - The list of the groups the user is member of.
    */
    list<Group.Group> GetGroupsOfUser(
            /** The user's unique Id */
            1: i32 userId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

        
    /**
    *  Get all the groups that the specified user specified user defined and the public groups he is part of.
    *  @return list<Group> - The resulting list of the groups 
    */
    list<Group.Group> GetGroupsForDisplay(
            /** The user's unique Id */
            1: i32 userId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Get all the groups that the specified user defined
    *  @return list<Group> - The list of the groups the user defined
    */  
    list<Group.Group> GetGroupsUserDefined(
            /** The user's unique Id */
            1: i32 userId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Get all the users that are member of the specified group.
    *  @return list<User> - The list of the users who are in this group.
    */
    list<User.User> GetUsersOfGroup(
            /** The group's unique Id */
            1: i32 groupId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Returns back all the user group connection entities that were created by the current user.
    *  @return list<UserGroupConnection> - The list of the users who are in this group.
    */
    list<VisoTypes.UserGroupConnection> GetUserGroupConnections(
            /** When true then it also includes the public group connections of other users. */
            1: bool includeOtherUsersPublicGroupConnections
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Get all current Departments of Viso.
    *  @return list<Group> - A list of groups
    */
    list<Department.Department> GetDepartments() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Get the gepartment entity based on the id.
    *  @return Department - the group entity,
    */
    Department.Department GetDepartment(
            /** The id of the department */
            1:  i32 groupId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

           
    /**
    *  Add a new Department to Viso.
    *  @return Department - The newly added Department
    */
    Department.Department AddDepartment(
            /** The new group entity to add */
            1: Department.Department department
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


  /**
    *  Change the Department data.
    *  @return Department - The Department with updated information.
    */
    Department.Department UpdateDepartment(
            /** The changed group */
            1:  Department.Department group
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Remove the Department entity based on the id.
    */
    void RemoveDepartment(
            /** The id of the group */
            1:  i32 groupId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Returns back only the departments the given user is assigned to.
    *  @return list<Department> - the department list of the user
    */
    list<Department.Department> GetDepartmentsOfUser(
            /** The user's unique Id */
            1: i32 userId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx)


    /**
    *  Get all the users that are member of the specified Department.
    *  @return list<User> - The list of the users who are in this Department.
    */
    list<User.User> GetUsersOfDepartment(
            /** The group's unique Id */
            1: i32 groupId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Get the default department (where all unassigned users are).
    *  @return Department - the default (unassigned) department
    */
    Department.Department GetDefaultDepartment() throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Set the department - user (1-n) relation.
    */
    void SetDepartment(
            /** The group's unique Id */
            1: i32 groupId,
            /** The users's unique Id */
            2: i32 userId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Set the departments of multiple users at once.
    */
    void SetDepartments(
            /** Map containing user and group Ids as key and value pairs, where user Id is the key */
            1: map<i32, i32> userGroupMap
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Set the users of a user defined group at once.
    *  the userSelectionMap contains the user id and the selected state (true or false)
    *  this function is obsolete from R115
    */
    void SetUsersOfGroup(
            /** The group's unique Id */
            1: i32 groupId,
            /** Map containing user and group Ids as key and value pairs, where user Id is the key */
            2: map<i32, bool> userSelectionMap
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

        
    /**
    *  Reset the users of a user defined group at once with the specified list of users.
    */
    void ResetUsersOfGroup(
            /** The group's unique Id */
            1: i32 groupId,
            /** Map containing user and group Ids as key and value pairs, where user Id is the key */
            2: list<i32> users
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Get the number of members of the specified group.
    *  @return i32 - The nr of the users who are in this group.
    */
    i32 GetNrOfGroupMembers(
            /** The group's unique Id */
            1: i32 groupId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Get the number of members of the specified department.
    *  @return i32 - The nr of the users who are in this department.
    */
    i32 GetNrOfDepartmentMembers(
            /** The department's unique Id */
            1: i32 departmentId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Get all current private groupsof a user of Viso.
    *  @return list<Group> - A list of groups
    */
    list<Group.Group> GetPrivateGroups(
            /** The user's unique Id */
            1: i32 userId
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


    /**
    *  Sets whether to hide data consent agreement for the current user.
    */
    void SetHideDataConsent(
            /** true to hide data consent, false otherwise */
            1: bool hideDataConsent
        ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /**
    *  Activate sofware license with a license key
    */
    void ActivateSoftwareLicense(
    /** The activation key. */
            1: string activationKey
    ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.ApplicationException appEx);

    /**
    *  Deactivate the license
    */
    void DeactivateSoftwareLicense(
    ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);

    /**
    *  Get the last license error
    */
    string GetLastLicenseError(
    ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.ApplicationException appEx);

    /**
    *  Reinitialize the license source (Do not use it for the first time connecting! It should be done Inside the services)
    */
    void ReInitializeLicenseKey(
    ) throws(1: VisoTypes.SystemException sysEx, 2: VisoTypes.AuthorizationException authEx, 3: VisoTypes.ApplicationException appEx);


}