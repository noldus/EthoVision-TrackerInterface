//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   Info.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------

namespace * Noldus.NLinx.Contracts.Common

/** Information about an N-Linx command service. */
struct Info
{
    /**  A zero-based version number of the N-Linx Thrift interface. */
    1: optional i32 interfaceVersion,

    /** A friendly name for the N-Linx command service. This name is still a technical name, with the purpose to have a readable name that can be 
    *   quickly identified for the service. For example, for debug and logging purposes. It is advised not to use this name in the user interface for the end-user.*/
    2: optional string friendlyName,
}

