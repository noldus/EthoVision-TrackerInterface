//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   NlxThriftTest
// File       :   TestProduceConsume.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 26-05-2016 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------
include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Entities\\Header.thrift"

namespace * Noldus.NLinx.Contracts.Test


/** A service used for (unit) testing of N-Linx produce-consume.*/
service TestProduceConsume
{
    /** Test for a simple fire-and-forget routine. */
    oneway void Log(1: string message);

    /** Test for an integer value sending routine. */
    oneway void SendIntegerValue(1: i32 input);
}
