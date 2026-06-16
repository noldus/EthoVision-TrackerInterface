//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   SLClient
// Module     :   NoldusSiteLicenseCommunication
// File       :   ManagerLicenseFileList.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 11-10-2015   Laszlo Abari-Toth                    - Original version
//----------------------------------------------------------------------------
include "ManagerLicenseFileList.thrift"

namespace * Noldus.NLinx.Contracts.SiteLicense

/** 
* List of License files
*/
struct SLMLicenseFileList
{
    /** The list of SLMAppLicenseFile. */
    1: required list<ManagerLicenseFile.SLMLicenseFile> LicenseFileList
}