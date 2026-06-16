//----------------------------------------------------------------------------
// N O L D U S   I N F O R M A T I O N   T E C H N O L O G Y   B . V .
//----------------------------------------------------------------------------
// Project    :   N-Linx
// Module     :   Public Contracts
// File       :   GenericService.thrift
//----------------------------------------------------------------------------
// Revisions  :
// 15-01-2022 Rogier Giesen   - Original version
//----------------------------------------------------------------------------

include "..\\..\\Common\\Types\\CommonTypes.thrift"
include "..\\..\\Common\\Interfaces\\CommonService.thrift"
include "..\\..\\Common\\Entities\\Process.thrift"
include "..\\..\\Common\\Entities\\GenericStorageSettings.thrift"
include "..\\..\\Common\\Entities\\StreamingTicket.thrift"
include "..\\..\\Common\\Entities\\StreamingOptions.thrift"


namespace * Noldus.NLinx.Contracts.Public

/** Version of the interface.*/
const i32         interfaceVersion          = 1;
/** The name of the RabbitMQ exchange on which the communication of this service runs.*/
const string      exchange                  = "Noldus.NLinx.Public.GenericService"
/** The Generic service runs on a direct exchange.*/
const CommonTypes.ExchangeType exchangeType = CommonTypes.ExchangeType.DIRECT

const string      routingKey                = "ce5e26bc-593b-490c-8042-d3e346ca6ac9"

/** 
* The command interface to operate the Generic service. 
*/
service GenericService extends CommonService.CommonService
{
    /**  Starts saving the live Generic data to long-term storage.*/
    void                            StartSavingGenericData  (/** Settings that specify which data to store and when.*/
                                                                 1: GenericStorageSettings.GenericStorageSettings storageSettings) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /**  Stops saving the live Generic data to long-term storage.*/
    void                            StopSavingGenericData   (/** Settings that specify which data to store and when.*/
                                                                 1: GenericStorageSettings.GenericStorageSettings storageSettings) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

    /** Deletes the Generic data for a specified eye tracker ID and a begin and end time.*/
    void                            DeleteGenericData       (/** Settings that specify which Generic data should be deleted.*/
                                                                 1: list<GenericStorageSettings.GenericStorageSettings> storageSettingsList) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);                                 

    /** Request a query to instruct the Generic service to stream out data on demand. The stream of data will be received  through the GenericStreamingService. */
    StreamingTicket.StreamingTicket RequestRestreamingQuery	    (/** The process that submits the query and wants to receive the Generic data via the streaming service. Put in here
                                                                 /*  the N-Linx my process */
                                                                 1: Process.Process sender,
                                                                 
                                                                 /** Specifies the query, in terms of storage settings, that specifies which Generic data to be retrieved.*/
                                                                 2: GenericStorageSettings.GenericStorageSettings genericStorageSettings,

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

    /** Resets all work load information used for processing arriving raw images and eye tracking. This function should be called for each new participant. 
    *   @return void - no return information
    *   @exceptions No specifics
    */ 
    void						    ResetState           (/** The process that wants to reset any state in data processing. This process must be a master of the process that implements the reset.
                                                                  *  When you are making the request you should pass in my process.*/
                                                                  1: Process.Process sender,
                                                                 
                                                                 /** ID of the source for which reset should be done.*/	
                                                                  2: CommonTypes.GUID sourceId) throws(1: CommonTypes.ApplicationException appEx, 2 : CommonTypes.SystemException sysEx);

}
