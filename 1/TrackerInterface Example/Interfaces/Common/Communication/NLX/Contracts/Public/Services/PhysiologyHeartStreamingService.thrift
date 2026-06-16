//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   PhysiologyHeartStreamingService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 07-01-2022 Tijmen van Voorthuijsen - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Entities\\Process.thrift"
include "..\\..\\Common\\Entities\\StreamingOptions.thrift"
include "..\\..\\Common\\Entities\\ECGData.thrift"
include "..\\..\\Common\\Entities\\HeartData.thrift"

namespace * Noldus.NLinx.Contracts.Public.Services

/** The name of the RabbitMQ exchange on which the messages of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.Streaming.Physiology.Heart"
/** This service runs on a topic exchange which allows fine-grained routing of all types of Physiology data.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.TOPIC

/** This service runs on a topic exchange that supports routing keys in the following format:
 *
 *  "{datatype}.{senderId}.{receiverId}"		see definition in CommonTypes.
 *
 *  datatype, supported values : heart	(lower case)
 *  senderId				   : the processId of the N-Linx process that is the producer of heart data
 *  receiverId				   : mostly use "*", but can be used as the processId of the process that wants to receive the data
 *
 *  Example: "heart.2254b828-7bc2-450f-b8d8-3f3da9511305.5d659955-cff5-44f8-bb8a-dc57e4fc08ee"
*/

/** The string definition for routing calculated heart data. */
const string dataTypeHeart = "heart";

/** 
* The physiology heart streaming service defines the methods that are used for streaming heart data from the physiology domain. 
* The methods define unconditional publishing of time-series like data.
*/
service PhysiologyHeartStreamingService
{
    /** Produce and consume of heart data, i.e. derived data from raw processed ECG or PPG data. Specify heart for the data type to receive this data stream.*/
    oneway void             HeartDataReceived ( /** The identifier of the process that sends out the data.*/
                                                  1: Process.Process sender,

                                                  /** Holds heart samples plus meta data like the identifier of the collector.*/
                                                  2: HeartData.HeartData heartData);

    /** Produce and consume of restreamed heart data. Restreamed data is not a live stream of heart data but heart data streamed on request.
    *   The request should made in the PhysiologyEcgService.SubmitRestreamingQuery, and specifying saveHeartDataToStorage = true in the PhysiologyStorageSettings.*/
    oneway void	            HeartDataRestreamed( /** The identifier of the process that sends out the data.*/
                                                   1: Process.Process sender,
                                                   
                                                   /** The same object that was passed into the call to SubmitRestreamingQuery. Use the request ID, which is part of the streaming options,
                                                   *   to identify the data that was requested by the RequestRestreamingQuery.*/
                                                   2: StreamingOptions.StreamingOptions streamingOptions,
                                                   
                                                   /** The heart data that contains the list of heart samples. 
                                                   *   It also contains meta data that defines a.o. to which ecg collector the heart events belongs.*/
                                                   3: HeartData.HeartData heartData,
                                                   
                                                   /** Progress information about the status of sending the restreamed data.*/
                                                   4: CommonTypes.ProgressInfo progressInfo);
}
