//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   CommonService.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------
include "..\\Entities\\Info.thrift"
include "..\\Entities\\Header.thrift"

namespace * Noldus.NLinx.Contracts.Common
    

/** The base interface for all N-Linx services. */
service CommonService
{
    /** Gets general information that the service offers. */
    Info.Info GetInfo();
}

