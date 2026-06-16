//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   CognitiveWorkloadService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 03-03-2023 Leon Wiertz - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"
include "..\\..\\Common\\Entities\\Process.thrift"
include "..\\..\\Common\\Entities\\CognitiveLoadStorageSettings.thrift"
include "..\\..\\Common\\Entities\\StreamingTicket.thrift"
include "..\\..\\Common\\Entities\\StreamingOptions.thrift"

namespace * Noldus.NLinx.Contracts.Public.Services

/** Version of the interface.*/
const i32         interfaceVersion          = 1;
/** The name of the RabbitMQ exchange on which the communication of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.CognitiveWorkloadService"
/** The session service runs on a direct exchange.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.DIRECT
/** This service has a fixed routing key, to direct the messages to.*/
const string      routingKey                = "f1372627-23d3-49e9-9ebc-bd435132f31d"

/** 
* The command interface to operate the cognitive workload service. 
* 
*/
service CognitiveWorkloadService extends CommonService.CommonService
{
    /**  Starts saving the live data to long-term storage.*/
    void                            StartSavingData  (/** Settings that specify which data to store and when.*/
                                                                 1: CognitiveLoadStorageSettings.CognitiveLoadStorageSettings storageSettings) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /**  Stops saving the live data to long-term storage.*/
    void                            StopSavingCognitiveLoadData   (/** Settings that specify which eye data to store and when.*/
                                                                 1: CognitiveLoadStorageSettings.CognitiveLoadStorageSettings storageSettings) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /** Deletes the data for a specified eye tracker ID and a begin and end time.*/
    void                            DeleteCognitiveLoadData       (/** Settings that specify which facial expression data should be deleted.*/
                                                                 1: list<CognitiveLoadStorageSettings.CognitiveLoadStorageSettings> storageSettingsList) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);                                 

    /** Request a query to instruct the service to stream out data on demand. The stream of data will be received through the CognitiveLoadStreamingService.*/
    StreamingTicket.StreamingTicket RequestRestreamingQuery	    (/** The process that submits the query and wants to receive the data via the streaming service. Put in here
                                                                 /*  the N-Linx my process */
                                                                 1: Process.Process sender,
                                                                 
                                                                 /** Specifies the query, in terms of storage settings, that specifies which data to be retrieved.*/
                                                                 2: CognitiveLoadStorageSettings.CognitiveLoadStorageSettings CognitiveLoadTrackingStorageSettings,

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

    /** It returns the cognitive load models to their initial / fresh state and should be sent whenever a new evaluation begins or the tracked person changes. 
    *   @return void - no return information
    *   @exceptions No specifics
    */ 
    void						    ResetModel                   (/** The process that wants to reset the model. This process must be a master of the process that implements the reset.
                                                                  *  When you are making the request you should pass in my process.*/
                                                                  1: Process.Process sender,
                                                                 
                                                                 /** ID of the cwl by computer name.*/	
                                                                  2: string computerName) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

}