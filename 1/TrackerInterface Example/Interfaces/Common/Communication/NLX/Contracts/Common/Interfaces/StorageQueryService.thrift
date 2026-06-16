//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Common Contracts
// File       :   StorageQueryService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 13-12-2018 Rogier Giesen - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "..\\Entities\\Process.thrift"
include "..\\Entities\\QueryFilter.thrift"
include "..\\Entities\\QueryFormat.thrift"
include "..\\Entities\\QueryOptions.thrift"
include "..\\Entities\\QueryResult.thrift"
include "..\\Entities\\StreamingTicket.thrift"
include "..\\Entities\\LiveQuery.thrift"
include "..\\Entities\\Query.thrift"
include "..\\Entities\\StreamingOptions.thrift"
include "CommonService.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** Version of the interface.*/
const i32         interfaceVersion          = 1;

/** The name of the RabbitMQ exchange on which the communication of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.Query.Storage"

/** Use this key to send data to the storage. The N-Linx Storage will be listening at this routing key */
const string      routingKey                = "94cfe8d4-eff9-4da8-a649-95a61a3e11ab"

/** The type of RabbitMQ exchange on which this service sends the messages.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.TOPIC

/** This service runs on a topic exchange that supports routing keys in the following format:
 *
 *  "storage.{datatype}.{programid}"		see definition in CommonTypes.
 *
 *  domain					   : storage
 *  datatype, supported values : timeseries	(lower case)
 *  programid				   : use the programId from the Process entity.
 *
 *  Example: "eyetracking.timeseries.2254b828-7bc2-450f-b8d8-3f3da9511305"
*/
const string domain = "storage";


/**
* The storage streaming service defines the interface streaming time series data to and from the storage service.
*/
service StorageQueryService extends CommonService.CommonService
{
    /** Streams a list of time series points, to the specified database and measurement.*/
    QueryResult.QueryResult			QueryTimeSeries	        ( /** The database instance to which the time series points belongs.*/
                                                              1: required string databaseName,
                                                              
                                                              /** The measurement acts as a container for tags, fields, and the time column. It is conceptually similar to a table in RDBMS.*/
                                                              2: required string measurementName,
                                                              
                                                              /** Filter results determines what results are returned.*/
                                                              3: required QueryFilter.QueryFilter filter,
                                                              
                                                              /** Format results determines in what form results are returned.*/
                                                              4: required QueryFormat.QueryFormat format,
                                                              
                                                              /** Options results determines in what way results are retrieved.*/
                                                              5: required QueryOptions.QueryOptions options) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /** Generic query on the specified TimeSeries database.*/
    QueryResult.QueryResult         GeneralQueryTimeSeries  ( /** The database instance to which the time series points belongs.*/
                                                              1: required string databaseName,
                                                              
                                                              /** Names and values (multiple per tag possible) of the tags to filter on.*/
                                                              2: required string query,
                                                              
                                                              3: required QueryOptions.QueryOptions options) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /** Submit a query to instruct the storage service to stream out time-series data to the process that submits this query. The stream of data will be received 
    /*  through the StorageStreamingService.
    */
    StreamingTicket.StreamingTicket RequestRestreamingQuery	( /** The process that submits the query and wants to receive the result data via the streaming service. Put in here
                                                              /*  the N-Linx my process */
                                                              1: Process.Process sender,
                                                              
                                                              /** Specifies the query, like from which database and measurement, and to and from times.*/
                                                              2: Query.Query query,
                                                              
                                                              /** Defines in what way the data should be restreamed and also the receiver part of the restreaming routing key.*/
                                                              3: StreamingOptions.StreamingOptions streamingOptions) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /** Cancel a submitted restreaming query. 
    /*  @exceptions No specifics
    */ 
    void							CancelRestreamingQuery  ( /** The N-Linx process that wants to cancel a submitted restreaming query.*/
                                                              1: Process.Process sender,
                                                                 
                                                              /** The streaming ticket that was received in the call to SubmitReStreamingQuery.*/	
                                                              2: StreamingTicket.StreamingTicket token) throws(1: CommonTypes.ApplicationException appEx, 2: CommonTypes.SystemException sysEx);

    /** Submit is live query that tells the storage service what to stream out live and to whom. 
    /*  @return StreamingTicket - a unique token, generated by the storage service, that identifies the live query. Use this token later when you release the live query.
    /*  @exceptions No specifics
    */ 
    StreamingTicket.StreamingTicket RequestLiveQuery	    ( /** The process that submits the query and wants to receive the result data via the streaming service. In most of the cases 
                                                              /*  put in here my process.*/
                                                              1: Process.Process sender,

                                                              /** Holds information on the live query, like the query and to which database it applies.*/
                                                              2: LiveQuery.LiveQuery liveQuery) throws(1: CommonTypes.ApplicationException appEx, 2: CommonTypes.SystemException sysEx);

    /** Release a running live query from the storage service. 
    /*  @exceptions No specifics
    */ 
    void							ReleaseLiveQuery		( /** The N-Linx process that wants to release the live query.*/
                                                              1: Process.Process sender,
                                                              
                                                              /** The query token that was received in the call to SubmitLiveQuery.*/	
                                                              2: StreamingTicket.StreamingTicket token) throws(1: CommonTypes.ApplicationException appEx, 2: CommonTypes.SystemException sysEx);

    /** WARNING: There are severe limitations on the usage of the filter! Only use this if you know the limitations. Deletes time series data for the specified database and measurement. The query filter defines what needs to be deleted.*/
    void                            DeleteTimeSeries       (
                                                            /** The database instance to which the time series points belongs.*/
                                                            1: required string databaseName,
    
                                                            /** The measurement acts as a container for tags, fields, and the time column. It is conceptually similar to a table in RDBMS.*/
                                                            2: required string measurementName,
                                                            
                                                            /** Filter results determines what results are returned. Use only the equality operator ('=') for tags and fields. For every tag key only the first value will be used! */
                                                            3: required QueryFilter.QueryFilter filter,
                                                            ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

}
