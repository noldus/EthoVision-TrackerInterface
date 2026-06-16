//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   EyeTrackingStreamingService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 09-08-2018 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Entities\\EyeData.thrift"
include "..\\..\\Common\\Entities\\GazeData.thrift"
include "..\\..\\Common\\Entities\\GazePoint.thrift"
include "..\\..\\Common\\Entities\\Process.thrift"
include "..\\..\\Common\\Entities\\EyeMovementData.thrift"
include "..\\..\\Common\\Entities\\StreamingOptions.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** The name of the RabbitMQ exchange on which the messages of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.Streaming.EyeTracking"
/** This service runs on a topic exchange which allows fine-grained routing of all types of eye tracking data.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.TOPIC

/** This service runs on a topic exchange that supports routing keys in the following format:
 *
 *  "{datatype}.{senderId}.{receiverId}"		see definition in CommonTypes.
 *
 *  datatype, supported values : gaze, eyemovement	(lower case)
 *  senderId				   : the processId of the N-Linx process that is the producer of eye tracking data
 *  receiverId				   : mostly use "*", but can be used as the processId of the process that wants to receive the data
 *
 *  Example: "gaze.2254b828-7bc2-450f-b8d8-3f3da9511305.5d659955-cff5-44f8-bb8a-dc57e4fc08ee"
*/
/** The string definition for routing raw gaze data. */
const string dataTypeGaze = "gaze";

/** The string definition for routing calculated eye movement data. */
const string dataTypeEyeMovement = "eyemovement";

/** 
* The eye tracking streaming service defines the methods that are used for streaming data from the eye tracking domain. 
* The methods define unconditional publishing of time-series data.
*/
service EyeTrackingStreamingService
{
    /** Produce and consume of gaze data. Specify gaze for the data type to receive this data stream.*/
    oneway void			    GazeDataReceived    ( /** The identifier of the process that sends out the data.*/
                                                  1: Process.Process sender,

                                                  /** A list of gaze data.*/
                                                  2: list<GazeData.GazeData> gazeData);

    /** Produce and consume of calculated eye movement data. To send this data specify "eyemovement" for the data type in the routing key. To receive this
    *   data specify "eyemovement" or "*" in the routing key.*/
    oneway void             EyeMovementReceived ( /** The identifier of the process that sends out the data.*/
                                                  1: Process.Process sender,

                                                  /** The eye movement data contains the list of eye movement samples, the calculated fixations and saccades. 
                                                  *   Second, it contains meta data that defines a.o. to which eye tracker the eye movement events belongs.*/
                                                  2: EyeMovementData.EyeMovementData eyeMovementData);

    /** Produce and consume of restreamed gaze data. Restreamed gaze data is not a live stream of gaze data but a gaze data streaming on request.
    *   The request is made in the EyeTrackingService.SubmitRestreamingQuery.*/
    oneway void			    GazeDataRestreamed  ( /** The identifier of the process that sends out the data.*/
                                                  1: Process.Process sender,

                                                  /** The same object that was passed into the call to SubmitRestreamingQuery. Use the request ID in this streaming options
                                                  *   to identify the data that was requested by the RequestRestreamingQuery.*/
                                                  2: StreamingOptions.StreamingOptions streamingOptions,
                                                 
                                                  /** The list of requested and queried gaze data .*/
                                                  3: list<GazeData.GazeData> gazeData,
                                                  
                                                  /** Progress information about the status of sending the restreamed data.*/
                                                  4: CommonTypes.ProgressInfo progressInfo);

    /** Produce and consume of restreamed eye movement, like fixations. Restreamed data is not a live stream of movement data but eye movement streaming on request.
    *   The request is made in the EyeTrackingService.SubmitRestreamingQuery, and specifying movementDataToStorage = true in the EyeTrackingStorageSettings.*/
    oneway void			    EyeMovementRestreamed( /** The identifier of the process that sends out the data.*/
                                                   1: Process.Process sender,
                                                   
                                                   /** The same object that was passed into the call to SubmitRestreamingQuery. Use the request ID, which is part of the streaming options,
                                                   *   to identify the data that was requested by the RequestRestreamingQuery.*/
                                                   2: StreamingOptions.StreamingOptions streamingOptions,
                                                   
                                                   /** The eye movement data that contains the list of eye movement samples, the calculated fixations and saccades. 
                                                   *   It also contains meta data that defines a.o. to which eye tracker the eye movement events belongs.*/
                                                   3: EyeMovementData.EyeMovementData eyeMovementData,
                                                   
                                                   /** Progress information about the status of sending the restreamed data.*/
                                                   4: CommonTypes.ProgressInfo progressInfo);
}
