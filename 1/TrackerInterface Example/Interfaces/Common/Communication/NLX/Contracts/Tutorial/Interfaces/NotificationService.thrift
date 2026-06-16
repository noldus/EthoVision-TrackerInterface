//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Tutorial Contracts
// File       :   NotificationService.thrift
//----------------------------------------------------------------------------
// Revisions  :   1.0
//----------------------------------------------------------------------------
include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Entities\\Header.thrift"

namespace * Noldus.NLinx.Contracts.Tutorial

// Use these settings when creating the producer and consumer channels
const string                   exchange     = "Noldus.NLinx.Library.NotificationService"
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.FANOUT
    
/** A sample service. */
service NotificationService
{
    /** A demo routine to notify changes. */
    oneway void EntityChanged(1: i32 entityId);

    /** A demo routine to send an N-Linx duration type. */
    oneway void DurationChanged(1: CommonTypes.Duration duration);
}

