//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Entities Contracts
// File       :   LiveQuery.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 09-01-2019 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "..\\Entities\\TimeSeriesPoint.thrift"

namespace * Noldus.NLinx.Contracts.Common

/** Holds information about a live query. A live query defines what to stream out, live, from a storage service.*/
struct LiveQuery
{
    /** The name of the database to which the live query will be applied.*/	
    1: required string databaseName,

    /** The name of the measurement to which the live query will be applied.*/
    2: optional string measurementName,

    /** The part of the routing key that defines the address to whom the live data should be send. This is 
    /*  normally the guid as string of the sender process.*/
    3: optional string receiverId,
    
    /** The live query string, in InfluxDB query language.*/
    4: optional string query,

    /** Resolution of the timestamps.*/
    5: optional TimeSeriesPoint.ETimeSeriesPrecision precision = TimeSeriesPoint.ETimeSeriesPrecision.Millisecond
}
