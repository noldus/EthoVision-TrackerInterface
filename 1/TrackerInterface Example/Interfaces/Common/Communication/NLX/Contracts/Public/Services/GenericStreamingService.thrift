//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   GenericStreamingService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 15-01-2022 Rogier Giesen   - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Entities\\Process.thrift"
include "..\\..\\Common\\Entities\\StreamingOptions.thrift"
include "..\\..\\Public\\Entities\\GenericData.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** The name of the RabbitMQ exchange on which the messages of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.Streaming.Generic"
/** This service runs on a topic exchange which allows fine-grained routing of all types of cognitive load data.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.TOPIC

/** This service runs on a topic exchange that supports routing keys in the following format:
 *
 *  "{datatype}.{senderId}.{receiverId}"		see definition in CommonTypes.
 *
 *  datatype, supported values : generic data, double, double	(lower case)
 *  senderId				   : the processId of the N-Linx process that is the producer of cognitive load data
 *  receiverId				   : mostly use "*", but can be used as the processId of the process that wants to receive the data
 *
 *  Example: "generic.2254b828-7bc2-450f-b8d8-3f3da9511305.5d659955-cff5-44f8-bb8a-dc57e4fc08ee"
*/
/** The string definition for routing raw cognitive load data. */
const string dataTypeGeneric = "generic";

/** 
* The cognitive load streaming service defines the methods that are used for streaming data from the cognitive load domain. 
* The methods define unconditional publishing of time-series data.
*/
service GenericStreamingService
{
    /** Produce and consume of cognitive load data.*/
    oneway void			    DataReceived    ( /** The identifier of the process that sends out the data.*/
                                                              1: Process.Process sender,

                                                              /** The cognitive load data contains a list of samples, along with meta data like the source ID for which the cognitive loads were calculated.*/
                                                              2: GenericData.GenericData cognitiveLoadData);

    /** Produce and consume of restreamed cognitive load data. Restreamed cognitive load data is not a live stream of data but a data streaming on request.
    *   The request is made in the GenericService.SubmitRestreamingQuery.*/
    oneway void			    DataRestreamed  ( /** The identifier of the process that sends out the data.*/
                                                  1: Process.Process sender,

                                                  /** The same object that was passed into the call to SubmitRestreamingQuery. Use the request ID in this streaming options
                                                  *   to identify the data that was requested by the RequestRestreamingQuery.*/
                                                  2: StreamingOptions.StreamingOptions streamingOptions,
                                                 
                                                  /** The cognitive load data contains a list of cognitive load samples, along with meta data like the source ID of 
                                                  *   the images or video for which the cognitive loads were calculated.*/
                                                  3: GenericData.GenericData cognitiveLoadData,
                                                  
                                                  /** Progress information about the status of sending the restreamed data.*/
                                                  4: CommonTypes.ProgressInfo progressInfo);

}
