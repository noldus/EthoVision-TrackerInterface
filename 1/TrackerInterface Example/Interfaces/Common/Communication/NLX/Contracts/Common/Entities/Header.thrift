//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   Header.thrift
//----------------------------------------------------------------------------
// Revisions  :   1.0
//----------------------------------------------------------------------------

namespace * Noldus.NLinx.Contracts.Common

/**
 *  Represents the communication header used in all noldus N-Linx communication. 
 */
struct Header
{
    /**  A string that can be used as a security token, to identify users. */
    1: optional string securityToken,
}
