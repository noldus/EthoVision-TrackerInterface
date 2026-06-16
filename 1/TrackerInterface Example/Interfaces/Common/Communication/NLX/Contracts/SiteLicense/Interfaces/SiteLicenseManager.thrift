//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   SiteLicense  Manager - Service  Contracts
// File       :   SiteLicenseManager.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 11-10-2015   Laszlo Abari-Toth                    - Original version
//----------------------------------------------------------------------------
include "..\\Entities\\ManagerProduct.thrift"
include "..\\Entities\\ManagerUserLevelLink.thrift"
include "..\\Entities\\ManagerLicenseFile.thrift"
//include "..\\Types\\ManagerTypes.thrift"

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"
include "..\\..\\Common\\Entities\\Header.thrift"

namespace * Noldus.NLinx.Contracts.SiteLicense


// Settings for this service
const i32         interfaceVersion  = 1;
const string      exchange          = "Noldus.NLinx.SiteLicense.SiteLicenseManager"
const string      routingKey        = "21DEAA8E-B02E-4A03-A293-776F6BE66BE0"

/** The SiteLicenseManager service is responsible for .communication between the SLS Service and Manager application*/
service SiteLicenseManager extends CommonService.CommonService
{
    /** 
    * Get state of the service
    * @return the service state
    */
    i32												GetServiceState () ;

    /** 
    * Get number of  License files on the server.
    * @return The number license files on the server.
    */
    i32                                             NumberOfLicenseFiles () ;

    /** 
    * Get number of valid License files on the server
    * @return The number of valid license file on the server. 
    */
    i32                                             NumberOfValidLicenseFiles () ;

    /** 
    * Generate an encrypted key. With this key license files can be created.
    * @return The generated encrypted key.
    */
    string                                          GenerateEncryptedKey ();

    /** 
    * Generate Registration Key File data
    * @return The generated key file.
    */
    string                                          GenerateKeyFile ();

    /** 
    * Get List of License Files
    * @return The license files from the services.
    */
    ManagerLicenseFile.SLMLicenseFileList           GetLicenseFiles ();

    /**
    * Upgrades the license file if the upgrade key contains valid data.
    * @return true if the upgrade was successfuly.
    */
    bool                                            UpgradeLicenseFile (1: ManagerLicenseFile.SLMLicenseFile licenseFile, 2: string combinedKey);
    
    /** 
    * Reads in all the products and their license info to the memory.
    */
    void ReadLicenseFiles ();
    
    /** 
    * Check users permissions for the product levels. If it is missing, user will be kicked.
    * @return True if the user has right for running.
    */
    bool											CheckPermissions();

    /** 
    * Returns the list of all users
    * @return the list of all users
    */
    ManagerUserLevelLink.SLMBusEntUserList          GetAllUsers ();

    /** 
    * Returns all of the user levels
    * @return all of the user levels
    */
    ManagerUserLevelLink.SLMBusEntUserLevelList     GetUserLevels ();

    /** 
    * Returns the required user by its unique name
    * @return the required user by its unique name
    */
    ManagerUserLevelLink.SLMBusEntUser              GetUserByName (1: string strUserName);

    /** 
    * Returns the required user by its id
    * @return the required user by its id
    */
    ManagerUserLevelLink.SLMBusEntUser              GetUserByID (1: i32 intUserId);
    
    /** 
    * Add user the database
    * @return The newly added user.
    */
    ManagerUserLevelLink.SLMBusEntUser              AddUser (1: string displayName, 2: string name, 3: string pw);
    
    /**
    * Update a user's data
    * @return The newly edited user.
    */
    ManagerUserLevelLink.SLMBusEntUser              ModifyUser (1: string oldUserName, 2: string displayName, 3: string name, 4: string pw);
    
    /** 
    * Returns all of the users and their levels
    * @return all of the users and their levels
    */
    ManagerUserLevelLink.SLMBusEntUserAndUserLvlLinkList    GetUsersAndUserLevels ();

    /** 
    * Update user and its level. Used when user logged in.
    */
    void                                            UpdateUserAndItsLevel (1: string userName, 2: string productName, 3: i32 productVersion, 4: bool isOnline, 5: CommonTypes.IsoDateTime loginTime, 6: string computerName, 7: string ipAddress, 8: CommonTypes.GUID computerId);
    
    /** 
    * Delete the user from the database
    */
    void                                            DeleteUser (1: ManagerUserLevelLink.SLMBusEntUser  user);
    
    /** 
    * Check the password validity
    * @return true if the password is correct.
    */
    bool											CheckPassword(1: i32 userId, 2: string password);
    
    /** 
    * Delete the user level from the database
    */
    void                                            RemoveUserLevels (1: ManagerUserLevelLink.SLMBusEntUserAndUserLvlLink userAndUserLvlLink);
    
    /** 
    * Create the connection between the user and its level
    */
    void                                            LinkUserToUserLvl (1: ManagerUserLevelLink.SLMBusEntUser newUser, 2: i32 productID, 3: string userLvlName);
    
    /** 
    * Returns the list of all products
    * @return the list of all products
    */
    ManagerProduct.SLMBusEntProductList             GetProducts ();
    
    /** 
    * Returns the product specified by ID
    * @return the product specified by ID
    */
    ManagerProduct.SLMBusEntProduct                 GetProduct(1: i32 ProductID);
    
    /** 
    * Remove the license from the user
    * @return True if the kick was successfuly 
    */
    bool                                            KickOffUser(1: string UserName, 2: string ProductName, 3: i32 ProductVersion, 4: CommonTypes.GUID computerId);
    
    /** 
    * Check the license validity
    * @return true if the license is valid.
    */
    bool                                            IsUserLevelAvailable(1: string UserLevelName, 2: i32 ProductId);
    
    /** 
    * It returtns true if there were some modifications in the database 
    * @return true if there were some modifications in the database and update is required on the SLM side
    */
    bool											IsUpdateRequired();

    /** 
    * Checking guest user login is allowed or not.
    * @return True if the quest can login
    */
    bool											IsGuestLoginAllowed();

    /**
    * Set the guest login allowed flag. 
    */
    void											SetGuestLoginAllowed(1: bool isGuestLoginAllowed);
    
    /** 
    * Send a login message to the License Service 
    */
    void											AdminLogin(1: string adminName, 2: string computerName, 3: string computerIP, 4: CommonTypes.GUID computerId);
   
    /** 
    * Send a logoff message to the License Service 
    */
    void											AdminLogoff(1: CommonTypes.GUID computerId);	

    /** 
    * Returns the online admin, else null. 
    * @ewruen the online admin, else null. 
    */
    ManagerUserLevelLink.SLMBusEntUserAndUserLvlLink OnlineAdmin();

    /** 
    * Return true if the admin has been changed.
    * @return true if the admin has been changed
    */
    bool											IsAdminChanged();
    
    /** 
    * Manager sends keep alive signal if admin is logged in. 
    */
    void											AdminKeepAliveSignal(1: i32 adminId);
    
    /** 
    * Change the user password 
    */
    void											ChangeUserPassword(1: string userName, 2: string newPassword);
    
    /** 
    * Returns true if the user is online with atleast with one product 
    * @return true if the user is online with atleast with one product 
    */
    bool											 IsUserOnlineAnywhere(1: string username);

}



