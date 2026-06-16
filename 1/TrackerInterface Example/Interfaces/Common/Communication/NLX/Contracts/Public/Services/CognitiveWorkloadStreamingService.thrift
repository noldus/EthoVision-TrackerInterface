//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   CognitiveWorkloadStreamingService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 15-03-2023 Rogier Giesen   - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Entities\\Process.thrift"
include "..\\..\\Common\\Entities\\StreamingOptions.thrift"
include "..\\..\\Common\\Entities\\CognitiveLoadData.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** The name of the RabbitMQ exchange on which the messages of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.Streaming.CognitiveWorkload"
/** This service runs on a topic exchange which allows fine-grained routing of all types of cognitive load data.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.TOPIC

/** This service runs on a topic exchange that supports routing keys in the following format:
 *
 *  "{datatype}.{senderId}.{receiverId}"		see definition in CommonTypes.
 *
 *  datatype, supported values : 
 *  senderId				   : the processId of the N-Linx process that is the producer of cognitive workload data
 *  receiverId				   : mostly use "*", but can be used as the processId of the process that wants to receive the data
 *
 *  Example: "CognitiveWorkload.2254b828-7bc2-450f-b8d8-3f3da9511305.5d659955-cff5-44f8-bb8a-dc57e4fc08ee"
*/
/** The string definition for routing raw cognitive workload data. */
const string dataTypeCognitiveWorkload = "CognitiveWorkload";

/** 
* The cognitive workload streaming service defines the methods that are used for streaming data from the cognitive workload domain. 
* The methods define unconditional publishing of time-series data.
*/
service CognitiveWorkloadStreamingService
{
    /** Produce and consume of cognitive workload data.*/
    oneway void			    CognitiveLoadDataReceived    ( /** The identifier of the process that sends out the data.*/
                                                              1: Process.Process sender,

                                                              /** The cognitive workload data contains a list of cognitive workload samples, along with meta data like the source ID of 
                                                              *   the images or video for which the cognitive workloads were calculated.*/
                                                              2: CognitiveLoadData.CognitiveLoadData CognitiveLoadData);

    /** Produce and consume of restreamed cognitive workload data. Restreamed cognitive workload data is not a live stream of data but a data streaming on request.
    *   The request is made in the CognitiveWorkloadService.SubmitRestreamingQuery.*/
    oneway void			    CognitiveLoadDataRestreamed  ( /** The identifier of the process that sends out the data.*/
                                                  1: Process.Process sender,

                                                  /** The same object that was passed into the call to SubmitRestreamingQuery. Use the request ID in this streaming options
                                                  *   to identify the data that was requested by the RequestRestreamingQuery.*/
                                                  2: StreamingOptions.StreamingOptions streamingOptions,
                                                 
                                                  /** The cognitive workload data contains a list of cognitive workload samples, along with meta data like the source ID of 
                                                  *   the images or video for which the cognitive workloads were calculated.*/
                                                  3: CognitiveLoadData.CognitiveLoadData CognitiveLoadData,
                                                  
                                                  /** Progress information about the status of sending the restreamed data.*/
                                                  4: CommonTypes.ProgressInfo progressInfo);

}
