//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   PhysiologySkinConductanceStreamingService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 23-03-2022 Csaba Balazs - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Entities\\Process.thrift"
include "..\\..\\Common\\Entities\\StreamingOptions.thrift"
include "..\\..\\Common\\Entities\\EDAData.thrift"
include "..\\..\\Common\\Entities\\SkinConductanceData.thrift"

namespace * Noldus.NLinx.Contracts.Public.Services

/** The name of the RabbitMQ exchange on which the messages of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.Streaming.Physiology.SkinConductance"
/** This service runs on a topic exchange which allows fine-grained routing of all types of Physiology data.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.TOPIC

/** This service runs on a topic exchange that supports routing keys in the following format:
 *
 *  "{datatype}.{senderId}.{receiverId}"		see definition in CommonTypes.
 *
 *  datatype, supported values : skinconductance (lower case)
 *  senderId				   : the processId of the N-Linx process that is the producer of skin conductance data
 *  receiverId				   : mostly use "*", but can be used as the processId of the process that wants to receive the data
 *
 *  Example: "skinconductance.2254b828-7bc2-450f-b8d8-3f3da9511305.5d659955-cff5-44f8-bb8a-dc57e4fc08ee"
*/

/** The string definition for routing calculated skin conductance data. */
const string dataTypeSkinConductance = "skinconductance";

/** 
* The physiology skin conductance streaming service defines the methods that are used for streaming skin conductance data from the physiology domain. 
* The methods define unconditional publishing of time-series like data.
*/
service PhysiologySkinConductanceStreamingService
{
    /** Produce and consume of skin conductance data, i.e. derived data from raw processed EDA data. Specify skin conductance for the data type to receive this data stream.*/
    oneway void             SkinConductanceDataReceived ( /** The identifier of the process that sends out the data.*/
                                                            1: Process.Process sender,

                                                          /** Holds skin conductance samples plus meta data like the identifier of the collector.*/
                                                            2: SkinConductanceData.SkinConductanceData skinConductanceData);

    /** Produce and consume of restreamed skin conductance data. Restreamed data is not a live stream of skin conductance data but skin conductance data streamed on request.
    *   The request should made in the PhysiologyEdaService.SubmitRestreamingQuery, and specifying saveSkinConductanceDataToStorage = true in the PhysiologyStorageSettings.*/
    oneway void	            SkinConductanceDataRestreamed( /** The identifier of the process that sends out the data.*/
                                                             1: Process.Process sender,
                                                   
                                                           /** The same object that was passed into the call to SubmitRestreamingQuery. Use the request ID, which is part of the streaming options,
                                                           *   to identify the data that was requested by the RequestRestreamingQuery.*/
                                                             2: StreamingOptions.StreamingOptions streamingOptions,
                                                   
                                                           /** The skin conductance data that contains the list of skin conductance samples. 
                                                           *   It also contains meta data that defines a.o. to which EDA collector the skin conductance events belongs.*/
                                                             3: SkinConductanceData.SkinConductanceData skinConductanceData,
                                                   
                                                           /** Progress information about the status of sending the restreamed data.*/
                                                             4: CommonTypes.ProgressInfo progressInfo);
}

