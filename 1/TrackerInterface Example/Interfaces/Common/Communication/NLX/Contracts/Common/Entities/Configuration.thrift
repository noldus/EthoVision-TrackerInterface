//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   Configuration.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------
include "..\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Common

/** A configuration defines the setup and settings of a recording in a remote process.*/
struct Configuration
{
    /** Custom settings which can be defined as [key, value] pairs in a hierarchical property tree.*/
    1: optional CommonTypes.PropertyTree customProperties,
}

