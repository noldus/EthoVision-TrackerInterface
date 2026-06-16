//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   FacialExpressionStreamingService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 15-07-2020 Cecilia Herrera   - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Entities\\Process.thrift"
include "..\\..\\Common\\Entities\\StreamingOptions.thrift"
include "..\\..\\Public\\Entities\\FacialExpressionData.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** The name of the RabbitMQ exchange on which the messages of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.Streaming.FacialExpression"
/** This service runs on a topic exchange which allows fine-grained routing of all types of facial expression data.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.TOPIC

/** This service runs on a topic exchange that supports routing keys in the following format:
 *
 *  "{datatype}.{senderId}.{receiverId}"		see definition in CommonTypes.
 *
 *  datatype, supported values : face expression, facial analysis	(lower case)
 *  senderId				   : the processId of the N-Linx process that is the producer of facial expression data
 *  receiverId				   : mostly use "*", but can be used as the processId of the process that wants to receive the data
 *
 *  Example: "facialexpression.2254b828-7bc2-450f-b8d8-3f3da9511305.5d659955-cff5-44f8-bb8a-dc57e4fc08ee"
*/
/** The string definition for routing raw facial expression data. */
const string dataTypeFacialExpression = "facialexpression";

/** 
* The facial expression streaming service defines the methods that are used for streaming data from the facial expression domain. 
* The methods define unconditional publishing of time-series data.
*/
service FacialExpressionStreamingService
{
    /** Produce and consume of facial expression data.*/
    oneway void			    FacialExpressionDataReceived    ( /** The identifier of the process that sends out the data.*/
                                                              1: Process.Process sender,

                                                              /** The facial expression data contains a list of facial expression samples, along with meta data like the source ID of 
                                                              *   the images or video for which the facial expressions were calculated.*/
                                                              2: FacialExpressionData.FacialExpressionData facialExpressionData);

    /** Produce and consume of restreamed facial expression data. Restreamed facial expression data is not a live stream of data but a data streaming on request.
    *   The request is made in the FacialExpressionService.SubmitRestreamingQuery.*/
    oneway void			    FacialExpressionDataRestreamed  ( /** The identifier of the process that sends out the data.*/
                                                  1: Process.Process sender,

                                                  /** The same object that was passed into the call to SubmitRestreamingQuery. Use the request ID in this streaming options
                                                  *   to identify the data that was requested by the RequestRestreamingQuery.*/
                                                  2: StreamingOptions.StreamingOptions streamingOptions,
                                                 
                                                  /** The facial expression data contains a list of facial expression samples, along with meta data like the source ID of 
                                                  *   the images or video for which the facial expressions were calculated.*/
                                                  3: FacialExpressionData.FacialExpressionData facialExpressionData,
                                                  
                                                  /** Progress information about the status of sending the restreamed data.*/
                                                  4: CommonTypes.ProgressInfo progressInfo);

}
