//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   EyeTrackingService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 18-09-2018 Tijmen van Voorthuijsen   - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"
include "..\\..\\Common\\Entities\\Process.thrift"
include "..\\..\\Common\\Entities\\EyeTrackingStorageSettings.thrift"
include "..\\..\\Common\\Entities\\StreamingTicket.thrift"
include "..\\..\\Common\\Entities\\StreamingOptions.thrift"

namespace * Noldus.NLinx.Contracts.Public

/** Version of the interface.*/
const i32         interfaceVersion          = 1;
/** The name of the RabbitMQ exchange on which the communication of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.EyeTrackingService"
/** The eye tracking service runs on a direct exchange.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.DIRECT

const string      routingKey                = "ef6221b4-e83a-42e2-95ff-20fb0bf6bbaa"

/** 
* The command interface to operate the eye tracking (ET) service. 
*/
service EyeTrackingService extends CommonService.CommonService
{
    /**  Resets all processing information used by an eye tracker processor.*/
    void                            ResetProcessing             (/** Must be a valid and existing eyetracker process Id. */
                                                                 1: CommonTypes.GUID processId,
                                                                 
                                                                 /** The sampling frequency of an eye tracking system refers to how many times per second the position of the eyes is registered by the eye tracker.*/	
                                                                 2: double samplingFrequency
                                                                 ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /**  Starts saving the live eye tracking data to long-term storage.*/
    void                            StartSavingEyeTrackingData  (/** Settings that specify which eye data to store and when.*/
                                                                 1: EyeTrackingStorageSettings.EyeTrackingStorageSettings storageSettings) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /**  Stops saving the live eye tracking data to long-term storage.*/
    void                            StopSavingEyeTrackingData   (/** Settings that specify which eye data to store and when.*/
                                                                 1: EyeTrackingStorageSettings.EyeTrackingStorageSettings storageSettings) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /**  Starts saving movement data to long-term storage.*/
    void                            StartSavingMovementData     (/** Settings that specify which movement data to store and when.*/
                                                                 1: EyeTrackingStorageSettings.EyeTrackingStorageSettings storageSettings) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /**  Stops saving movement data to long-term storage.*/
    void                            StopSavingMovementData      (/** Settings that specify which movement data to store and when.*/
                                                                 1: EyeTrackingStorageSettings.EyeTrackingStorageSettings storageSettings) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /** Deletes the eye tracking data for a specified eye tracker ID and a begind and end time.*/
    void                            DeleteEyeTrackingData       (/** Settings that specify which eye data should be deleted.*/
                                                                 1: list<EyeTrackingStorageSettings.EyeTrackingStorageSettings> storageSettingsList) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);                                 

    /** Request a query to instruct the eye tracking service to stream out gaze or movement data on demand. The stream of data will be received 
    /*  through the EyeTrackingStreamingService.
    */
    StreamingTicket.StreamingTicket RequestRestreamingQuery	    (/** The process that submits the query and wants to receive the eye tracking data via the streaming service. Put in here
                                                                 /*  the N-Linx my process */
                                                                 1: Process.Process sender,
                                                                 
                                                                 /** Specifies the query, in terms of storage settings, that specifies which gaze and or movement data to be retrieved.*/
                                                                 2: EyeTrackingStorageSettings.EyeTrackingStorageSettings eyeTrackingStorageSettings,

                                                                 /** Defines in what way the data should be restreamed and also the receiver part of the restreaming routing key.*/
                                                                 3: StreamingOptions.StreamingOptions streamingOptions
                                                                 ) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /** Cancel a submitted restreaming query. 
    /*  @exceptions No specifics
    */ 
    void							CancelRestreamingQuery	    (/** The N-Linx process that wants to release the live query.*/
                                                                 1: Process.Process sender,
                                                                 
                                                                 /** The streaming ticket that was received in the call to SubmitReStreamingQuery.*/	
                                                                 2: StreamingTicket.StreamingTicket token) throws(1: CommonTypes.ApplicationException appEx, 2: CommonTypes.SystemException sysEx);
}
