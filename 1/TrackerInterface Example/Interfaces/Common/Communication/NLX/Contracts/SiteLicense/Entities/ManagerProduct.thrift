//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   SLClient
// Module     :   NoldusSiteLicenseCommunication
// File       :   ManagerProduct.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 11-10-2015   Laszlo Abari-Toth                    - Original version
//----------------------------------------------------------------------------
//include "..\\Types\\SiteLicenseTypes.thrift"

namespace * Noldus.NLinx.Contracts.SiteLicense

/**
* This contains the state of the service
*/
enum ServiceStateId
{
    /** Unknown result					*/
    UNKNOWN_ERROR = 0,

    /** The service is running.			*/
    RUNNING_NO_ERROR = 1,

    /** The system time is corrupted.	*/
    TAMPERED_SYSTEM_TIME = 2,
}


/**  
* Holds the information  of one Noldus product
*/
struct  SLMBusEntProduct 
 {
        /** The Product's name					*/
        1 : optional string ProductName;

        /** The Product's main version number.	*/
        2 : optional i32 MainVersion;

        /** The Product's ID					*/
        3 : optional i32 Id;
}

/**  
* Holds the information of  list of Noldus products
*/
struct SLMBusEntProductList
{
    /** The list of SLMBusEntProduct. */
    1: required list<SLMBusEntProduct> ProductList
}


