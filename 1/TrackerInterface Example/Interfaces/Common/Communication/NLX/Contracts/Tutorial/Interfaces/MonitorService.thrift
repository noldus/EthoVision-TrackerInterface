include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Entities\\Header.thrift"

namespace * Noldus.NLinx.Contracts.Monitor
    
/** A sample service. */
service MonitorService
{
    /** A demo routine to notify changes. */
    oneway void DateTimeChanged(1: i64 datetime, 2: i32 entityId, 3: i32 counter, 4: string payload);
}