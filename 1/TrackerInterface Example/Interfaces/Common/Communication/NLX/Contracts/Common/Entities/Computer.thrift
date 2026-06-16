//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   Computer.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------
include "..\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Common

/** A computer in the N-Linx network.*/
struct Computer
{
    /** If filled in, an identifier uniquely identifies a computer. This ID is for example filled in the N-Linx Agent. */
    1: required CommonTypes.GUID computerId,

    /** A preferably unique name that identifies a computer in the network. */
    2: optional string computerName,

    /** If filled in, a name to easily recognize which computer is meant, for example "Meeting room PC". */
    3: optional string friendlyName,
}
