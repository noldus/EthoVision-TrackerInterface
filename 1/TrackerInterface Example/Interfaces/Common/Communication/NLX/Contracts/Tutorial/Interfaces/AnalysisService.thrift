//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Tutorial Contracts
// File       :   AnalysisService.thrift
//----------------------------------------------------------------------------
// Revisions  :
//----------------------------------------------------------------------------
include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Entities\\Header.thrift"


namespace * Noldus.NLinx.Contracts.Tutorial

// Use these settings when creating the requestor and replier channels
const string      exchange   = "Noldus.NLinx.Tutorial.AnalysisService"
const string      routingKey = "b76d0a17-5047-4c1b-bfa0-c13b5360cf29"
    

/** An example of a service. */
service AnalysisService
{
    /** A demo computational intensive routine for large input values. */
    i32 Fibonacci(1: i32 input);
}



