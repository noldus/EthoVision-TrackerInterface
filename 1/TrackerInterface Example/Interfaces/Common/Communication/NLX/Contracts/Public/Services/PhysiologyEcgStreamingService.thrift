//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   PhysiologyEcgStreamingService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 28-01-2021 Cecilia Herrera   - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Entities\\Process.thrift"
include "..\\..\\Common\\Entities\\StreamingOptions.thrift"
include "..\\..\\Common\\Entities\\ECGData.thrift"
include "..\\..\\Common\\Entities\\HeartData.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** The name of the RabbitMQ exchange on which the messages of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.Streaming.Physiology.Ecg"
/** This service runs on a topic exchange which allows fine-grained routing of all types of Physiology data.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.TOPIC

/** This service runs on a topic exchange that supports routing keys in the following format:
 *
 *  "{datatype}.{senderId}.{receiverId}"		see definition in CommonTypes.
 *
 *  datatype, supported values : ecg, heart	(lower case)
 *  senderId				   : the processId of the N-Linx process that is the producer of ecg data
 *  receiverId				   : mostly use "*", but can be used as the processId of the process that wants to receive the data
 *
 *  Example: "ecg.2254b828-7bc2-450f-b8d8-3f3da9511305.5d659955-cff5-44f8-bb8a-dc57e4fc08ee"
*/

/** The string definition for routing raw ecg data. */
const string dataTypeEcg = "ecg";

/** The string definition for routing calculated heart data. */
const string dataTypeHeart = "heart";

/** 
* The physiology streaming service defines the methods that are used for streaming data from the physiology domain. 
* The methods define unconditional publishing of time-series data.
*/
service PhysiologyEcgStreamingService
{
    /** Produce and consume of ecg data. Specify ecg for the data type to receive this data stream.*/
    oneway void             EcgDataReceived ( /** The identifier of the process that sends out the data.*/
                                                  1: Process.Process sender,

                                                  /** Holds ECG samples plus meta data like the identifier of the collector.*/
                                                  2: ECGData.ECGData ecgData);

    /**   Produce and consume of restreamed ECG data. Restreamed data is not a live stream of ECG data but ECG data streaming on request.
    *   The request is made in the PhysiologyEcgService.SubmitRestreamingQuery, and specifying saveEcgDataToStorage = true in the PhysiologyStorageSettings.*/
    oneway void	            EcgDataRestreamed( /** The identifier of the process that sends out the data.*/
                                                   1: Process.Process sender,
                                                   
                                                   /** The same object that was passed into the call to SubmitRestreamingQuery. Use the request ID, which is part of the streaming options,
                                                   *   to identify the data that was requested by the RequestRestreamingQuery.*/
                                                   2: StreamingOptions.StreamingOptions streamingOptions,
                                                   
                                                   /** The ECG data that contains the list of ECG samples. 
                                                   *   It also contains meta data that defines a.o. to which ecg collector the data belongs.*/
                                                   3: ECGData.ECGData ecgData,
                                                   
                                                   /** Progress information about the status of sending the restreamed data.*/
                                                   4: CommonTypes.ProgressInfo progressInfo);
}
