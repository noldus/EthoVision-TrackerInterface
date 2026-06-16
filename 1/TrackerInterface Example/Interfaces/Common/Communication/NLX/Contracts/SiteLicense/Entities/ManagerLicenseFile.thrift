//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   SLClient
// Module     :   NoldusSiteLicenseCommunication
// File       :   ManagerLicenseFile.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 11-10-2015   Laszlo Abari-Toth                    - Original version
//----------------------------------------------------------------------------
//include "..\\Types\\SiteLicenseTypes.thrift"

namespace * Noldus.NLinx.Contracts.SiteLicense



/** 
* Holds the information of License files
*/
struct SLMLicenseFile
{
        /** The license file path. */
        1 : required string      filePath;

        /** The user's name. */
        2 : optional string      userName;

        /** The license's serial number. */
        3 : optional string      serialNumber;

        /** The license file registration key. */
        4 : optional string      registrationKey;

        /** The server's MAC address. */
        5 : optional string      macAddress;

        /** The server's GUID. */
        6 : optional string      gUId;

        /** The license's product version. */
        7 : optional string      versionNumber;

        /** The product's name.	*/
        8 : optional string      productName;

        /** The product's ID. */
        9 : optional i32         productId;

        /** The license file creation date. */
        10: optional string      creationDate;

        /** The license expiration date. */
        12: optional string      expirationDate;

        /** The license's product level. */
        13: optional string      licenseLevel;

        /** The license's product level ID.	*/
        14: optional i32         licenseLevelId;

        /** Number of the users for the license. */
        15: optional i32         licensesNumber;

        /**	The licensebits. */
        16: optional string      licenseBits;

        /** The crypted key. */
        17: optional string      cryptedKey;

        /** True if the license allows guest login. */
        18: optional bool        isGuestLicense;
}

/** 
* List of License files
*/
struct SLMLicenseFileList
{
    /** The list of SLMAppLicenseFile. */
    1: required list<SLMLicenseFile> LicenseFileList;
}
