//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   PhysiologyPpgStreamingService.thrift
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Entities\\Process.thrift"
include "..\\..\\Common\\Entities\\StreamingOptions.thrift"
include "..\\..\\Common\\Entities\\PPGData.thrift"
include "..\\..\\Common\\Entities\\HeartData.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** The name of the RabbitMQ exchange on which the messages of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.Streaming.Physiology.Ppg"
/** This service runs on a topic exchange which allows fine-grained routing of all types of Physiology data.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.TOPIC

/** This service runs on a topic exchange that supports routing keys in the following format:
 *
 *  "{datatype}.{senderId}.{receiverId}"		see definition in CommonTypes.
 *
 *  datatype, supported values : ppg
 *  senderId				   : the processId of the N-Linx process that is the producer of ppg data
 *  receiverId				   : mostly use "*", but can be used as the processId of the process that wants to receive the data
 *
 *  Example: "ppg.2254b828-7bc2-450f-b8d8-3f3da9511305.5d659955-cff5-44f8-bb8a-dc57e4fc08ee"
*/

/** The string definition for routing raw ppg data. */
const string dataTypePpg = "ppg";

/** 
* The physiology streaming service defines the methods that are used for streaming data from the physiology domain. 
* The methods define unconditional publishing of time-series data.
*/
service PhysiologyPpgStreamingService
{
    /** Produce and consume of ppg data. Specify ppg for the data type to receive this data stream.*/
    oneway void             PpgDataReceived ( /** The identifier of the process that sends out the data.*/
                                                  1: Process.Process sender,

                                                  /** Holds PPG samples plus meta data like the identifier of the collector.*/
                                                  2: PPGData.PPGData ppgData);
   
    /** Produce and consume of restreamed PPG data. Restreamed data is not a live stream of PPG data but PPG data streaming on request.
    *   The request is made in the PhysiologyPpgService.SubmitRestreamingQuery, and specifying savePpgDataToStorage = true in the PhysiologyStorageSettings.*/
    oneway void	            PpgDataRestreamed( /** The identifier of the process that sends out the data.*/
                                                   1: Process.Process sender,
                                                   
                                                   /** The same object that was passed into the call to SubmitRestreamingQuery. Use the request ID, which is part of the streaming options,
                                                   *   to identify the data that was requested by the RequestRestreamingQuery.*/
                                                   2: StreamingOptions.StreamingOptions streamingOptions,
                                                   
                                                   /** The PPG data that contains the list of PPG samples. 
                                                   *   It also contains meta data that defines a.o. to which PPG collector the data belongs.*/
                                                   3: PPGData.PPGData ppgData,
                                                   
                                                   /** Progress information about the status of sending the restreamed data.*/
                                                   4: CommonTypes.ProgressInfo progressInfo);
}
