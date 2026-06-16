//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   StorageStreamingService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 13-08-2018 Tijmen van Voorthuijsen - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "..\\Entities\\QueryResult.thrift"
include "..\\Entities\\TimeSeriesPoint.thrift"
include "..\\Entities\\Process.thrift"
include "..\\Entities\\StreamingOptions.thrift"
include "CommonService.thrift"


namespace * Noldus.NLinx.Contracts.Public.Services

/** Version of the interface.*/
const i32         interfaceVersion          = 2;
/** The name of the RabbitMQ exchange on which the communication of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.Streaming.Storage"

/** This service runs on a topic exchange that supports routing keys in the following format:
 *
 *  "{datatype}.{senderId}.{receiverId}"		see definition in CommonTypes.
 *
 *  datatype, supported values : timeseries	(lower case)
 *  senderId				   : the programId of the storage service
 *  receiverId				   : the programId of the process that wants to receive the data
 *
 *  Example: "timeseries.ada15099-451b-43dd-b557-e5d45649dada.5d659955-cff5-44f8-bb8a-dc57e4fc08ee"
*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.TOPIC

/** The string definition for routing time series data. */
const string dataTypeTimeSeries = "timeseries";

/** The routing key to address the storage control service.*/
const string      routingKey				= "ada15099-451b-43dd-b557-e5d45649dada"

/** 
*   The storage streaming service defines the interface streaming time series data to and from the storage service.
*   Streaming is implemented using the fast produce-consume channels, so request-reply is not support. This is one
*   od the reasons why this interface does not implement the common service and version info.
*/
service StorageStreamingService
{
    /** Streams a list of time series points, to the specified database and measurement.*/
    oneway void			StreamTimeSeries		( /** The database instance to which the time series points belongs.*/
                                                  1: required string databaseName,
    
                                                  /** The measurement acts as a container for tags, fields, and the time column. It is conceptually similar to a table in RDBMS.*/
                                                  2: required string measurementName,

                                                  /** A list of time series points.*/
                                                  3: list<TimeSeriesPoint.TimeSeriesPoint> timeSeriesPoints,

                                                  /** Resolution of the timestamps in the timeSeriesPoints.*/
                                                  4: TimeSeriesPoint.ETimeSeriesPrecision precision = TimeSeriesPoint.ETimeSeriesPrecision.Millisecond);

    /** Streams a list of time series points in response to a requested streaming query. The requested streaming query is defined in StorageQueryService.thrift, see RequestStreamingQuery. */
    oneway void			RestreamTimeSeries      ( /** The identifier of the process that sends out the data.*/
                                                  1: Process.Process sender,

                                                  /** The same object that was passed into the call to RequestRestreamingQuery. Use the request ID in this options object
                                                  *   to identify the data that was requested.*/
                                                  2: StreamingOptions.StreamingOptions streamingoptions,

                                                  /** The list of time series points plus metadata about batch number and query status.*/
                                                  3: QueryResult.QueryResult queryResult,

                                                  /** Progress information about the status of sending the restreamed data.*/
                                                  4: CommonTypes.ProgressInfo progressInfo);
}
