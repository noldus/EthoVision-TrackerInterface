//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   EventStreamingService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 18-07-2022 Adrian Kovacs             - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Entities\\Process.thrift"
include "..\\..\\Common\\Entities\\StreamingOptions.thrift"
include "..\\..\\Common\\Entities\\Event.thrift"


namespace * Noldus.NLinx.Contracts.Public

/** The name of the RabbitMQ exchange on which the communication of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.EventStreamingService"
/** This service runs on a topic exchange which allows fine-grained routing of all types of event data.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.TOPIC

/** This service runs on a topic exchange that supports routing keys in the following format:
 *
 *  "{datatype}.{senderId}.{receiverId}"		see definition in CommonTypes.
 *
 *  datatype, supported values : event
 *  senderId				   : the processId of the N-Linx process that is the producer of event data
 *  receiverId				   : mostly use "*", but can be used as the processId of the process that wants to receive the data
 *
 *  Example: "event.2254b828-7bc2-450f-b8d8-3f3da9511305.5d659955-cff5-44f8-bb8a-dc57e4fc08ee"
*/

/** The string definition for routing event data. */
const string dataTypeEvent = "event";

/** 
* The command interface to operate the event streaming service. 
*/
service EventStreamingService
{
    /** Callback function, answer for RequestRestreaming, which gives back the requested events */
    oneway void	            EventDataRestreamed( /** The identifier of the process that sends out the data.*/
                                                   1: Process.Process sender,
                                                   
                                                   /** The same object that was passed into the call to SubmitRestreamingQuery. Use the request ID, which is part of the streaming options,
                                                   *   to identify the data that was requested by the RequestRestreamingQuery.*/
                                                   2: StreamingOptions.StreamingOptions streamingOptions,
                                                   
                                                   /** The requested events. */
                                                   3: Event.EventData eventData,
                                                   
                                                   /** Progress information about the status of sending the restreamed data.*/
                                                   4: CommonTypes.ProgressInfo progressInfo);


}