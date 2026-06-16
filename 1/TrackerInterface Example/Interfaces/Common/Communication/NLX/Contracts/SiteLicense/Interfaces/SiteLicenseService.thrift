//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   SiteLicense Contracts
// File       :   SiteLicenseService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 08-03-2015 Laszlo Abari-Toth   - Original version
//----------------------------------------------------------------------------
include "..\\Entities\\UserLogin.thrift"
include "..\\Entities\\UserData.thrift"
include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"
include "..\\..\\Common\\Entities\\Header.thrift"

namespace * Noldus.NLinx.Contracts.SiteLicense


// Settings for this service
const i32         interfaceVersion  = 1;
const string      exchange          = "Noldus.NLinx.SiteLicense.SiteLicenseService"
const string      routingKey        = "AE2ABFD1-4288-401B-A6BE-90AE5FC997A5"

/** The SiteLicense service is responsible for .... */
service SiteLicenseService extends CommonService.CommonService
{
    
    /**
    *  Login the user
    *  @return LoginResult 
    */
    UserLogin.LoginResult 	    Login(1: UserLogin.UserLogin data);

    /**
    *  Logoff the user
    *  @return LoginResult
    */
    UserLogin.LoginResult 	    Logoff(1: UserLogin.UserLogoff data);

    /**
    *  Get The License bits for the actual user/app
    *  @return RestrictionResult
    */
    UserData.RestrictionResult  GetLicensebits(1: UserData.UserData data);

    /**
    *  Send the keepalive signal to the service
    *  @return -
    */
    void                        KeepAlive(1: UserData.UserData data);

    /**
    *  Get the Dongle ID for the application
    *  @return i32 - ID
    */
    i32                         ChkLicense(1: UserData.ProductData data);


}



