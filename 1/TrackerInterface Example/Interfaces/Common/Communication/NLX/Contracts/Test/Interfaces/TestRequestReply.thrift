//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Test Contracts
// File       :   TestRequestReply.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 27-01-2015 Tijmen van Voorthuijsen - Original version
//----------------------------------------------------------------------------

namespace * Noldus.NLinx.Contracts.Test


/** A service used for (unit) testing of N-Linx request-reply. */
service TestRequestReply
{
    /** A demo computational routine which can time out for large input values. */
    i32 Fibonacci(1: i32 input);

    /** Test for a simple fire-and-forget routine with a string input. */
    oneway void Log(1: string message);

    /** Oneway method test for an integer value sending routine. */
    oneway void SendIntegerValue(1: i32 value);
}
