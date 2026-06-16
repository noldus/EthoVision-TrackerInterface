//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   FacialExpressionService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 15-07-2020 Cecilia Herrera   - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"
include "..\\..\\Common\\Entities\\Process.thrift"
include "..\\..\\Common\\Entities\\FacialExpressionStorageSettings.thrift"
include "..\\..\\Common\\Entities\\StreamingTicket.thrift"
include "..\\..\\Common\\Entities\\StreamingOptions.thrift"


namespace * Noldus.NLinx.Contracts.Public

/** Version of the interface.*/
const i32         interfaceVersion          = 1;
/** The name of the RabbitMQ exchange on which the communication of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.FacialExpressionService"
/** The facial expression service runs on a direct exchange.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.DIRECT

const string      routingKey                = "9bac67e9-7adf-4a11-9182-920e64fbb429"

/** 
* The command interface to operate the facial expression service. 
*/
service FacialExpressionService extends CommonService.CommonService
{
    /**  Starts saving the live facial expression data to long-term storage.*/
    void                            StartSavingFacialExpressionData  (/** Settings that specify which eye data to store and when.*/
                                                                 1: FacialExpressionStorageSettings.FacialExpressionStorageSettings storageSettings) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /**  Stops saving the live facial expression data to long-term storage.*/
    void                            StopSavingFacialExpressionData   (/** Settings that specify which eye data to store and when.*/
                                                                 1: FacialExpressionStorageSettings.FacialExpressionStorageSettings storageSettings) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /** Deletes the facial expression data for a specified eye tracker ID and a begind and end time.*/
    void                            DeleteFacialExpressionData       (/** Settings that specify which facial expression data should be deleted.*/
                                                                 1: list<FacialExpressionStorageSettings.FacialExpressionStorageSettings> storageSettingsList) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);                                 

    /** Request a query to instruct the facial expression service to stream out facial expression or facial analysis data on demand. The stream of data will be received 
    /*  through the FacialExpressionStreamingService.
    */
    StreamingTicket.StreamingTicket RequestRestreamingQuery	    (/** The process that submits the query and wants to receive the facial expression data via the streaming service. Put in here
                                                                 /*  the N-Linx my process */
                                                                 1: Process.Process sender,
                                                                 
                                                                 /** Specifies the query, in terms of storage settings, that specifies which facial expression and or facial analysis data to be retrieved.*/
                                                                 2: FacialExpressionStorageSettings.FacialExpressionStorageSettings facialExpressionTrackingStorageSettings,

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

    /** Resets all tracking information used for processing arriving raw images. This function should be called for each new participant. 
    *   @return void - no return information
    *   @exceptions No specifics
    */ 
    void						    ResetFaceTracking           (/** The process that wants to reset face tracking. This process must be a master of the process that implements the reset.
                                                                  *  When you are making the request you should pass in my process.*/
                                                                  1: Process.Process sender,
                                                                 
                                                                 /** ID of the image source for which reset should be done.*/	
                                                                  2: CommonTypes.GUID imageSourceId) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /** Sets the live calibration in the facial expression processor on or off. Live calibration is an ongoing process during the face analysis.
    *   @return void - no return information
    *   @exceptions No specifics
    */ 
    void						    EnableLiveCalibration       (/** Process which requested configuration of live calibration of the facial expression processor.
                                                                  *  When you are making the request you should pass in my process.*/
                                                                  1: Process.Process sender,

                                                                 /** ID of the image source for which setting of calibration should be done.*/	
                                                                  2: CommonTypes.GUID imageSourceId,

                                                                 /** True if live calibration is enabled, otherwise false.*/	
                                                                  3: bool isCalibrationEnabled) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);
}
