//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   ProcessorInfo.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------
include "..\\Types\\CommonTypes.thrift"

namespace * Noldus.NLinx.Contracts.Common

/** 
*  Holds meta data on a processor process or service.
*/
struct ProcessorInfo
{
    /** The name of the processor as a human readable string. This name could be used in the user interface but is primarily for technical purposes, like in logging files. */
    1: optional string name,

    /** Information on the data types this processor produces based on the input data types.*/
    2: optional list<CommonTypes.IoPair> ioDataTypes
}
