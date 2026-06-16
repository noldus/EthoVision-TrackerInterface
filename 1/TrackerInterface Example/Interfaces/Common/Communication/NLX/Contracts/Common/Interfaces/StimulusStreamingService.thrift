//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   StimulusLoggingStreamingService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 11-03-2019 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------

include "..\\Types\\CommonTypes.thrift"
include "..\\Entities\\Process.thrift"
include "..\\Entities\\StimulusData.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** The name of the RabbitMQ exchange on which the messages of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.Streaming.Stimulus"
/** This service runs on a topic exchange which allows fine-grained routing of all types of eye tracking data.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.TOPIC

/** This service runs on a topic exchange that supports routing keys in the following format:
 *
 *  "{datatype}.{senderId}.{receiverId}"		see definition in CommonTypes.
 *
 *  datatype, supported values : gaze	(lower case)
 *  senderId				   : the programId of the storage service
 *  receiverId				   : the programId of the process that wants to receive the data
 *
 *  Example: "timeseries.2254b828-7bc2-450f-b8d8-3f3da9511305.5d659955-cff5-44f8-bb8a-dc57e4fc08ee"
*/
/** The string definition for routing raw stimulus data. */
const string dataTypeStimulus = "stimulus";

/** 
* The stimulus logging streaming service defines the methods that are used for streaming data in the stimulus logging domain. 
* The methods define unconditional publishing of time-series like data.
*/
service StimulusStreamingService
{
    /** Produce and consume of stimulus data. Specify 'stimulus' for the data type to receive this data stream.*/
    oneway void			    StimulusDataReceived(   /** The identifier of the process that sends out the data.*/
                                                    1: Process.Process sender,

                                                    /** One or more stimulus events.*/
                                                    2: StimulusData.StimulusData stimulusData);

}
